puts "Cleaning database..."

Chat.destroy_all
TutoringSession.destroy_all
Material.destroy_all
Expertise.destroy_all
Study.destroy_all
User.destroy_all
Subject.destroy_all

puts "Creating subjects..."

# Grade 8 Subjects
subject_grade8_pre_algebra = Subject.create!(name: "Pre-Algebra", grade_level: "8")
subject_grade8_english_language_arts = Subject.create!(name: "English Language Arts", grade_level: "8")
subject_grade8_science = Subject.create!(name: "Science", grade_level: "8")
subject_grade8_world_history = Subject.create!(name: "World History", grade_level: "8")
subject_grade8_geography = Subject.create!(name: "Geography", grade_level: "8")
subject_grade8_health_education = Subject.create!(name: "Health Education", grade_level: "8")

# Grade 9 Subjects
subject_grade9_algebra_i = Subject.create!(name: "Algebra I", grade_level: "9")
subject_grade9_geometry = Subject.create!(name: "Geometry", grade_level: "9")
subject_grade9_science = Subject.create!(name: "Science", grade_level: "9")
subject_grade9_english_literature = Subject.create!(name: "English Literature", grade_level: "9")
subject_grade9_world_cultures = Subject.create!(name: "World Cultures", grade_level: "9")
subject_grade9_spanish_i = Subject.create!(name: "Spanish I", grade_level: "9")
subject_grade9_french_i = Subject.create!(name: "French I", grade_level: "9")

# Grade 10 Subjects
subject_grade10_algebra_ii = Subject.create!(name: "Algebra II", grade_level: "10")
subject_grade10_chemistry = Subject.create!(name: "Chemistry", grade_level: "10")
subject_grade10_physics = Subject.create!(name: "Physics", grade_level: "10")
subject_grade10_pre_calculus = Subject.create!(name: "Pre-Calculus", grade_level: "10")
subject_grade10_ap_english_language = Subject.create!(name: "AP English Language", grade_level: "10")
subject_grade10_us_history = Subject.create!(name: "US History", grade_level: "10")
subject_grade10_psychology = Subject.create!(name: "Psychology", grade_level: "10")
subject_grade10_spanish_ii = Subject.create!(name: "Spanish II", grade_level: "10")
subject_grade10_geometry = Subject.create!(name: "Geometry", grade_level: "10")

puts "Created #{Subject.count} subjects"

puts "Creating users..."

# Create tutors
require "open-uri"

puts 'Creating tutor users...'

# Sarah Johnson
tutor_sarah_johnson = User.create!(
  first_name: "Sarah",
  last_name: "Johnson",
  email: "sarah.johnson@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1995-03-15",
  bio: "Computer Science graduate working in tech. I aim to spark curiosity through labs, models, and everyday connections to biology, helping students grasp both foundational and advanced topics."
)
tutor_sarah_johnson.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749644057/cveneziani_kireew.jpg"),
  filename: "sarah_johnson.jpg",
  content_type: "image/jpeg"
)

# Emily Rodriguez
tutor_emily_rodriguez = User.create!(
  first_name: "Emily",
  last_name: "Rodriguez",
  email: "emily.rodriguez@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1988-11-08",
  bio: "Former high school English teacher. I have a passion for literature and writing, and I love helping students find their voice through essays, analysis, and vocabulary development."

)
tutor_emily_rodriguez.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749613888/73177352_edulwi.jpg"),
  filename: "emily_rodriguez.jpg",
  content_type: "image/jpeg"
)

# Naika Estriplet
tutor_naika_estriplet = User.create!(
  first_name: "Naïka",
  last_name: "Estriplet",
  email: "naika.estriplet@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1990-05-12",
  bio: "Native Spanish speaker with education degree. I bring cultural context and interactive exercises to the classroom, helping students achieve fluency through immersion and practice."
)
tutor_naika_estriplet.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749613888/207014929_cruzve.png"),
  filename: "jessica_kim.png",
  content_type: "image/png"
)

# Amanda Garcia
tutor_amanda_garcia = User.create!(
  first_name: "Amanda",
  last_name: "Garcia",
  email: "amanda.garcia@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1989-08-14",
  bio: "Psychology major with tutoring certification. I focus on making complex theories accessible and relatable, with a student-centered, discussion-based approach."

)
tutor_amanda_garcia.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749613888/IMG_2893.jpg_thltt6.jpg"),
  filename: "amanda_garcia.jpg",
  content_type: "image/jpeg"
)

# Ashley Davis
tutor_ashley_davis = User.create!(
  first_name: "Ashley",
  last_name: "Davis",
  email: "ashley.davis@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1991-12-18",
  bio: "History enthusiast with Master's degree. I love connecting past events to current global trends and making history come alive through storytelling and critical analysis."
)
tutor_ashley_davis.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749643837/28513469_c8kjpj.jpg"),
  filename: "ashley_davis.jpg",
  content_type: "image/jpeg"
)

# Michael Chen
tutor_michael_chen = User.create!(
  first_name: "Michael",
  last_name: "Chen",
  email: "michael.chen@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1992-07-22",
  bio: "Biology PhD student, passionate about science education. I aim to spark curiosity through labs, models, and everyday connections to biology, helping students grasp both foundational and advanced topics."
)
tutor_michael_chen.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749613888/38663325_dbvaz9.jpg"),
  filename: "michael_chen.jpg",
  content_type: "image/jpeg"
)

# Robert Martinez
tutor_robert_martinez = User.create!(
  first_name: "Robert",
  last_name: "Martinez",
  email: "robert.martinez@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1993-09-03",
  bio: "Chemistry major with lab research experience. I offer structured, clear instruction in chemical principles and problem-solving strategies, making complex reactions approachable."
)
tutor_robert_martinez.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749613888/33919848_rplef6.jpg"),
  filename: "robert_martinez.jpg",
  content_type: "image/jpeg"
)

# David Thompson
tutor_david_thompson = User.create!(
  first_name: "David",
  last_name: "Thompson",
  email: "david.thompson@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1994-01-30",
  bio: "Engineering student, physics and math specialist. I specialize in helping students build strong problem-solving skills and confidence in math fundamentals, from pre-algebra to geometry. My approach combines structured lessons with engaging real-world applications."
)
tutor_david_thompson.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749643564/arthur-littm_g5gjnq.jpg"),
  filename: "david_thompson.jpg",
  content_type: "image/jpeg"
)

# Christopher Wilson
tutor_christopher_wilson = User.create!(
  first_name: "Christopher",
  last_name: "Wilson",
  email: "christopher.wilson@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1996-04-25",
  bio: "Computer Science graduate working in tech. I aim to spark curiosity through labs, models, and everyday connections to biology, helping students grasp both foundational and advanced topics."

)
tutor_christopher_wilson.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749613888/lwg21_lmu6ce.jpg"),
  filename: "christopher_wilson.jpg",
  content_type: "image/jpeg"
)

# Daniel Brown
tutor_daniel_brown = User.create!(
  first_name: "Daniel",
  last_name: "Brown",
  email: "daniel.brown@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1990-01-01",
  bio: "Experienced in multiple subjects, patient teaching style. I’m adaptable to various learning styles and subjects, providing a supportive environment that fosters academic growth."
)
tutor_daniel_brown.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749643652/8090140_kvg5v4.png"),
  filename: "daniel_brown.png",
  content_type: "image/png"
)
# Fernando Villarreal
tutor_fernando_villarreal = User.create!(
  first_name: "Fernando",
  last_name: "Villarreal",
  email: "fernando.villarreal@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1994-02-23",
  bio: "Protect human among call scene within policy since. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_fernando_villarreal.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653457/rodloboz_igxbnk.jpg"),
  filename: "fernando_villarreal.jpg",
  content_type: "image/jpeg"
)

# Joseph Duran
tutor_joseph_duran = User.create!(
  first_name: "Joseph",
  last_name: "Duran",
  email: "joseph.duran@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1989-08-05",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."
)
tutor_joseph_duran.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653457/juliends_r4voqu.jpg"),
  filename: "joseph_duran.jpg",
  content_type: "image/jpeg"
)

# Roger Garza
tutor_roger_garza = User.create!(
  first_name: "Roger",
  last_name: "Garza",
  email: "roger.garza@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "2000-12-02",
  bio: "Plant agency successful now crime we. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_roger_garza.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1748030027/xkccwahyvm1rxdme9toz.jpg"),
  filename: "roger_garza.jpg",
  content_type: "image/jpeg"
)

# Maria Smith
tutor_maria_smith = User.create!(
  first_name: "Maria",
  last_name: "Smith",
  email: "maria.smith@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1993-04-14",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_maria_smith.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653461/28513469_lopms9.jpg"),
  filename: "maria_smith.jpg",
  content_type: "image/jpeg"
)

# Sabrina Johnson
tutor_sabrina_johnson = User.create!(
  first_name: "Sabrina",
  last_name: "Johnson",
  email: "sabrina.johnson@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1995-06-22",
  bio: "Democratic board foreign role show employee walk response finish able different. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_sabrina_johnson.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653460/37805251_hoofqn.png"),
  filename: "sabrina_johnson.png",
  content_type: "image/png"
)

# Angela Acosta
tutor_angela_acosta = User.create!(
  first_name: "Angela",
  last_name: "Acosta",
  email: "angela.acosta@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1998-09-30",
  bio: "Public even different most offer method southern pattern she away. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_angela_acosta.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653457/43337020_yx09qo.png"),
  filename: "angela_acosta.png",
  content_type: "image/png"
)

# Matthew Vance
tutor_matthew_vance = User.create!(
  first_name: "Matthew",
  last_name: "Vance",
  email: "matthew.vance@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "2000-11-23",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_matthew_vance.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653460/414418_r8fhe8.jpg"),
  filename: "matthew_vance.jpg",
  content_type: "image/jpeg"
)

# James Stewart
tutor_james_stewart = User.create!(
  first_name: "James",
  last_name: "Stewart",
  email: "james.stewart@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1989-10-12",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_james_stewart.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653460/grmnlrt_y7hqui.jpg"),
  filename: "james_stewart.jpg",
  content_type: "image/jpeg"
)

# Jacob Sandoval
tutor_jacob_sandoval = User.create!(
  first_name: "Jacob",
  last_name: "Sandoval",
  email: "jacob.sandoval@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1999-08-08",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_jacob_sandoval.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653460/db0sch_xhdtq7.jpg"),
  filename: "jacob_sandoval.jpg",
  content_type: "image/jpeg"
)

# Paul Mckinney
tutor_paul_mckinney = User.create!(
  first_name: "Paul",
  last_name: "Mckinney",
  email: "paul.mckinney@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1993-01-20",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_paul_mckinney.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653458/cedricmenteau_aoukmk.jpg"),
  filename: "paul_mckinney.jpg",
  content_type: "image/jpeg"
)

# Christopher Anderson
tutor_christopher_anderson = User.create!(
  first_name: "Christopher",
  last_name: "Anderson",
  email: "christopher.anderson@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1996-12-10",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

)
tutor_christopher_anderson.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653458/Martin-Alexander_sa1nvs.jpg"),
  filename: "christopher_anderson.jpg",
  content_type: "image/jpeg"
)

# Paul Daniels
tutor_paul_daniels = User.create!(
  first_name: "Paul",
  last_name: "Daniels",
  email: "paul.daniels@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1999-04-12",
  bio: "I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."
)
tutor_paul_daniels.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653457/pdunleav_bmvoyc.jpg"),
  filename: "paul_daniels.jpg",
  content_type: "image/jpeg"
)

puts "Creating learner Safwan Ansari..."
learner_safwan_ansari = User.create!(
  first_name: "Safwan",
  last_name: "Ansari",
  email: "safwan.ansari@student.studyspark.com",
  password: "password123",
  tutor: false,
  date_of_birth: "2010-03-15"
)
puts "Creating studies for Safwan..."
study_safwan_algebra = Study.create!(user: learner_safwan_ansari, subject: subject_grade9_algebra_i, learning_objective: "Master solving linear equations with one variable")
study_safwan_science = Study.create!(user: learner_safwan_ansari, subject: subject_grade9_science, learning_objective: "Understand the basics of the water cycle")

puts "Creating expertises..."

# Sarah Johnson - Math specialist
expertise_sarah_johnson_pre_algebra = Expertise.create!(user: tutor_sarah_johnson, subject: subject_grade8_pre_algebra, tutor_rate: 2500)
expertise_sarah_johnson_algebra_i = Expertise.create!(user: tutor_sarah_johnson, subject: subject_grade9_algebra_i, tutor_rate: 3000)
expertise_sarah_johnson_geometry_9 = Expertise.create!(user: tutor_sarah_johnson, subject: subject_grade9_geometry, tutor_rate: 3200)

# Michael Chen - Science specialist
expertise_michael_chen_science_8 = Expertise.create!(user: tutor_michael_chen, subject: subject_grade8_science, tutor_rate: 2800)
expertise_michael_chen_science_9 = Expertise.create!(user: tutor_michael_chen, subject: subject_grade9_science, tutor_rate: 3500)
expertise_michael_chen_chemistry = Expertise.create!(user: tutor_michael_chen, subject: subject_grade10_chemistry, tutor_rate: 4000)

# Emily Rodriguez - English specialist
expertise_emily_rodriguez_ela_8 = Expertise.create!(user: tutor_emily_rodriguez, subject: subject_grade8_english_language_arts, tutor_rate: 2700)
expertise_emily_rodriguez_english_lit_9 = Expertise.create!(user: tutor_emily_rodriguez, subject: subject_grade9_english_literature, tutor_rate: 3100)
expertise_emily_rodriguez_ap_english_lang_10 = Expertise.create!(user: tutor_emily_rodriguez, subject: subject_grade10_ap_english_language, tutor_rate: 4200)

# David Thompson - Physics/Math
expertise_david_thompson_physics_10 = Expertise.create!(user: tutor_david_thompson, subject: subject_grade10_physics, tutor_rate: 4500)
expertise_david_thompson_pre_calculus_10 = Expertise.create!(user: tutor_david_thompson, subject: subject_grade10_pre_calculus, tutor_rate: 4300)
expertise_david_thompson_algebra_ii_10 = Expertise.create!(user: tutor_david_thompson, subject: subject_grade10_algebra_ii, tutor_rate: 3400)
expertise_david_thompson_geometry_10 = Expertise.create!(user: tutor_david_thompson, subject: subject_grade10_geometry, tutor_rate: 3500)

# Naika Estriplet - Spanish specialist
expertise_naika_estriplet_spanish_i_9 = Expertise.create!(user: tutor_naika_estriplet, subject: subject_grade9_spanish_i, tutor_rate: 2900)
expertise_naika_estriplet_spanish_ii_10 = Expertise.create!(user: tutor_naika_estriplet, subject: subject_grade10_spanish_ii, tutor_rate: 3300)
expertise_naika_estriplet_spanish_ii_10 = Expertise.create!(user: tutor_naika_estriplet, subject: subject_grade10_spanish_ii, tutor_rate: 3300)

# Naika Estriplet - Science Expertise
expertise_naika_estriplet_grade9_science = Expertise.create!(user: tutor_naika_estriplet, subject: subject_grade9_science, tutor_rate: 2700)

# Robert Martinez - Chemistry/Science
expertise_robert_martinez_chemistry_10 = Expertise.create!(user: tutor_robert_martinez, subject: subject_grade10_chemistry, tutor_rate: 3800)
expertise_robert_martinez_science_8 = Expertise.create!(user: tutor_robert_martinez, subject: subject_grade8_science, tutor_rate: 2600)
expertise_robert_martinez_science_9 = Expertise.create!(user: tutor_robert_martinez, subject: subject_grade9_science, tutor_rate: 3200)

# Ashley Davis - History specialist
expertise_ashley_davis_world_history_8 = Expertise.create!(user: tutor_ashley_davis, subject: subject_grade8_world_history, tutor_rate: 2800)
expertise_ashley_davis_us_history_10 = Expertise.create!(user: tutor_ashley_davis, subject: subject_grade10_us_history, tutor_rate: 3100)
expertise_ashley_davis_world_cultures_9 = Expertise.create!(user: tutor_ashley_davis, subject: subject_grade9_world_cultures, tutor_rate: 2900)

# Christopher Wilson - Math
expertise_christopher_wilson_algebra_i_9 = Expertise.create!(user: tutor_christopher_wilson, subject: subject_grade9_algebra_i, tutor_rate: 2800)
expertise_christopher_wilson_geometry_9 = Expertise.create!(user: tutor_christopher_wilson, subject: subject_grade9_geometry, tutor_rate: 3000)

# Amanda Garcia - Psychology
expertise_amanda_garcia_psychology_10 = Expertise.create!(user: tutor_amanda_garcia, subject: subject_grade10_psychology, tutor_rate: 3500)

# Daniel Brown - Multi-subject
expertise_daniel_brown_pre_algebra_8 = Expertise.create!(user: tutor_daniel_brown, subject: subject_grade8_pre_algebra, tutor_rate: 2400)
expertise_daniel_brown_ela_8 = Expertise.create!(user: tutor_daniel_brown, subject: subject_grade8_english_language_arts, tutor_rate: 2600)

expertise_maria_smith_pre_algebra_8 = Expertise.create!(user: tutor_maria_smith, subject: subject_grade8_pre_algebra, tutor_rate: 3970)
expertise_maria_smith_french_i_9 = Expertise.create!(user: tutor_maria_smith, subject: subject_grade9_french_i, tutor_rate: 3442)

expertise_sabrina_johnson_english_language_arts_8 = Expertise.create!(user: tutor_sabrina_johnson, subject: subject_grade8_english_language_arts, tutor_rate: 3308)
expertise_sabrina_johnson_algebra_ii_10 = Expertise.create!(user: tutor_sabrina_johnson, subject: subject_grade10_algebra_ii, tutor_rate: 2945)

expertise_angela_acosta_science_8 = Expertise.create!(user: tutor_angela_acosta, subject: subject_grade8_science, tutor_rate: 3169)
expertise_angela_acosta_chemistry_10 = Expertise.create!(user: tutor_angela_acosta, subject: subject_grade10_chemistry, tutor_rate: 3366)

expertise_matthew_vance_world_history_8 = Expertise.create!(user: tutor_matthew_vance, subject: subject_grade8_world_history, tutor_rate: 3120)
expertise_matthew_vance_physics_10 = Expertise.create!(user: tutor_matthew_vance, subject: subject_grade10_physics, tutor_rate: 2617)

expertise_james_stewart_geography_8 = Expertise.create!(user: tutor_james_stewart, subject: subject_grade8_geography, tutor_rate: 3279)
expertise_james_stewart_pre_calculus_10 = Expertise.create!(user: tutor_james_stewart, subject: subject_grade10_pre_calculus, tutor_rate: 2531)

expertise_jacob_sandoval_health_education_8 = Expertise.create!(user: tutor_jacob_sandoval, subject: subject_grade8_health_education, tutor_rate: 3261)
expertise_jacob_sandoval_ap_english_language_10 = Expertise.create!(user: tutor_jacob_sandoval, subject: subject_grade10_ap_english_language, tutor_rate: 2729)

expertise_paul_mckinney_algebra_i_9 = Expertise.create!(user: tutor_paul_mckinney, subject: subject_grade9_algebra_i, tutor_rate: 3589)
expertise_paul_mckinney_us_history_10 = Expertise.create!(user: tutor_paul_mckinney, subject: subject_grade10_us_history, tutor_rate: 3183)

expertise_christopher_anderson_geometry_9 = Expertise.create!(user: tutor_christopher_anderson, subject: subject_grade9_geometry, tutor_rate: 2753)
expertise_christopher_anderson_psychology_10 = Expertise.create!(user: tutor_christopher_anderson, subject: subject_grade10_psychology, tutor_rate: 3881)

expertise_paul_daniels_science_9 = Expertise.create!(user: tutor_paul_daniels, subject: subject_grade9_science, tutor_rate: 3745)
expertise_paul_daniels_spanish_ii_10 = Expertise.create!(user: tutor_paul_daniels, subject: subject_grade10_spanish_ii, tutor_rate: 3285)

expertise_fernando_villarreal_english_literature_9 = Expertise.create!(user: tutor_fernando_villarreal, subject: subject_grade9_english_literature, tutor_rate: 3200)
expertise_fernando_villarreal_geometry_10 = Expertise.create!(user: tutor_fernando_villarreal, subject: subject_grade10_geometry, tutor_rate: 3832)

expertise_joseph_duran_world_cultures_9 = Expertise.create!(user: tutor_joseph_duran, subject: subject_grade9_world_cultures, tutor_rate: 3964)

expertise_roger_garza_spanish_i_9 = Expertise.create!(user: tutor_roger_garza, subject: subject_grade9_spanish_i, tutor_rate: 3307)

puts "Created #{Expertise.count} expertises"

puts "Seeding sessions, materials and flashcards for the demo…"
TutoringSession.create!(expertise: expertise_naika_estriplet_grade9_science, study: study_safwan_science, start_time: "Tue, 18 Jun 2025 12:00:00")

# Materials for Science
file1 = File.open(Rails.root.join("db/demo/06012025_momentum_collision_5_0.pdf"))
material1 = Material.create!(study: study_safwan_science)
material1.process_file(file1)
material1.save!
material1.generate_flashcards

flashcards = material1.flashcards.to_a
flashcards.pop(3)
flashcards.each { |f| f.update!(solved: true) }

file2 = File.open(Rails.root.join("db/demo/06062025_momentum_collision_5_1.pdf"))
material2 = Material.create!(study: study_safwan_science)
material2.process_file(file2)
material2.save!
material2.generate_flashcards

flashcards = material2.flashcards.to_a
flashcards.pop(3)
flashcards.each { |f| f.update!(solved: true) }

# Materials for Algebra
material3 = Material.create!(study: study_safwan_algebra)
material3.process_file(file2)
material3.save!
material3.generate_flashcards

material4 = Material.create!(study: study_safwan_algebra)
material4.process_file(file1)
material4.save!
material4.generate_flashcards

[material3, material4].each do |material|
  material.flashcards.update_all(solved: true)
end


puts "\n=== SEEDING COMPLETED ==="
puts "#{User.where(tutor: true).count} tutors created"
puts "#{User.where(tutor: false).count} learners created"
puts "#{Subject.count} subjects created"
puts "#{Expertise.count} expertises created"
puts "#{Study.count} studies created"
