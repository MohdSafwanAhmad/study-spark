// app/javascript/flashcards.js
let currentCardIndex = {};
let flashcardQueues = {}; // To track cards that need practice

// Make functions globally available
window.initializeFlashcards = initializeFlashcards;
window.showCurrentCard = showCurrentCard;
window.nextCard = nextCard;
window.previousCard = previousCard;
window.revealAnswer = revealAnswer;
window.markSolved = markSolved;
window.restartFlashcards = restartFlashcards;

function initializeFlashcards(materialIndex) {
  console.log(`Initializing flashcards for material ${materialIndex}`);
  
  currentCardIndex[materialIndex] = 0;
  
  // Initialize the queue with all flashcards
  const container = document.getElementById(`flashcard-container-${materialIndex}`);
  if (container) {
    const allCards = container.querySelectorAll('.flashcard-wrapper');
    flashcardQueues[materialIndex] = Array.from(allCards).map((card, index) => ({
      element: card,
      originalIndex: index,
      flashcardId: parseInt(card.dataset.flashcardId),
      needsPractice: false
    }));
  }
  
  showCurrentCard(materialIndex);
  updateNavigation(materialIndex);
  updateProgress(materialIndex);
}

function showCurrentCard(materialIndex) {
  const container = document.getElementById(`flashcard-container-${materialIndex}`);
  if (!container || !flashcardQueues[materialIndex]) {
    console.log(`Container or queue not found for material ${materialIndex}`);
    return;
  }

  const queue = flashcardQueues[materialIndex];
  const totalCards = queue.length;
  
  console.log(`Showing card ${currentCardIndex[materialIndex]} of ${totalCards} for material ${materialIndex}`);
  
  // Hide all cards and reset their state
  queue.forEach((cardData, index) => {
    cardData.element.style.display = 'none';
    cardData.element.classList.remove('active');
    
    // Reset question/answer display for ALL cards
    const questionSide = cardData.element.querySelector('.flashcard-question');
    const answerSide = cardData.element.querySelector('.flashcard-answer');
    
    if (questionSide && answerSide) {
      questionSide.style.display = 'block';
      answerSide.style.display = 'none';
    }
  });
  
  // Show current card
  if (totalCards > 0 && currentCardIndex[materialIndex] < totalCards) {
    const currentCardData = queue[currentCardIndex[materialIndex]];
    const currentCard = currentCardData.element;
    
    currentCard.style.display = 'block';
    currentCard.classList.add('active');
    
    // Update counter
    const counter = document.getElementById(`card-counter-${materialIndex}`);
    if (counter) {
      counter.textContent = currentCardIndex[materialIndex] + 1;
    }
  }
  
  // Check if all cards are completed
  checkCompletion(materialIndex);
}


function nextCard(materialIndex) {
  console.log(`Next card clicked for material ${materialIndex}`);
  
  if (!flashcardQueues[materialIndex]) return;
  
  const queue = flashcardQueues[materialIndex];
  const totalCards = queue.length;
  
  if (currentCardIndex[materialIndex] < totalCards - 1) {
    currentCardIndex[materialIndex]++;
    showCurrentCard(materialIndex);
    updateNavigation(materialIndex);
  }
}

function previousCard(materialIndex) {
  console.log(`Previous card clicked for material ${materialIndex}`);
  
  if (currentCardIndex[materialIndex] > 0) {
    currentCardIndex[materialIndex]--;
    showCurrentCard(materialIndex);
    updateNavigation(materialIndex);
  }
}

function updateNavigation(materialIndex) {
  if (!flashcardQueues[materialIndex]) return;
  
  const totalCards = flashcardQueues[materialIndex].length;
  const prevBtn = document.getElementById(`prev-btn-${materialIndex}`);
  const nextBtn = document.getElementById(`next-btn-${materialIndex}`);
  
  if (prevBtn) {
    prevBtn.disabled = currentCardIndex[materialIndex] === 0;
  }
  
  if (nextBtn) {
    nextBtn.disabled = currentCardIndex[materialIndex] >= totalCards - 1;
  }
}

function revealAnswer(materialIndex, cardIndex) {
  console.log(`Revealing answer for material ${materialIndex}, card ${cardIndex}`);
  
  const questionSide = document.getElementById(`question-${materialIndex}-${cardIndex}`);
  const answerSide = document.getElementById(`answer-${materialIndex}-${cardIndex}`);
  
  if (questionSide && answerSide) {
    questionSide.style.display = 'none';
    answerSide.style.display = 'block';
  }
}

function markSolved(event, flashcardId, solved, materialIndex) {
  event.stopPropagation();
  event.preventDefault();
  
  console.log(`Marking flashcard ${flashcardId} as ${solved ? 'solved' : 'needs practice'} for material ${materialIndex}`);
  
  // Get CSRF token more reliably
  const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || 
                   document.querySelector('[name="csrf-token"]')?.content;
  
  if (!csrfToken) {
    console.error('CSRF token not found');
    alert('Security token not found. Please refresh the page and try again.');
    return;
  }
  
  // Get material ID from the container
  const container = document.getElementById(`flashcard-container-${materialIndex}`);
  const materialId = container?.dataset?.materialId;
  
  if (!materialId) {
    console.error('Material ID not found');
    alert('Material ID not found. Please refresh the page and try again.');
    return;
  }
  
  // Send AJAX request to update the flashcard
  fetch(`/materials/${materialId}/flashcards/${flashcardId}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrfToken,
      'Accept': 'application/json'
    },
    body: JSON.stringify({
      solved: solved
    })
  })
  .then(response => {
    console.log('Response status:', response.status);
    if (!response.ok) {
      // Log response for debugging
      return response.text().then(text => {
        console.error('Server response:', text);
        throw new Error(`HTTP error! status: ${response.status}`);
      });
    }
    return response.json();
  })
  .then(data => {
    console.log('Server response:', data);
    
    if (data.status === 'success') {
      // Update the current card's visual state
      const currentWrapper = document.querySelector(`[data-flashcard-id="${flashcardId}"]`);
      if (currentWrapper) {
        const flashcard = currentWrapper.querySelector('.flashcard');
        
        if (solved) {
          flashcard.classList.add('solved');
          // Remove from queue if solved
          removeFromQueue(materialIndex, flashcardId);
        } else {
          flashcard.classList.remove('solved');
          // Move to end of queue for practice
          moveToEndOfQueue(materialIndex, flashcardId);
        }
      }
      
      // Update progress
      updateProgress(materialIndex);
      

    } else {
      throw new Error(data.message || 'Unknown error occurred');
    }
  })
  .catch(error => {
    console.error('Error updating flashcard:', error);
    alert(`Error updating flashcard: ${error.message}. Please try again.`);
  });
}

function removeFromQueue(materialIndex, flashcardId) {
  if (!flashcardQueues[materialIndex]) return;
  
  const queue = flashcardQueues[materialIndex];
  const cardIndex = queue.findIndex(card => card.flashcardId === flashcardId);
  
  if (cardIndex !== -1) {
    // Remove the card from the queue
    queue.splice(cardIndex, 1);
    
    // Adjust current index if necessary
    if (currentCardIndex[materialIndex] >= cardIndex && currentCardIndex[materialIndex] > 0) {
      currentCardIndex[materialIndex]--;
    }
    
    console.log(`Removed card ${flashcardId} from queue. New length: ${queue.length}`);
  }
}

function moveToEndOfQueue(materialIndex, flashcardId) {
  if (!flashcardQueues[materialIndex]) return;
  
  const queue = flashcardQueues[materialIndex];
  const cardIndex = queue.findIndex(card => card.flashcardId === flashcardId);
  
  if (cardIndex !== -1) {
    // Remove card from current position and add to end
    const cardData = queue.splice(cardIndex, 1)[0];
    cardData.needsPractice = true;
    queue.push(cardData);
    
    // Adjust current index if necessary
    if (currentCardIndex[materialIndex] >= cardIndex) {
      if (currentCardIndex[materialIndex] >= queue.length) {
        currentCardIndex[materialIndex] = Math.max(0, queue.length - 1);
      }
    }
    
    console.log(`Moved card ${flashcardId} to end of queue for practice`);
  }
}

function updateProgress(materialIndex) {
  const container = document.getElementById(`flashcard-container-${materialIndex}`);
  if (!container) return;
  
  // Count solved cards by checking the DOM
  const allCards = container.querySelectorAll('.flashcard-wrapper');
  const solvedCards = container.querySelectorAll('.flashcard.solved');
  
  const solvedCount = solvedCards.length;
  const totalCount = allCards.length;
  const percentage = totalCount > 0 ? (solvedCount / totalCount * 100) : 0;
  
  console.log(`Progress update: ${solvedCount}/${totalCount} (${percentage}%)`);
  
  // Update progress text
  const progressText = document.getElementById(`progress-text-${materialIndex}`);
  if (progressText) {
    progressText.textContent = `${solvedCount}/${totalCount} mastered`;
  }
  
  // Update progress bar
  const progressBar = document.getElementById(`progress-bar-${materialIndex}`);
  if (progressBar) {
    progressBar.style.width = `${percentage}%`;
  }
}

function checkCompletion(materialIndex) {
  if (!flashcardQueues[materialIndex]) return;
  
  const queue = flashcardQueues[materialIndex];
  
  // Check if queue is empty (all cards solved)
  if (queue.length === 0) {
    console.log(`All flashcards completed for material ${materialIndex}`);
    
    // Show completion message
    const completionMessage = document.getElementById(`completion-${materialIndex}`);
    if (completionMessage) {
      completionMessage.style.display = 'block';
    }
    
    // Hide flashcard navigation
    const flashcardContainer = document.getElementById(`flashcard-container-${materialIndex}`);
    if (flashcardContainer) {
      flashcardContainer.style.display = 'none';
    }
  }
}

function restartFlashcards(materialIndex) {
  console.log(`Restarting flashcards for material ${materialIndex}`);

  const container = document.getElementById(`flashcard-container-${materialIndex}`);
  if (!container) return;

  // Get material ID from the container (same as in markSolved)
  const materialId = container?.dataset?.materialId; // Retrieve materialId here

  if (!materialId) {
    console.error('Material ID not found for restart. Cannot reset flashcards.');
    alert('Material ID not found. Please refresh the page and try again.');
    return;
  }

  // Reset all cards to unsolved visually
  const allFlashcards = container.querySelectorAll('.flashcard');
  allFlashcards.forEach(card => {
    card.classList.remove('solved');
  });

  // Reset server state for all flashcards
  const allCards = container.querySelectorAll('.flashcard-wrapper');
  allCards.forEach(wrapper => {
    const flashcardId = parseInt(wrapper.dataset.flashcardId);

    // FIX: Include materialId in the fetch URL
    fetch(`/materials/<span class="math-inline">\{materialId\}/flashcards/</span>{flashcardId}`, { // Changed URL
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content,
        'Accept': 'application/json'
      },
      body: JSON.stringify({
        solved: false
      })
    })
    .catch(error => {
      console.error('Error resetting flashcard:', error);
    });
  });

  // Re-initialize the queue
  initializeFlashcards(materialIndex);

  // Show flashcard container and hide completion message
  container.style.display = 'block';
  const completionMessage = document.getElementById(`completion-${materialIndex}`);
  if (completionMessage) {
    completionMessage.style.display = 'none';
  }
}

// Initialize flashcards when page loads
document.addEventListener('DOMContentLoaded', function() {
  console.log('DOM loaded, initializing flashcards');
  
  // Wait a bit for all elements to be rendered
  setTimeout(() => {
    // Find the first visible material
    const visibleMaterial = document.querySelector('.material-tabs:not([style*="display: none"])');
    if (visibleMaterial) {
      const materialIndex = parseInt(visibleMaterial.id.split('-')[1]);
      console.log(`Initializing flashcards for first visible material: ${materialIndex}`);
      initializeFlashcards(materialIndex);
    } else {
      // If no visible material found, try to initialize the first one
      const firstMaterial = document.querySelector('.material-tabs');
      if (firstMaterial) {
        const materialIndex = parseInt(firstMaterial.id.split('-')[1]);
        console.log(`Initializing flashcards for first material: ${materialIndex}`);
        initializeFlashcards(materialIndex);
      }
    }
  }, 500);
});

// Handle Bootstrap tab shown events
document.addEventListener('shown.bs.tab', function(e) {
  const target = e.target;
  if (target.id && target.id.includes('flashcards-tab-')) {
    const materialIndex = parseInt(target.id.split('-')[2]);
    console.log(`Flashcards tab shown for material ${materialIndex}`);
    setTimeout(() => {
      initializeFlashcards(materialIndex);
    }, 100);
  }
});