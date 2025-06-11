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

# Jessica Kim
tutor_jessica_kim = User.create!(
  first_name: "Jessica",
  last_name: "Kim",
  email: "jessica.kim@studyspark.com",
  password: "password123",
  tutor: true,
  date_of_birth: "1990-05-12",
  bio: "Native Spanish speaker with education degree. I bring cultural context and interactive exercises to the classroom, helping students achieve fluency through immersion and practice."
)
tutor_jessica_kim.profile_picture.attach(
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
  bio: "How arrive get four adult evening. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."
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
  bio: "Population little century center discover clearly. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

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
  bio: "Believe audience line prepare market that cell very without yet tough. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

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
  bio: "Sense president medical season finish bad suggest group else arm child operation design education. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

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
  bio: "System head allow activity you skill health remain question identify simple guess ahead. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

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
  bio: "Whole assume attack fear security deal upon respond. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

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
  bio: "Street beat property reflect rate method each. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."

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
  bio: "Though more piece work hour opportunity word single sometimes many. I work with students at their own pace, using creative and interactive strategies to make learning enjoyable and effective."
)
tutor_paul_daniels.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/dirgjwkty/image/upload/v1749653457/pdunleav_bmvoyc.jpg"),
  filename: "paul_daniels.jpg",
  content_type: "image/jpeg"
)



# Create learners
learner_developer = User.create!(first_name: "Test Learner", last_name: "Dev", email: "learner@test.com", password: "password123", tutor: false, date_of_birth: "1995-03-15", bio: "Math tutor with 5+ years experience" )
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

puts "\n=== SEEDING COMPLETED ==="
puts "#{User.where(tutor: true).count} tutors created"
puts "#{User.where(tutor: false).count} learners created"
puts "#{Subject.count} subjects created"
puts "#{Expertise.count} expertises created"
puts "#{Study.count} studies created"
