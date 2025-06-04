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
tutor_sarah_johnson = User.create!(first_name: "Sarah", last_name: "Johnson", email: "sarah.johnson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1995-03-15", bio: "Math tutor with 5+ years experience" )
tutor_michael_chen = User.create!(first_name: "Michael", last_name: "Chen", email: "michael.chen@studyspark.com", password: "password123", tutor: true, date_of_birth: "1992-07-22", bio: "Biology PhD student, passionate about science education" )
tutor_emily_rodriguez = User.create!(first_name: "Emily", last_name: "Rodriguez", email: "emily.rodriguez@studyspark.com", password: "password123", tutor: true, date_of_birth: "1988-11-08", bio: "Former high school English teacher" )
tutor_david_thompson = User.create!(first_name: "David", last_name: "Thompson", email: "david.thompson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1994-01-30", bio: "Engineering student, physics and math specialist" )
tutor_jessica_kim = User.create!(first_name: "Jessica", last_name: "Kim", email: "jessica.kim@studyspark.com", password: "password123", tutor: true, date_of_birth: "1990-05-12", bio: "Native Spanish speaker with education degree" )
tutor_robert_martinez = User.create!(first_name: "Robert", last_name: "Martinez", email: "robert.martinez@studyspark.com", password: "password123", tutor: true, date_of_birth: "1993-09-03", bio: "Chemistry major with lab research experience" )
tutor_ashley_davis = User.create!(first_name: "Ashley", last_name: "Davis", email: "ashley.davis@studyspark.com", password: "password123", tutor: true, date_of_birth: "1991-12-18", bio: "History enthusiast with Master's degree" )
tutor_christopher_wilson = User.create!(first_name: "Christopher", last_name: "Wilson", email: "christopher.wilson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1996-04-25", bio: "Computer Science graduate working in tech" )
tutor_amanda_garcia = User.create!(first_name: "Amanda", last_name: "Garcia", email: "amanda.garcia@studyspark.com", password: "password123", tutor: true, date_of_birth: "1989-08-14", bio: "Psychology major with tutoring certification" )
tutor_daniel_brown = User.create!(first_name: "Daniel", last_name: "Brown", email: "daniel.brown@studyspark.com", password: "password123", tutor: true, date_of_birth: "1987-06-07", bio: "Experienced in multiple subjects, patient teaching style" )

# Create learners
learner_alex_smith = User.create!(first_name: "Alex", last_name: "Smith", email: "alex.smith@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-03-15" )
learner_jordan_johnson = User.create!(first_name: "Jordan", last_name: "Johnson", email: "jordan.johnson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-07-22" )
learner_taylor_williams = User.create!(first_name: "Taylor", last_name: "Williams", email: "taylor.williams@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-11-08" )
learner_morgan_brown = User.create!(first_name: "Morgan", last_name: "Brown", email: "morgan.brown@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-01-30" )
learner_casey_jones = User.create!(first_name: "Casey", last_name: "Jones", email: "casey.jones@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-05-12" )
learner_riley_garcia = User.create!(first_name: "Riley", last_name: "Garcia", email: "riley.garcia@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-09-03" )
learner_avery_miller = User.create!(first_name: "Avery", last_name: "Miller", email: "avery.miller@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-12-18" )
learner_cameron_davis = User.create!(first_name: "Cameron", last_name: "Davis", email: "cameron.davis@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-04-25" )
learner_drew_rodriguez = User.create!(first_name: "Drew", last_name: "Rodriguez", email: "drew.rodriguez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-08-14" )
learner_hayden_martinez = User.create!(first_name: "Hayden", last_name: "Martinez", email: "hayden.martinez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-06-07" )
learner_jamie_hernandez = User.create!(first_name: "Jamie", last_name: "Hernandez", email: "jamie.hernandez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-10-21" )
learner_parker_lopez = User.create!(first_name: "Parker", last_name: "Lopez", email: "parker.lopez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-02-28" )
learner_quinn_gonzalez = User.create!(first_name: "Quinn", last_name: "Gonzalez", email: "quinn.gonzalez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-07-16" )
learner_reese_wilson = User.create!(first_name: "Reese", last_name: "Wilson", email: "reese.wilson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-11-11" )
learner_sage_anderson = User.create!(first_name: "Sage", last_name: "Anderson", email: "sage.anderson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-01-04" )
learner_blake_thomas = User.create!(first_name: "Blake", last_name: "Thomas", email: "blake.thomas@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-09-19" )
learner_dakota_taylor = User.create!(first_name: "Dakota", last_name: "Taylor", email: "dakota.taylor@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-05-23" )
learner_emerson_moore = User.create!(first_name: "Emerson", last_name: "Moore", email: "emerson.moore@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-03-07" )
learner_finley_jackson = User.create!(first_name: "Finley", last_name: "Jackson", email: "finley.jackson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-12-02" )
learner_gray_martin = User.create!(first_name: "Gray", last_name: "Martin", email: "gray.martin@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-08-26" )
learner_harper_lee = User.create!(first_name: "Harper", last_name: "Lee", email: "harper.lee@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-04-12" )
learner_indigo_perez = User.create!(first_name: "Indigo", last_name: "Perez", email: "indigo.perez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-11-29" )
learner_jaden_thompson = User.create!(first_name: "Jaden", last_name: "Thompson", email: "jaden.thompson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-06-18" )
learner_kai_white = User.create!(first_name: "Kai", last_name: "White", email: "kai.white@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-01-25" )
learner_lane_harris = User.create!(first_name: "Lane", last_name: "Harris", email: "lane.harris@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-08-13" )
learner_marley_sanchez = User.create!(first_name: "Marley", last_name: "Sanchez", email: "marley.sanchez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-03-01" )
learner_nova_clark = User.create!(first_name: "Nova", last_name: "Clark", email: "nova.clark@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-09-17" )
learner_ocean_ramirez = User.create!(first_name: "Ocean", last_name: "Ramirez", email: "ocean.ramirez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-05-04" )
learner_phoenix_lewis = User.create!(first_name: "Phoenix", last_name: "Lewis", email: "phoenix.lewis@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-10-21" )
learner_river_robinson = User.create!(first_name: "River", last_name: "Robinson", email: "river.robinson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-02-08" )
learner_skylar_walker = User.create!(first_name: "Skylar", last_name: "Walker", email: "skylar.walker@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-07-26" )
learner_tatum_young = User.create!(first_name: "Tatum", last_name: "Young", email: "tatum.young@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-12-14" )
learner_unity_allen = User.create!(first_name: "Unity", last_name: "Allen", email: "unity.allen@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-04-30" )
learner_vale_king = User.create!(first_name: "Vale", last_name: "King", email: "vale.king@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-11-16" )
learner_wren_wright = User.create!(first_name: "Wren", last_name: "Wright", email: "wren.wright@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-06-03" )
learner_zion_scott = User.create!(first_name: "Zion", last_name: "Scott", email: "zion.scott@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-01-20" )
learner_aria_torres = User.create!(first_name: "Aria", last_name: "Torres", email: "aria.torres@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-08-07" )
learner_bella_nguyen = User.create!(first_name: "Bella", last_name: "Nguyen", email: "bella.nguyen@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-03-25" )
learner_chloe_hill = User.create!(first_name: "Chloe", last_name: "Hill", email: "chloe.hill@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-10-12" )
learner_delia_flores = User.create!(first_name: "Delia", last_name: "Flores", email: "delia.flores@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-04-28" )


puts "Created #{User.count} users"

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

# Jessica Kim - Spanish specialist
expertise_jessica_kim_spanish_i_9 = Expertise.create!(user: tutor_jessica_kim, subject: subject_grade9_spanish_i, tutor_rate: 2900)
expertise_jessica_kim_spanish_ii_10 = Expertise.create!(user: tutor_jessica_kim, subject: subject_grade10_spanish_ii, tutor_rate: 3300)

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

puts "Created #{Expertise.count} expertises"

puts "Creating studies..."

# Alex Smith studies
alex_studies_grade8_pre_algebra = Study.create!(user: learner_alex_smith, subject: subject_grade8_pre_algebra, learning_objective: "Master solving linear equations with one variable" )
alex_studies_grade8_science = Study.create!(user: learner_alex_smith, subject: subject_grade8_science, learning_objective: "Understand the basics of the water cycle" )

# Avery Miller study
avery_studies_grade10_physics = Study.create!(user: learner_avery_miller, subject: subject_grade10_physics, learning_objective: "Apply Newton's laws to motion problems" )

# Jordan Johnson studies
jordan_studies_grade9_science = Study.create!(user: learner_jordan_johnson, subject: subject_grade9_science, learning_objective: "Understand cell structure and function" )
jordan_studies_grade9_english_literature = Study.create!(user: learner_jordan_johnson, subject: subject_grade9_english_literature, learning_objective: "Analyze themes in classic novels" )

# Taylor Williams study
taylor_studies_grade8_english_language_arts = Study.create!(user: learner_taylor_williams, subject: subject_grade8_english_language_arts, learning_objective: "Improve essay writing structure and argumentation" )

# Morgan Brown study
morgan_studies_grade10_chemistry = Study.create!(user: learner_morgan_brown, subject: subject_grade10_chemistry, learning_objective: "Balance chemical equations and understand reactions" )

# Casey Jones studies
casey_studies_grade9_spanish_i = Study.create!(user: learner_casey_jones, subject: subject_grade9_spanish_i, learning_objective: "Learn basic conversational phrases and greetings" )
casey_studies_grade9_algebra_i = Study.create!(user: learner_casey_jones, subject: subject_grade9_algebra_i, learning_objective: "Solve systems of linear equations" )

# Riley Garcia study
riley_studies_grade9_algebra_i = Study.create!(user: learner_riley_garcia, subject: subject_grade9_algebra_i, learning_objective: "Learn to factor polynomials and quadratic expressions" )


# Cameron Davis study
cameron_studies_grade8_world_history = Study.create!(user: learner_cameron_davis, subject: subject_grade8_world_history, learning_objective: "Understand major historical events and their causes" )

# Drew Rodriguez studies
drew_studies_grade9_geometry = Study.create!(user: learner_drew_rodriguez, subject: subject_grade9_geometry, learning_objective: "Prove geometric theorems using logical reasoning" )
drew_studies_grade10_geometry = Study.create!(user: learner_drew_rodriguez, subject: subject_grade10_geometry, learning_objective: "Understand transformations in the coordinate plane" )

# Hayden Martinez study
hayden_studies_grade10_pre_calculus = Study.create!(user: learner_hayden_martinez, subject: subject_grade10_pre_calculus, learning_objective: "Master trigonometric functions and identities" )

# Jamie Hernandez study
jamie_studies_grade9_english_literature = Study.create!(user: learner_jamie_hernandez, subject: subject_grade9_english_literature, learning_objective: "Analyze literary devices in poetry and prose" )

# Parker Lopez study
parker_studies_grade8_science = Study.create!(user: learner_parker_lopez, subject: subject_grade8_science, learning_objective: "Understand basic principles of matter and energy" )

# Quinn Gonzalez study
quinn_studies_grade10_us_history = Study.create!(user: learner_quinn_gonzalez, subject: subject_grade10_us_history, learning_objective: "Learn about the American Revolution and Constitution" )

# Reese Wilson study
reese_studies_grade9_french_i = Study.create!(user: learner_reese_wilson, subject: subject_grade9_french_i, learning_objective: "Master basic French pronunciation and vocabulary" )

# Sage Anderson study
sage_studies_grade10_psychology = Study.create!(user: learner_sage_anderson, subject: subject_grade10_psychology, learning_objective: "Understand basic psychological principles and theories" )

# Blake Thomas study
blake_studies_grade10_algebra_ii = Study.create!(user: learner_blake_thomas, subject: subject_grade10_algebra_ii, learning_objective: "Work with logarithms and exponential functions" )

# Dakota Taylor study
dakota_studies_grade9_science = Study.create!(user: learner_dakota_taylor, subject: subject_grade9_science, learning_objective: "Learn genetics and heredity principles" )

# Emerson Moore study
emerson_studies_grade8_geography = Study.create!(user: learner_emerson_moore, subject: subject_grade8_geography, learning_objective: "Study world maps and geographic features" )

# Finley Jackson study
finley_studies_grade10_ap_english_language = Study.create!(user: learner_finley_jackson, subject: subject_grade10_ap_english_language, learning_objective: "Develop advanced analytical writing skills" )

# Gray Martin study
gray_studies_grade10_spanish_ii = Study.create!(user: learner_gray_martin, subject: subject_grade10_spanish_ii, learning_objective: "Practice advanced Spanish conversation" )

# Harper Lee study
harper_studies_grade10_chemistry = Study.create!(user: learner_harper_lee, subject: subject_grade10_chemistry, learning_objective: "Understand periodic table trends and atomic structure" )

# Indigo Perez study
indigo_studies_grade8_pre_algebra = Study.create!(user: learner_indigo_perez, subject: subject_grade8_pre_algebra, learning_objective: "Strengthen foundation in integer operations" )

# Jaden Thompson study
jaden_studies_grade8_health_education = Study.create!(user: learner_jaden_thompson, subject: subject_grade8_health_education, learning_objective: "Learn about nutrition and healthy lifestyle choices" )

# Kai White study
kai_studies_grade9_world_cultures = Study.create!(user: learner_kai_white, subject: subject_grade9_world_cultures, learning_objective: "Explore different cultures and their traditions" )

# Lane Harris study
lane_studies_grade9_geometry = Study.create!(user: learner_lane_harris, subject: subject_grade9_geometry, learning_objective: "Calculate area and volume of complex shapes" )

# Marley Sanchez study
marley_studies_grade8_english_language_arts = Study.create!(user: learner_marley_sanchez, subject: subject_grade8_english_language_arts, learning_objective: "Develop vocabulary and reading comprehension" )

# Nova Clark study
nova_studies_grade10_physics = Study.create!(user: learner_nova_clark, subject: subject_grade10_physics, learning_objective: "Understand energy conservation and transformations" )

# Ocean Ramirez study
ocean_studies_grade9_algebra_i = Study.create!(user: learner_ocean_ramirez, subject: subject_grade9_algebra_i, learning_objective: "Understand graphing linear functions and inequalities" )

# Phoenix Lewis study
phoenix_studies_grade9_science = Study.create!(user: learner_phoenix_lewis, subject: subject_grade9_science, learning_objective: "Master photosynthesis and cellular respiration" )

# River Robinson study
river_studies_grade8_world_history = Study.create!(user: learner_river_robinson, subject: subject_grade8_world_history, learning_objective: "Study ancient civilizations and their contributions" )


puts "Created #{Study.count} studies"

puts "Creating materials..."

# Materials for Alex's Pre-Algebra study
materials_alex_pre_algebra_linear_equations = Material.new(name: "Linear Equations Practice", description: "Step-by-step practice problems for solving equations", format: "PDF", study: alex_studies_grade8_pre_algebra)
linear_equations_file = File.open("./db/files/alex_pre_algebra/linear_equations.pdf") # Assuming this file exists
materials_alex_pre_algebra_linear_equations.file.attach(io: linear_equations_file, filename: "linear_equation.pdf", content_type: "application/pdf")
materials_alex_pre_algebra_linear_equations.save

# Materials for Avery's Physics study
# -------------------------------------
materials_avery_physics_momentum_and_collisions1 = Material.new(name: "Momentum and Collision 1", description: "Understanding momentum and collision", format: "PDF", study: avery_studies_grade10_physics)
physics_momentum_and_collisions1_file = File.open("./db/files/avery_collisions/Momentum and Collisions 1.pdf") # Assuming this file exists
materials_avery_physics_momentum_and_collisions1.file.attach(io: physics_momentum_and_collisions1_file, filename: "Momentum and Collisions 1.pdf", content_type: "application/pdf")
materials_avery_physics_momentum_and_collisions1.save


materials_avery_physics_momentum_and_collisions2 = Material.new(name: "Momentum and Collision 3", description: "Understanding momentum and collision", format: "PDF", study: avery_studies_grade10_physics)
physics_momentum_and_collisions2_file = File.open("./db/files/avery_collisions/Momentum and Collisions 2.pdf") # Assuming this file exists
materials_avery_physics_momentum_and_collisions2.file.attach(io: physics_momentum_and_collisions2_file, filename: "Momentum and Collisions 2.pdf", content_type: "application/pdf")
materials_avery_physics_momentum_and_collisions2.save

materials_avery_physics_momentum_and_collisions3 = Material.new(name: "Momentum and Collision 3", description: "Understanding momentum and collision", format: "PDF", study: avery_studies_grade10_physics)
physics_momentum_and_collisions3_file = File.open("./db/files/avery_collisions/Momentum and Collisions 3.pdf") # Assuming this file exists
materials_avery_physics_momentum_and_collisions3.file.attach(io: physics_momentum_and_collisions3_file, filename: "Momentum and Collisions 3.pdf", content_type: "application/pdf")
materials_avery_physics_momentum_and_collisions3.save


materials_avery_physics_momentum_and_collisions4 = Material.new(name: "Momentum and Collision 4", description: "Understanding momentum and collision", format: "PDF", study: avery_studies_grade10_physics)
physics_momentum_and_collisions4_file = File.open("./db/files/avery_collisions/Momentum and Collisions 4.pdf") # Assuming this file exists
materials_avery_physics_momentum_and_collisions4.file.attach(io: physics_momentum_and_collisions4_file, filename: "Momentum and Collisions 4.pdf", content_type: "application/pdf")
materials_avery_physics_momentum_and_collisions4.save

materials_avery_physics_momentum_and_collisions5 = Material.new(name: "Momentum and Collision 5", description: "Understanding momentum and collision", format: "PDF", study: avery_studies_grade10_physics)
physics_momentum_and_collisions5_file = File.open("./db/files/avery_collisions/Momentum and Collisions 5.pdf") # Assuming this file exists
materials_avery_physics_momentum_and_collisions5.file.attach(io: physics_momentum_and_collisions5_file, filename: "Momentum and Collisions 5.pdf", content_type: "application/pdf")
materials_avery_physics_momentum_and_collisions5.save


materials_avery_physics_momentum_and_collisions_applications = Material.new(name: "Momentum and Collision Applications", description: "Understanding momentum and collision", format: "PDF", study: avery_studies_grade10_physics)
physics_momentum_and_collisions_applications_file = File.open("./db/files/avery_collisions/Momentum and Collisions Applications.pdf") # Assuming this file exists
materials_avery_physics_momentum_and_collisions_applications.file.attach(io: physics_momentum_and_collisions_applications_file, filename: "Momentum and Collisions 5.pdf", content_type: "application/pdf")
materials_avery_physics_momentum_and_collisions_applications.save


materials_avery_physics_momentum_and_collisions_quizzes = Material.new(name: "Momentum and Collision Quizzes", description: "Understanding momentum and collision", format: "PDF", study: avery_studies_grade10_physics)
physics_momentum_and_collisions_quizzes_file = File.open("./db/files/avery_collisions/Momentum and Collisions quizzes.pdf") # Assuming this file exists
materials_avery_physics_momentum_and_collisions_quizzes.file.attach(io: physics_momentum_and_collisions_quizzes_file, filename: "Momentum and Collisions 5.pdf", content_type: "application/pdf")
materials_avery_physics_momentum_and_collisions_quizzes.save

# ---------------------


puts "Created #{Material.count} materials"

puts "\n=== SEEDING COMPLETED ==="
puts "#{User.where(tutor: true).count} tutors created"
puts "#{User.where(tutor: false).count} learners created"
puts "#{Subject.count} subjects created"
puts "#{Expertise.count} expertises created"
puts "#{Study.count} studies created"
puts "#{Material.count} materials created"