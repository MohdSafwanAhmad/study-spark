# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
puts "Cleaning database..."
Material.destroy_all
Expertise.destroy_all
Study.destroy_all
Subject.destroy_all
User.destroy_all

puts "Creating subjects..."

# Create subjects manually
Subject.create!([
  # Grade 8
  { name: "Pre-Algebra", grade_level: "8" },
  { name: "English Language Arts", grade_level: "8" },
  { name: "Science", grade_level: "8" }, # Common subject
  { name: "World History", grade_level: "8" },
  { name: "Geography", grade_level: "8" },
  { name: "Health Education", grade_level: "8" },

  # Grade 9
  { name: "Algebra I", grade_level: "9" },
  { name: "Geometry", grade_level: "9" }, # Common subject
  { name: "Science", grade_level: "9" }, # Common subject
  { name: "English Literature", grade_level: "9" },
  { name: "World Cultures", grade_level: "9" },
  { name: "Spanish I", grade_level: "9" },
  { name: "French I", grade_level: "9" },

  # Grade 10
  { name: "Algebra II", grade_level: "10" },
  { name: "Chemistry", grade_level: "10" },
  { name: "Physics", grade_level: "10" },
  { name: "Pre-Calculus", grade_level: "10" },
  { name: "AP English Language", grade_level: "10" },
  { name: "US History", grade_level: "10" },
  { name: "Psychology", grade_level: "10" },
  { name: "Spanish II", grade_level: "10" },
  { name: "Geometry", grade_level: "10" } # Common subject
])

puts "Created #{Subject.count} subjects"

puts "Creating users..."

# Create tutors (10 users)
User.create!([
  { first_name: "Sarah", last_name: "Johnson", email: "sarah.johnson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1995-03-15", bio: "Math tutor with 5+ years experience" },
  { first_name: "Michael", last_name: "Chen", email: "michael.chen@studyspark.com", password: "password123", tutor: true, date_of_birth: "1992-07-22", bio: "Biology PhD student, passionate about science education" },
  { first_name: "Emily", last_name: "Rodriguez", email: "emily.rodriguez@studyspark.com", password: "password123", tutor: true, date_of_birth: "1988-11-08", bio: "Former high school English teacher" },
  { first_name: "David", last_name: "Thompson", email: "david.thompson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1994-01-30", bio: "Engineering student, physics and math specialist" },
  { first_name: "Jessica", last_name: "Kim", email: "jessica.kim@studyspark.com", password: "password123", tutor: true, date_of_birth: "1990-05-12", bio: "Native Spanish speaker with education degree" },
  { first_name: "Robert", last_name: "Martinez", email: "robert.martinez@studyspark.com", password: "password123", tutor: true, date_of_birth: "1993-09-03", bio: "Chemistry major with lab research experience" },
  { first_name: "Ashley", last_name: "Davis", email: "ashley.davis@studyspark.com", password: "password123", tutor: true, date_of_birth: "1991-12-18", bio: "History enthusiast with Master's degree" },
  { first_name: "Christopher", last_name: "Wilson", email: "christopher.wilson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1996-04-25", bio: "Computer Science graduate working in tech" },
  { first_name: "Amanda", last_name: "Garcia", email: "amanda.garcia@studyspark.com", password: "password123", tutor: true, date_of_birth: "1989-08-14", bio: "Psychology major with tutoring certification" },
  { first_name: "Daniel", last_name: "Brown", email: "daniel.brown@studyspark.com", password: "password123", tutor: true, date_of_birth: "1987-06-07", bio: "Experienced in multiple subjects, patient teaching style" }
])

# Create learners (40 users)
User.create!([
  { first_name: "Alex", last_name: "Smith", email: "alex.smith@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-03-15" },
  { first_name: "Jordan", last_name: "Johnson", email: "jordan.johnson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-07-22" },
  { first_name: "Taylor", last_name: "Williams", email: "taylor.williams@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-11-08" },
  { first_name: "Morgan", last_name: "Brown", email: "morgan.brown@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-01-30" },
  { first_name: "Casey", last_name: "Jones", email: "casey.jones@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-05-12" },
  { first_name: "Riley", last_name: "Garcia", email: "riley.garcia@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-09-03" },
  { first_name: "Avery", last_name: "Miller", email: "avery.miller@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-12-18" },
  { first_name: "Cameron", last_name: "Davis", email: "cameron.davis@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-04-25" },
  { first_name: "Drew", last_name: "Rodriguez", email: "drew.rodriguez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-08-14" },
  { first_name: "Hayden", last_name: "Martinez", email: "hayden.martinez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-06-07" },
  { first_name: "Jamie", last_name: "Hernandez", email: "jamie.hernandez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-10-21" },
  { first_name: "Parker", last_name: "Lopez", email: "parker.lopez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-02-28" },
  { first_name: "Quinn", last_name: "Gonzalez", email: "quinn.gonzalez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-07-16" },
  { first_name: "Reese", last_name: "Wilson", email: "reese.wilson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-11-11" },
  { first_name: "Sage", last_name: "Anderson", email: "sage.anderson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-01-04" },
  { first_name: "Blake", last_name: "Thomas", email: "blake.thomas@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-09-19" },
  { first_name: "Dakota", last_name: "Taylor", email: "dakota.taylor@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-05-23" },
  { first_name: "Emerson", last_name: "Moore", email: "emerson.moore@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-03-07" },
  { first_name: "Finley", last_name: "Jackson", email: "finley.jackson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-12-02" },
  { first_name: "Gray", last_name: "Martin", email: "gray.martin@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-08-26" },
  { first_name: "Harper", last_name: "Lee", email: "harper.lee@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-04-12" },
  { first_name: "Indigo", last_name: "Perez", email: "indigo.perez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-11-29" },
  { first_name: "Jaden", last_name: "Thompson", email: "jaden.thompson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-06-18" },
  { first_name: "Kai", last_name: "White", email: "kai.white@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-01-25" },
  { first_name: "Lane", last_name: "Harris", email: "lane.harris@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-08-13" },
  { first_name: "Marley", last_name: "Sanchez", email: "marley.sanchez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-03-01" },
  { first_name: "Nova", last_name: "Clark", email: "nova.clark@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-09-17" },
  { first_name: "Ocean", last_name: "Ramirez", email: "ocean.ramirez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-05-04" },
  { first_name: "Phoenix", last_name: "Lewis", email: "phoenix.lewis@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-10-21" },
  { first_name: "River", last_name: "Robinson", email: "river.robinson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-02-08" },
  { first_name: "Skylar", last_name: "Walker", email: "skylar.walker@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-07-26" },
  { first_name: "Tatum", last_name: "Young", email: "tatum.young@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-12-14" },
  { first_name: "Unity", last_name: "Allen", email: "unity.allen@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-04-30" },
  { first_name: "Vale", last_name: "King", email: "vale.king@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-11-16" },
  { first_name: "Wren", last_name: "Wright", email: "wren.wright@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-06-03" },
  { first_name: "Zion", last_name: "Scott", email: "zion.scott@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-01-20" },
  { first_name: "Aria", last_name: "Torres", email: "aria.torres@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-08-07" },
  { first_name: "Bella", last_name: "Nguyen", email: "bella.nguyen@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-03-25" },
  { first_name: "Chloe", last_name: "Hill", email: "chloe.hill@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-10-12" },
  { first_name: "Delia", last_name: "Flores", email: "delia.flores@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-04-28" }
])

puts "Created #{User.count} users"

puts "Creating expertises..."

# Get subjects and tutors
subjects = Subject.all
tutors = User.where(tutor: true)

# Create expertises manually
Expertise.create!([
  # Sarah Johnson - Math specialist
  { user: tutors.find_by(first_name: "Sarah"), subject: subjects.find_by(name: "Pre-Algebra", grade_level: "8"), tutor_rate: 2500 },
  { user: tutors.find_by(first_name: "Sarah"), subject: subjects.find_by(name: "Algebra I", grade_level: "9"), tutor_rate: 3000 },
  { user: tutors.find_by(first_name: "Sarah"), subject: subjects.find_by(name: "Geometry", grade_level: "9"), tutor_rate: 3200 },

  # Michael Chen - Science specialist
  { user: tutors.find_by(first_name: "Michael"), subject: subjects.find_by(name: "Science", grade_level: "8"), tutor_rate: 2800 },
  { user: tutors.find_by(first_name: "Michael"), subject: subjects.find_by(name: "Science", grade_level: "9"), tutor_rate: 3500 },
  { user: tutors.find_by(first_name: "Michael"), subject: subjects.find_by(name: "Chemistry", grade_level: "10"), tutor_rate: 4000 },

  # Emily Rodriguez - English specialist
  { user: tutors.find_by(first_name: "Emily"), subject: subjects.find_by(name: "English Language Arts", grade_level: "8"), tutor_rate: 2700 },
  { user: tutors.find_by(first_name: "Emily"), subject: subjects.find_by(name: "English Literature", grade_level: "9"), tutor_rate: 3100 },
  { user: User.find_by(first_name: "Emily"), subject: subjects.find_by(name: "AP English Language", grade_level: "10"), tutor_rate: 4200 },

  # David Thompson - Physics/Math
  { user: tutors.find_by(first_name: "David"), subject: subjects.find_by(name: "Physics", grade_level: "10"), tutor_rate: 4500 },
  { user: tutors.find_by(first_name: "David"), subject: subjects.find_by(name: "Pre-Calculus", grade_level: "10"), tutor_rate: 4300 },
  { user: tutors.find_by(first_name: "David"), subject: subjects.find_by(name: "Algebra II", grade_level: "10"), tutor_rate: 3400 },
  { user: tutors.find_by(first_name: "David"), subject: subjects.find_by(name: "Geometry", grade_level: "10"), tutor_rate: 3500 },


  # Jessica Kim - Spanish specialist
  { user: tutors.find_by(first_name: "Jessica"), subject: subjects.find_by(name: "Spanish I", grade_level: "9"), tutor_rate: 2900 },
  { user: tutors.find_by(first_name: "Jessica"), subject: subjects.find_by(name: "Spanish II", grade_level: "10"), tutor_rate: 3300 },

  # Robert Martinez - Chemistry/Science
  { user: tutors.find_by(first_name: "Robert"), subject: subjects.find_by(name: "Chemistry", grade_level: "10"), tutor_rate: 3800 },
  { user: tutors.find_by(first_name: "Robert"), subject: subjects.find_by(name: "Science", grade_level: "8"), tutor_rate: 2600 },
  { user: tutors.find_by(first_name: "Robert"), subject: subjects.find_by(name: "Science", grade_level: "9"), tutor_rate: 3200 },

  # Ashley Davis - History specialist
  { user: tutors.find_by(first_name: "Ashley"), subject: subjects.find_by(name: "World History", grade_level: "8"), tutor_rate: 2800 },
  { user: tutors.find_by(first_name: "Ashley"), subject: subjects.find_by(name: "US History", grade_level: "10"), tutor_rate: 3100 },
  { user: tutors.find_by(first_name: "Ashley"), subject: subjects.find_by(name: "World Cultures", grade_level: "9"), tutor_rate: 2900 },

  # Add more expertises for remaining tutors
  { user: tutors.find_by(first_name: "Christopher"), subject: subjects.find_by(name: "Algebra I", grade_level: "9"), tutor_rate: 2800 },
  { user: tutors.find_by(first_name: "Christopher"), subject: subjects.find_by(name: "Geometry", grade_level: "9"), tutor_rate: 3000 },
  { user: tutors.find_by(first_name: "Amanda"), subject: subjects.find_by(name: "Psychology", grade_level: "10"), tutor_rate: 3500 },
  { user: tutors.find_by(first_name: "Daniel"), subject: subjects.find_by(name: "Pre-Algebra", grade_level: "8"), tutor_rate: 2400 },
  { user: tutors.find_by(first_name: "Daniel"), subject: subjects.find_by(name: "English Language Arts", grade_level: "8"), tutor_rate: 2600 }
])

puts "Created #{Expertise.count} expertises"

puts "Creating studies..."

# Get learners
learners = User.where(tutor: false)

# Create studies manually
Study.create!([
  # Alex (multiple studies)
  { user: learners.find_by(first_name: "Alex"), subject: subjects.find_by(name: "Pre-Algebra", grade_level: "8"), learning_objective: "Master solving linear equations with one variable" },
  { user: learners.find_by(first_name: "Alex"), subject: subjects.find_by(name: "Science", grade_level: "8"), learning_objective: "Understand the basics of the water cycle" },

  # Jordan (multiple studies)
  { user: learners.find_by(first_name: "Jordan"), subject: subjects.find_by(name: "Science", grade_level: "9"), learning_objective: "Understand cell structure and function" },
  { user: learners.find_by(first_name: "Jordan"), subject: subjects.find_by(name: "English Literature", grade_level: "9"), learning_objective: "Analyze themes in classic novels" },

  # Taylor
  { user: learners.find_by(first_name: "Taylor"), subject: subjects.find_by(name: "English Language Arts", grade_level: "8"), learning_objective: "Improve essay writing structure and argumentation" },

  # Morgan
  { user: learners.find_by(first_name: "Morgan"), subject: subjects.find_by(name: "Chemistry", grade_level: "10"), learning_objective: "Balance chemical equations and understand reactions" },

  # Casey (multiple studies)
  { user: learners.find_by(first_name: "Casey"), subject: subjects.find_by(name: "Spanish I", grade_level: "9"), learning_objective: "Learn basic conversational phrases and greetings" },
  { user: learners.find_by(first_name: "Casey"), subject: subjects.find_by(name: "Algebra I", grade_level: "9"), learning_objective: "Solve systems of linear equations" },

  # Riley
  { user: learners.find_by(first_name: "Riley"), subject: subjects.find_by(name: "Algebra I", grade_level: "9"), learning_objective: "Learn to factor polynomials and quadratic expressions" },

  # Avery
  { user: learners.find_by(first_name: "Avery"), subject: subjects.find_by(name: "Physics", grade_level: "10"), learning_objective: "Apply Newton's laws to motion problems" },

  # Cameron
  { user: learners.find_by(first_name: "Cameron"), subject: subjects.find_by(name: "World History", grade_level: "8"), learning_objective: "Understand major historical events and their causes" },

  # Drew (multiple studies)
  { user: learners.find_by(first_name: "Drew"), subject: subjects.find_by(name: "Geometry", grade_level: "9"), learning_objective: "Prove geometric theorems using logical reasoning" },
  { user: learners.find_by(first_name: "Drew"), subject: subjects.find_by(name: "Geometry", grade_level: "10"), learning_objective: "Understand transformations in the coordinate plane" },

  # Hayden
  { user: learners.find_by(first_name: "Hayden"), subject: subjects.find_by(name: "Pre-Calculus", grade_level: "10"), learning_objective: "Master trigonometric functions and identities" },

  # Jamie
  { user: learners.find_by(first_name: "Jamie"), subject: subjects.find_by(name: "English Literature", grade_level: "9"), learning_objective: "Analyze literary devices in poetry and prose" },

  # Parker
  { user: learners.find_by(first_name: "Parker"), subject: subjects.find_by(name: "Science", grade_level: "8"), learning_objective: "Understand basic principles of matter and energy" },

  # Quinn
  { user: learners.find_by(first_name: "Quinn"), subject: subjects.find_by(name: "US History", grade_level: "10"), learning_objective: "Learn about the American Revolution and Constitution" },

  # Reese
  { user: learners.find_by(first_name: "Reese"), subject: subjects.find_by(name: "French I", grade_level: "9"), learning_objective: "Master basic French pronunciation and vocabulary" },

  # Sage
  { user: learners.find_by(first_name: "Sage"), subject: subjects.find_by(name: "Psychology", grade_level: "10"), learning_objective: "Understand basic psychological principles and theories" },

  # Blake
  { user: learners.find_by(first_name: "Blake"), subject: subjects.find_by(name: "Algebra II", grade_level: "10"), learning_objective: "Work with logarithms and exponential functions" },

  # Dakota
  { user: learners.find_by(first_name: "Dakota"), subject: subjects.find_by(name: "Science", grade_level: "9"), learning_objective: "Learn genetics and heredity principles" },

  # Emerson
  { user: learners.find_by(first_name: "Emerson"), subject: subjects.find_by(name: "Geography", grade_level: "8"), learning_objective: "Study world maps and geographic features" },

  # Finley
  { user: learners.find_by(first_name: "Finley"), subject: subjects.find_by(name: "AP English Language", grade_level: "10"), learning_objective: "Develop advanced analytical writing skills" },

  # Gray
  { user: learners.find_by(first_name: "Gray"), subject: subjects.find_by(name: "Spanish II", grade_level: "10"), learning_objective: "Practice advanced Spanish conversation" },

  # Harper
  { user: learners.find_by(first_name: "Harper"), subject: subjects.find_by(name: "Chemistry", grade_level: "10"), learning_objective: "Understand periodic table trends and atomic structure" },

  # Indigo
  { user: learners.find_by(first_name: "Indigo"), subject: subjects.find_by(name: "Pre-Algebra", grade_level: "8"), learning_objective: "Strengthen foundation in integer operations" },

  # Jaden
  { user: learners.find_by(first_name: "Jaden"), subject: subjects.find_by(name: "Health Education", grade_level: "8"), learning_objective: "Learn about nutrition and healthy lifestyle choices" },

  # Kai
  { user: learners.find_by(first_name: "Kai"), subject: subjects.find_by(name: "World Cultures", grade_level: "9"), learning_objective: "Explore different cultures and their traditions" },

  # Lane
  { user: learners.find_by(first_name: "Lane"), subject: subjects.find_by(name: "Geometry", grade_level: "9"), learning_objective: "Calculate area and volume of complex shapes" },

  # Marley
  { user: learners.find_by(first_name: "Marley"), subject: subjects.find_by(name: "English Language Arts", grade_level: "8"), learning_objective: "Develop vocabulary and reading comprehension" },

  # Nova
  { user: learners.find_by(first_name: "Nova"), subject: subjects.find_by(name: "Physics", grade_level: "10"), learning_objective: "Understand energy conservation and transformations" },

  # Ocean
  { user: learners.find_by(first_name: "Ocean"), subject: subjects.find_by(name: "Algebra I", grade_level: "9"), learning_objective: "Understand graphing linear functions and inequalities" },

  # Phoenix
  { user: learners.find_by(first_name: "Phoenix"), subject: subjects.find_by(name: "Science", grade_level: "9"), learning_objective: "Master photosynthesis and cellular respiration" },

  # River
  { user: learners.find_by(first_name: "River"), subject: subjects.find_by(name: "World History", grade_level: "8"), learning_objective: "Study ancient civilizations and their contributions" }
])

puts "Created #{Study.count} studies"

puts "Creating materials..."

# Get studies
studies = Study.all

# Create materials manually
Material.create!([
  # Materials for Alex's Pre-Algebra study
  { study: studies.find_by(learning_objective: "Master solving linear equations with one variable"), name: "Linear Equations Practice", description: "Step-by-step practice problems for solving equations", format: "PDF", summary: "This PDF contains 20 practice problems focused on solving linear equations with one variable, including examples with fractions and decimals. Detailed solutions are provided for each problem to guide the learner through the process." },
  { study: studies.find_by(learning_objective: "Master solving linear equations with one variable"), name: "Equation Solving Guide", description: "Reference guide for equation solving methods", format: "PDF", summary: "A quick reference guide outlining various methods for solving linear equations, such as inverse operations, combining like terms, and distributive property. Includes key formulas and illustrative examples for easy understanding." },
  # Materials for Alex's Grade 8 Science study
  { study: studies.find_by(learning_objective: "Understand the basics of the water cycle"), name: "Water Cycle Diagram & Explanation", description: "Visual and textual explanation of the water cycle", format: "PDF", summary: "This PDF includes a detailed diagram illustrating the stages of the water cycle (evaporation, condensation, precipitation, collection) with clear definitions and explanations for each process." },

  # Materials for Jordan's Grade 9 Science study
  { study: studies.find_by(learning_objective: "Understand cell structure and function"), name: "Cell Structure Diagrams", description: "Labeled diagrams of plant and animal cells", format: "PDF", summary: "Detailed labeled diagrams of both plant and animal cells, highlighting major organelles like the nucleus, mitochondria, chloroplasts (plant), and cell wall (plant). Functions of each organelle are briefly described." },
  { study: studies.find_by(learning_objective: "Understand cell structure and function"), name: "Cell Function Notes", description: "Comprehensive notes on cellular processes", format: "PDF", summary: "Comprehensive notes covering key cellular processes such as mitosis (cell division), meiosis (gamete formation), and cellular respiration (energy production). Includes simplified diagrams and key takeaways." },
  # Materials for Jordan's English Literature study
  { study: studies.find_by(learning_objective: "Analyze themes in classic novels"), name: "Literary Theme Analysis Worksheet", description: "Worksheet to identify and analyze themes in literature", format: "PDF", summary: "This worksheet guides learners through the process of identifying central themes in a literary work, providing prompts to analyze how characters, plot, and setting contribute to the development of these themes." },

  # Materials for Taylor's English study
  { study: studies.find_by(learning_objective: "Improve essay writing structure and argumentation"), name: "Essay Structure Template", description: "Template for organizing persuasive essays", format: "PDF", summary: "A printable template for structuring a 5-paragraph persuasive essay, including sections for introduction (with thesis statement), body paragraphs (topic sentence, evidence, explanation), and conclusion. Examples for each section are provided." },
  { study: studies.find_by(learning_objective: "Improve essay writing structure and argumentation"), name: "Argument Analysis Worksheet", description: "Practice analyzing arguments and evidence", format: "PDF", summary: "Exercises designed to help learners identify thesis statements, supporting evidence, counterarguments, and logical fallacies within various argumentative texts. Includes short passages for practice." },

  # Materials for Morgan's Chemistry study
  { study: studies.find_by(learning_objective: "Balance chemical equations and understand reactions"), name: "Chemical Equation Balancing", description: "Practice problems for balancing equations", format: "PDF", summary: "This PDF contains 30 chemical equations for learners to practice balancing, ranging from simple to complex. An answer key with step-by-step balancing methods is included for self-assessment." },
  { study: studies.find_by(learning_objective: "Balance chemical equations and understand reactions"), name: "Reaction Types Guide", description: "Guide to different types of chemical reactions", format: "PDF", summary: "A comprehensive guide explaining the five main types of chemical reactions: synthesis, decomposition, single displacement, double displacement, and combustion. Each type is defined, with examples and explanations of how to identify them." },

  # Materials for Casey's Spanish I study
  { study: studies.find_by(learning_objective: "Learn basic conversational phrases and greetings"), name: "Spanish Greetings List", description: "Common greetings and responses in Spanish", format: "PDF", summary: "A list of 50 essential Spanish greetings, farewells, and common conversational phrases. Includes phonetic pronunciation guides and tips for polite usage in various contexts." },
  { study: studies.find_by(learning_objective: "Learn basic conversational phrases and greetings"), name: "Conversation Practice", description: "Dialogue examples for basic conversations", format: "PDF", summary: "Ten common conversation scenarios (e.g., introductions, asking for directions, ordering food) presented as simple dialogues in Spanish, with English translations. Ideal for practicing basic conversational flow." },
  # Materials for Casey's Algebra I study
  { study: studies.find_by(learning_objective: "Solve systems of linear equations"), name: "Systems of Equations Practice", description: "Practice problems for solving linear systems", format: "PDF", summary: "This PDF offers a set of 20 practice problems for solving systems of linear equations using graphing, substitution, and elimination methods. Solutions are provided for checking answers." },

  # Materials for Riley's Algebra I study
  { study: studies.find_by(learning_objective: "Learn to factor polynomials and quadratic expressions"), name: "Factoring Polynomials Guide", description: "Methods for factoring different polynomial types", format: "PDF", summary: "A step-by-step guide detailing various factoring techniques for polynomials, including greatest common factor (GCF), difference of squares, trinomials (a=1 and a≠1), and grouping. Includes illustrative examples for each method." },
  { study: studies.find_by(learning_objective: "Learn to factor polynomials and quadratic expressions"), name: "Quadratic Practice Problems", description: "Practice problems for quadratic factoring", format: "PDF", summary: "A collection of 25 quadratic expressions for learners to practice factoring. Problems cover various difficulty levels and require different factoring techniques. Answer key included." },

  # Materials for Avery's Physics study
  { study: studies.find_by(learning_objective: "Apply Newton's laws to motion problems"), name: "Newton's Laws Summary", description: "Summary of Newton's three laws of motion", format: "PDF", summary: "A concise summary of Newton's three laws of motion, clearly defining each law with relevant real-world examples. Includes diagrams illustrating force, mass, and acceleration." },
  { study: studies.find_by(learning_objective: "Apply Newton's laws to motion problems"), name: "Motion Problem Set", description: "Physics problems involving forces and motion", format: "PDF", summary: "A set of 15 word problems focused on applying Newton's laws to solve motion problems. Problems involve calculations of force, acceleration, and mass. Detailed solutions are provided." },

  # Materials for Cameron's History study
  { study: studies.find_by(learning_objective: "Understand major historical events and their causes"), name: "Historical Timeline", description: "Chronological timeline of major world events", format: "PDF", summary: "A visually engaging chronological timeline spanning major world historical events from ancient civilizations to modern times. Key dates, brief descriptions, and significant figures are highlighted." },
  { study: studies.find_by(learning_objective: "Understand major historical events and their causes"), name: "Cause and Effect Analysis", description: "Analysis of historical events and their consequences", format: "PDF", summary: "Case studies of 10 major historical events, prompting learners to identify the causes, immediate effects, and long-term consequences of each. Includes guiding questions for critical thinking." },

  # Materials for Drew's Geometry Grade 9 study
  { study: studies.find_by(learning_objective: "Prove geometric theorems using logical reasoning"), name: "Geometric Proofs Guide", description: "Introduction to writing geometric proofs", format: "PDF", summary: "An introductory guide to writing geometric proofs, explaining different proof formats (two-column, paragraph) and common logical reasoning techniques. Includes examples of basic proofs." },
  { study: studies.find_by(learning_objective: "Prove geometric theorems using logical reasoning"), name: "Proof Practice Problems", description: "Practice proofs for various geometric theorems", format: "PDF", summary: "A collection of 12 practice problems requiring learners to construct geometric proofs for various theorems, such as congruence of triangles and properties of parallel lines. Step-by-step solutions are provided." },
  # Materials for Drew's Geometry Grade 10 study
  { study: studies.find_by(learning_objective: "Understand transformations in the coordinate plane"), name: "Geometric Transformations Guide", description: "Guide to reflections, rotations, translations, and dilations", format: "PDF", summary: "This PDF explains the four main types of geometric transformations (reflection, rotation, translation, dilation) in the coordinate plane. Includes rules, examples, and practice problems with coordinate grids." },

  # Materials for Hayden's Pre-Calculus study
  { study: studies.find_by(learning_objective: "Master trigonometric functions and identities"), name: "Trig Functions Reference", description: "Reference sheet for trigonometric functions", format: "PDF", summary: "A comprehensive reference sheet for trigonometric functions, including definitions of sine, cosine, tangent, cosecant, secant, and cotangent, along with the unit circle, special angle values, and fundamental trigonometric identities." },
  { study: studies.find_by(learning_objective: "Master trigonometric functions and identities"), name: "Trigonometric Identities Practice", description: "Practice problems for proving trig identities", format: "PDF", summary: "20 practice problems focused on proving trigonometric identities, ranging from basic to more complex. Hints and full solutions are provided for each problem." },

  # Materials for Jamie's English Literature study
  { study: studies.find_by(learning_objective: "Analyze literary devices in poetry and prose"), name: "Literary Devices Handbook", description: "Guide to common literary devices", format: "PDF", summary: "A handbook defining and providing examples for 30 common literary devices, such as metaphor, simile, personification, imagery, symbolism, and foreshadowing. Includes exercises for identification." },
  { study: studies.find_by(learning_objective: "Analyze literary devices in poetry and prose"), name: "Poetry Analysis Worksheet", description: "Worksheet for analyzing poetic elements", format: "PDF", summary: "This worksheet guides learners through analyzing a poem, prompting them to identify rhyme scheme, meter, figures of speech, tone, and theme. Includes space for personal interpretation." },

  # Materials for Parker's Science study
  { study: studies.find_by(learning_objective: "Understand basic principles of matter and energy"), name: "Matter and Energy Notes", description: "Fundamental concepts in physical science", format: "PDF", summary: "Detailed notes covering the fundamental concepts of matter (states of matter, properties) and energy (forms of energy, transformations, conservation). Includes examples and diagrams." },
  { study: studies.find_by(learning_objective: "Understand basic principles of matter and energy"), name: "States of Matter Experiment Guide", description: "Guide for simple experiments on states of matter", format: "PDF", summary: "Instructions for 3 simple, safe home experiments demonstrating the properties and transitions between solid, liquid, and gas states of matter. Includes observation questions." },

  # Materials for Quinn's US History study
  { study: studies.find_by(learning_objective: "Learn about the American Revolution and Constitution"), name: "Revolution Timeline", description: "Key events leading to American independence", format: "PDF", summary: "A detailed timeline outlining the key events of the American Revolution, from colonial grievances to the signing of the Treaty of Paris. Includes important dates, battles, and figures." },
  { study: studies.find_by(learning_objective: "Learn about the American Revolution and Constitution"), name: "US Constitution Overview", description: "Simplified guide to the US Constitution", format: "PDF", summary: "A simplified overview of the United States Constitution, covering its structure (articles, amendments), key principles (separation of powers, checks and balances), and the Bill of Rights." },

  # Materials for Reese's French I study
  { study: studies.find_by(learning_objective: "Master basic French pronunciation and vocabulary"), name: "French Pronunciation Guide", description: "Guide to French phonetics and pronunciation", format: "PDF", summary: "A comprehensive guide to French phonetics, including common vowel and consonant sounds, silent letters, and stress patterns. Tips for practicing pronunciation are also provided." },
  { study: studies.find_by(learning_objective: "Master basic French pronunciation and vocabulary"), name: "Essential French Vocabulary", description: "List of common French words and phrases", format: "PDF", summary: "A categorized list of 100 essential French vocabulary words, including common nouns, verbs, adjectives, and adverbs. English translations are provided." },

  # Materials for Sage's Psychology study
  { study: studies.find_by(learning_objective: "Understand basic psychological principles and theories"), name: "Psychology Theories Overview", description: "Introduction to major psychological theories", format: "PDF", summary: "An overview of major psychological theories and perspectives, including Freud's psychodynamic theory, Piaget's cognitive development theory, Behaviorism, and Humanism. Key concepts and theorists are highlighted." },
  { study: studies.find_by(learning_objective: "Understand basic psychological principles and theories"), name: "Branches of Psychology", description: "Explanation of different fields in psychology", format: "PDF", summary: "This PDF explains the various branches within psychology, such as clinical, cognitive, developmental, social, and forensic psychology, outlining their focus and typical areas of research." }
])

materials_alex = Material.new(name: "Linear Equations Practice", description: "Step-by-step practice problems for solving equations", format: "PDF", study: Study.first)
linear_equations_file = File.open("./db/files/linear_equations.pdf")
materials_alex.file.attach(io: linear_equations_file, filename: "linear_equation.pdf", content_type: "application/pdf")
materials_alex.save
puts "Created #{Material.count} materials"

puts "\n=== SEEDING COMPLETED ==="
puts "#{User.where(tutor: true).count} tutors created"
puts "#{User.where(tutor: false).count} learners created"
puts "#{Subject.count} subjects created"
puts "#{Expertise.count} expertises created"
puts "#{Study.count} studies created"
puts "#{Material.count} materials created"