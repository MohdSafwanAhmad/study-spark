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
  { name: "Physical Science", grade_level: "8" },
  { name: "World History", grade_level: "8" },
  { name: "Geography", grade_level: "8" },
  { name: "Health Education", grade_level: "8" },
  
  # Grade 9
  { name: "Algebra I", grade_level: "9" },
  { name: "Geometry", grade_level: "9" },
  { name: "Biology", grade_level: "9" },
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
  { name: "Spanish II", grade_level: "10" }
])

puts "Created #{Subject.count} subjects"

puts "Creating users..."

# Create tutors (20 users)
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
  { first_name: "Daniel", last_name: "Brown", email: "daniel.brown@studyspark.com", password: "password123", tutor: true, date_of_birth: "1987-06-07", bio: "Experienced in multiple subjects, patient teaching style" },
  { first_name: "Lauren", last_name: "Miller", email: "lauren.miller@studyspark.com", password: "password123", tutor: true, date_of_birth: "1994-10-21", bio: "French language specialist" },
  { first_name: "Matthew", last_name: "Jones", email: "matthew.jones@studyspark.com", password: "password123", tutor: true, date_of_birth: "1992-02-28", bio: "Advanced mathematics tutor" },
  { first_name: "Samantha", last_name: "Taylor", email: "samantha.taylor@studyspark.com", password: "password123", tutor: true, date_of_birth: "1995-07-16", bio: "Science education specialist" },
  { first_name: "Kevin", last_name: "Anderson", email: "kevin.anderson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1990-11-11", bio: "Social studies and history expert" },
  { first_name: "Rachel", last_name: "Thomas", email: "rachel.thomas@studyspark.com", password: "password123", tutor: true, date_of_birth: "1993-01-04", bio: "English and literature specialist" },
  { first_name: "Brandon", last_name: "Jackson", email: "brandon.jackson@studyspark.com", password: "password123", tutor: true, date_of_birth: "1991-09-19", bio: "Physics and engineering tutor" },
  { first_name: "Nicole", last_name: "White", email: "nicole.white@studyspark.com", password: "password123", tutor: true, date_of_birth: "1988-05-23", bio: "Multi-subject elementary and middle school tutor" },
  { first_name: "Tyler", last_name: "Harris", email: "tyler.harris@studyspark.com", password: "password123", tutor: true, date_of_birth: "1994-03-07", bio: "Chemistry and biology tutor" },
  { first_name: "Stephanie", last_name: "Martin", email: "stephanie.martin@studyspark.com", password: "password123", tutor: true, date_of_birth: "1992-12-02", bio: "Language arts and writing specialist" },
  { first_name: "Justin", last_name: "Clark", email: "justin.clark@studyspark.com", password: "password123", tutor: true, date_of_birth: "1989-08-26", bio: "Mathematics and science tutor" }
])

# Create learners (80 users)
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
  { first_name: "Delia", last_name: "Flores", email: "delia.flores@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-04-28" },
  { first_name: "Emma", last_name: "Green", email: "emma.green@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-11-15" },
  { first_name: "Faith", last_name: "Adams", email: "faith.adams@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-06-02" },
  { first_name: "Grace", last_name: "Nelson", email: "grace.nelson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-12-19" },
  { first_name: "Hannah", last_name: "Baker", email: "hannah.baker@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-07-06" },
  { first_name: "Iris", last_name: "Hall", email: "iris.hall@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-02-23" },
  { first_name: "Julia", last_name: "Rivera", email: "julia.rivera@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-09-10" },
  { first_name: "Kira", last_name: "Campbell", email: "kira.campbell@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-04-27" },
  { first_name: "Luna", last_name: "Mitchell", email: "luna.mitchell@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-11-14" },
  { first_name: "Maya", last_name: "Carter", email: "maya.carter@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-06-01" },
  { first_name: "Nora", last_name: "Roberts", email: "nora.roberts@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-01-18" },
  { first_name: "Olivia", last_name: "Gomez", email: "olivia.gomez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-08-05" },
  { first_name: "Paige", last_name: "Phillips", email: "paige.phillips@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-03-22" },
  { first_name: "Quincy", last_name: "Evans", email: "quincy.evans@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-10-09" },
  { first_name: "Ruby", last_name: "Turner", email: "ruby.turner@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-05-26" },
  { first_name: "Sofia", last_name: "Diaz", email: "sofia.diaz@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-12-13" },
  { first_name: "Tessa", last_name: "Parker", email: "tessa.parker@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-07-30" },
  { first_name: "Uma", last_name: "Cruz", email: "uma.cruz@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-03-17" },
  { first_name: "Violet", last_name: "Edwards", email: "violet.edwards@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-10-04" },
  { first_name: "Willow", last_name: "Collins", email: "willow.collins@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-05-21" },
  { first_name: "Zoe", last_name: "Stewart", email: "zoe.stewart@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-12-08" },
  { first_name: "Aaron", last_name: "Sanchez", email: "aaron.sanchez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-04-25" },
  { first_name: "Ben", last_name: "Morris", email: "ben.morris@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-11-12" },
  { first_name: "Caleb", last_name: "Rogers", email: "caleb.rogers@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-06-29" },
  { first_name: "Diego", last_name: "Reed", email: "diego.reed@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-01-16" },
  { first_name: "Ethan", last_name: "Cook", email: "ethan.cook@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-08-03" },
  { first_name: "Felix", last_name: "Morgan", email: "felix.morgan@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-02-20" },
  { first_name: "Gabriel", last_name: "Bailey", email: "gabriel.bailey@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-09-07" },
  { first_name: "Hugo", last_name: "Rivera", email: "hugo.rivera@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-04-24" },
  { first_name: "Ivan", last_name: "Cooper", email: "ivan.cooper@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-11-11" },
  { first_name: "Jake", last_name: "Richardson", email: "jake.richardson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-05-28" },
  { first_name: "Kevin", last_name: "Cox", email: "kevin.cox@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-12-15" },
  { first_name: "Liam", last_name: "Howard", email: "liam.howard@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-07-02" },
  { first_name: "Mason", last_name: "Ward", email: "mason.ward@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-02-19" },
  { first_name: "Noah", last_name: "Torres", email: "noah.torres@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-09-06" },
  { first_name: "Owen", last_name: "Peterson", email: "owen.peterson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-04-23" },
  { first_name: "Paul", last_name: "Gray", email: "paul.gray@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-11-10" },
  { first_name: "Quentin", last_name: "Ramirez", email: "quentin.ramirez@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-06-27" },
  { first_name: "Ryan", last_name: "James", email: "ryan.james@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2008-01-14" },
  { first_name: "Sam", last_name: "Watson", email: "sam.watson@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2007-08-31" },
  { first_name: "Thomas", last_name: "Brooks", email: "thomas.brooks@student.studyspark.com", password: "password123", tutor: false, date_of_birth: "2009-03-18" }
])

puts "Created #{User.count} users"

puts "Creating expertises..."

# Get subjects and tutors
subjects = Subject.all
tutors = User.where(tutor: true)

# Create expertises manually
Expertise.create!([
  # Sarah Johnson - Math specialist
  { user: tutors.find_by(first_name: "Sarah"), subject: subjects.find_by(name: "Pre-Algebra"), tutor_rate: 2500 },
  { user: tutors.find_by(first_name: "Sarah"), subject: subjects.find_by(name: "Algebra I"), tutor_rate: 3000 },
  { user: tutors.find_by(first_name: "Sarah"), subject: subjects.find_by(name: "Geometry"), tutor_rate: 3200 },
  
  # Michael Chen - Science specialist
  { user: tutors.find_by(first_name: "Michael"), subject: subjects.find_by(name: "Physical Science"), tutor_rate: 2800 },
  { user: tutors.find_by(first_name: "Michael"), subject: subjects.find_by(name: "Biology"), tutor_rate: 3500 },
  { user: tutors.find_by(first_name: "Michael"), subject: subjects.find_by(name: "Chemistry"), tutor_rate: 4000 },
  
  # Emily Rodriguez - English specialist
  { user: tutors.find_by(first_name: "Emily"), subject: subjects.find_by(name: "English Language Arts"), tutor_rate: 2700 },
  { user: tutors.find_by(first_name: "Emily"), subject: subjects.find_by(name: "English Literature"), tutor_rate: 3100 },
  { user: tutors.find_by(first_name: "Emily"), subject: subjects.find_by(name: "AP English Language"), tutor_rate: 4200 },
  
  # David Thompson - Physics/Math
  { user: tutors.find_by(first_name: "David"), subject: subjects.find_by(name: "Physics"), tutor_rate: 4500 },
  { user: tutors.find_by(first_name: "David"), subject: subjects.find_by(name: "Pre-Calculus"), tutor_rate: 4300 },
  { user: tutors.find_by(first_name: "David"), subject: subjects.find_by(name: "Algebra II"), tutor_rate: 3400 },
  
  # Jessica Kim - Spanish specialist
  { user: tutors.find_by(first_name: "Jessica"), subject: subjects.find_by(name: "Spanish I"), tutor_rate: 2900 },
  { user: tutors.find_by(first_name: "Jessica"), subject: subjects.find_by(name: "Spanish II"), tutor_rate: 3300 },
  
  # Robert Martinez - Chemistry/Science
  { user: tutors.find_by(first_name: "Robert"), subject: subjects.find_by(name: "Chemistry"), tutor_rate: 3800 },
  { user: tutors.find_by(first_name: "Robert"), subject: subjects.find_by(name: "Physical Science"), tutor_rate: 2600 },
  { user: tutors.find_by(first_name: "Robert"), subject: subjects.find_by(name: "Biology"), tutor_rate: 3200 },
  
  # Ashley Davis - History specialist
  { user: tutors.find_by(first_name: "Ashley"), subject: subjects.find_by(name: "World History"), tutor_rate: 2800 },
  { user: tutors.find_by(first_name: "Ashley"), subject: subjects.find_by(name: "US History"), tutor_rate: 3100 },
  { user: tutors.find_by(first_name: "Ashley"), subject: subjects.find_by(name: "World Cultures"), tutor_rate: 2900 },
  
  # Add more expertises for remaining tutors
  { user: tutors.find_by(first_name: "Christopher"), subject: subjects.find_by(name: "Algebra I"), tutor_rate: 2800 },
  { user: tutors.find_by(first_name: "Christopher"), subject: subjects.find_by(name: "Geometry"), tutor_rate: 3000 },
  { user: tutors.find_by(first_name: "Amanda"), subject: subjects.find_by(name: "Psychology"), tutor_rate: 3500 },
  { user: tutors.find_by(first_name: "Daniel"), subject: subjects.find_by(name: "Pre-Algebra"), tutor_rate: 2400 },
  { user: tutors.find_by(first_name: "Daniel"), subject: subjects.find_by(name: "English Language Arts"), tutor_rate: 2600 },
  { user: tutors.find_by(first_name: "Lauren"), subject: subjects.find_by(name: "French I"), tutor_rate: 3000 },
  { user: tutors.find_by(first_name: "Matthew"), subject: subjects.find_by(name: "Algebra II"), tutor_rate: 3400 },
  { user: tutors.find_by(first_name: "Matthew"), subject: subjects.find_by(name: "Pre-Calculus"), tutor_rate: 4100 },
  { user: tutors.find_by(first_name: "Samantha"), subject: subjects.find_by(name: "Biology"), tutor_rate: 3300 },
  { user: tutors.find_by(first_name: "Samantha"), subject: subjects.find_by(name: "Physical Science"), tutor_rate: 2700 },
  { user: tutors.find_by(first_name: "Kevin"), subject: subjects.find_by(name: "Geography"), tutor_rate: 2500 },
  { user: tutors.find_by(first_name: "Rachel"), subject: subjects.find_by(name: "English Literature"), tutor_rate: 3100 },
  { user: tutors.find_by(first_name: "Brandon"), subject: subjects.find_by(name: "Physics"), tutor_rate: 4200 },
  { user: tutors.find_by(first_name: "Nicole"), subject: subjects.find_by(name: "Health Education"), tutor_rate: 2300 },
  { user: tutors.find_by(first_name: "Tyler"), subject: subjects.find_by(name: "Chemistry"), tutor_rate: 3700 },
  { user: tutors.find_by(first_name: "Stephanie"), subject: subjects.find_by(name: "AP English Language"), tutor_rate: 4000 },
  { user: tutors.find_by(first_name: "Justin"), subject: subjects.find_by(name: "Algebra II"), tutor_rate: 3300 }
])

puts "Created #{Expertise.count} expertises"

puts "Creating studies..."

# Get learners
learners = User.where(tutor: false)

# Create studies manually
Study.create!([
  { user: learners.find_by(first_name: "Alex"), subject: subjects.find_by(name: "Pre-Algebra"), learning_objective: "Master solving linear equations with one variable" },
  { user: learners.find_by(first_name: "Jordan"), subject: subjects.find_by(name: "Biology"), learning_objective: "Understand cell structure and function" },
  { user: learners.find_by(first_name: "Taylor"), subject: subjects.find_by(name: "English Language Arts"), learning_objective: "Improve essay writing structure and argumentation" },
  { user: learners.find_by(first_name: "Morgan"), subject: subjects.find_by(name: "Chemistry"), learning_objective: "Balance chemical equations and understand reactions" },
  { user: learners.find_by(first_name: "Casey"), subject: subjects.find_by(name: "Spanish I"), learning_objective: "Learn basic conversational phrases and greetings" },
  { user: learners.find_by(first_name: "Riley"), subject: subjects.find_by(name: "Algebra I"), learning_objective: "Learn to factor polynomials and quadratic expressions" },
  { user: learners.find_by(first_name: "Avery"), subject: subjects.find_by(name: "Physics"), learning_objective: "Apply Newton's laws to motion problems" },
  { user: learners.find_by(first_name: "Cameron"), subject: subjects.find_by(name: "World History"), learning_objective: "Understand major historical events and their causes" },
  { user: learners.find_by(first_name: "Drew"), subject: subjects.find_by(name: "Geometry"), learning_objective: "Prove geometric theorems using logical reasoning" },
  { user: learners.find_by(first_name: "Hayden"), subject: subjects.find_by(name: "Pre-Calculus"), learning_objective: "Master trigonometric functions and identities" },
  { user: learners.find_by(first_name: "Jamie"), subject: subjects.find_by(name: "English Literature"), learning_objective: "Analyze literary devices in poetry and prose" },
  { user: learners.find_by(first_name: "Parker"), subject: subjects.find_by(name: "Physical Science"), learning_objective: "Understand basic principles of matter and energy" },
  { user: learners.find_by(first_name: "Quinn"), subject: subjects.find_by(name: "US History"), learning_objective: "Learn about the American Revolution and Constitution" },
  { user: learners.find_by(first_name: "Reese"), subject: subjects.find_by(name: "French I"), learning_objective: "Master basic French pronunciation and vocabulary" },
  { user: learners.find_by(first_name: "Sage"), subject: subjects.find_by(name: "Psychology"), learning_objective: "Understand basic psychological principles and theories" },
  { user: learners.find_by(first_name: "Blake"), subject: subjects.find_by(name: "Algebra II"), learning_objective: "Work with logarithms and exponential functions" },
  { user: learners.find_by(first_name: "Dakota"), subject: subjects.find_by(name: "Biology"), learning_objective: "Learn genetics and heredity principles" },
  { user: learners.find_by(first_name: "Emerson"), subject: subjects.find_by(name: "Geography"), learning_objective: "Study world maps and geographic features" },
  { user: learners.find_by(first_name: "Finley"), subject: subjects.find_by(name: "AP English Language"), learning_objective: "Develop advanced analytical writing skills" },
  { user: learners.find_by(first_name: "Gray"), subject: subjects.find_by(name: "Spanish II"), learning_objective: "Practice advanced Spanish conversation" },
  { user: learners.find_by(first_name: "Harper"), subject: subjects.find_by(name: "Chemistry"), learning_objective: "Understand periodic table trends and atomic structure" },
  { user: learners.find_by(first_name: "Indigo"), subject: subjects.find_by(name: "Pre-Algebra"), learning_objective: "Strengthen foundation in integer operations" },
  { user: learners.find_by(first_name: "Jaden"), subject: subjects.find_by(name: "Health Education"), learning_objective: "Learn about nutrition and healthy lifestyle choices" },
  { user: learners.find_by(first_name: "Kai"), subject: subjects.find_by(name: "World Cultures"), learning_objective: "Explore different cultures and their traditions" },
  { user: learners.find_by(first_name: "Lane"), subject: subjects.find_by(name: "Geometry"), learning_objective: "Calculate area and volume of complex shapes" },
  { user: learners.find_by(first_name: "Marley"), subject: subjects.find_by(name: "English Language Arts"), learning_objective: "Develop vocabulary and reading comprehension" },
  { user: learners.find_by(first_name: "Nova"), subject: subjects.find_by(name: "Physics"), learning_objective: "Understand energy conservation and transformations" },
  { user: learners.find_by(first_name: "Ocean"), subject: subjects.find_by(name: "Algebra I"), learning_objective: "Understand graphing linear functions and inequalities" },
  { user: learners.find_by(first_name: "Phoenix"), subject: subjects.find_by(name: "Biology"), learning_objective: "Master photosynthesis and cellular respiration" },
  { user: learners.find_by(first_name: "River"), subject: subjects.find_by(name: "World History"), learning_objective: "Study ancient civilizations and their contributions" }
])

puts "Created #{Study.count} studies"

puts "Creating materials..."

# Get studies
studies = Study.all

# Create materials manually
Material.create!([
  # Materials for Alex's Pre-Algebra study
  { study: studies.find_by(learning_objective: "Master solving linear equations with one variable"), name: "Linear Equations Practice", description: "Step-by-step practice problems for solving equations", format: "PDF", summary: "20 practice problems with detailed solutions" },
  { study: studies.find_by(learning_objective: "Master solving linear equations with one variable"), name: "Equation Solving Guide", description: "Reference guide for equation solving methods", format: "PDF", summary: "Quick reference with formulas and examples" },
  
  # Materials for Jordan's Biology study
  { study: studies.find_by(learning_objective: "Understand cell structure and function"), name: "Cell Structure Diagrams", description: "Labeled diagrams of plant and animal cells", format: "PDF", summary: "Detailed cell diagrams with organelle functions" },
  { study: studies.find_by(learning_objective: "Understand cell structure and function"), name: "Cell Function Notes", description: "Comprehensive notes on cellular processes", format: "PDF", summary: "Notes covering mitosis, meiosis, and cellular respiration" },
  
  # Materials for Taylor's English study
  { study: studies.find_by(learning_objective: "Improve essay writing structure and argumentation"), name: "Essay Structure Template", description: "Template for organizing persuasive essays", format: "PDF", summary: "5-paragraph essay outline with examples" },
  { study: studies.find_by(learning_objective: "Improve essay writing structure and argumentation"), name: "Argument Analysis Worksheet", description: "Practice analyzing arguments and evidence", format: "PDF", summary: "Exercises for identifying thesis statements and supporting evidence" },
  
  # Materials for Morgan's Chemistry study
  { study: studies.find_by(learning_objective: "Balance chemical equations and understand reactions"), name: "Chemical Equation Balancing", description: "Practice problems for balancing equations", format: "PDF", summary: "30 equations to balance with answer key" },
  { study: studies.find_by(learning_objective: "Balance chemical equations and understand reactions"), name: "Reaction Types Guide", description: "Guide to different types of chemical reactions", format: "PDF", summary: "Synthesis, decomposition, and replacement reactions explained" },
  
  # Materials for Casey's Spanish study
  { study: studies.find_by(learning_objective: "Learn basic conversational phrases and greetings"), name: "Spanish Greetings List", description: "Common greetings and responses in Spanish", format: "PDF", summary: "50 essential phrases with pronunciation guide" },
  { study: studies.find_by(learning_objective: "Learn basic conversational phrases and greetings"), name: "Conversation Practice", description: "Dialogue examples for basic conversations", format: "PDF", summary: "10 common conversation scenarios with translations" },
  
  # Materials for Riley's Algebra study
  { study: studies.find_by(learning_objective: "Learn to factor polynomials and quadratic expressions"), name: "Factoring Polynomials Guide", description: "Methods for factoring different polynomial types", format: "PDF", summary: "Step-by-step factoring techniques with examples" },
  { study: studies.find_by(learning_objective: "Learn to factor polynomials and quadratic expressions"), name: "Quadratic Practice Problems", description: "Practice problems for quadratic factoring", format: "PDF", summary: "25 quadratic expressions to factor" },
  
  # Materials for Avery's Physics study
  { study: studies.find_by(learning_objective: "Apply Newton's laws to motion problems"), name: "Newton's Laws Summary", description: "Summary of Newton's three laws of motion", format: "PDF", summary: "Laws explained with real-world examples" },
  { study: studies.find_by(learning_objective: "Apply Newton's laws to motion problems"), name: "Motion Problem Set", description: "Physics problems involving forces and motion", format: "PDF", summary: "15 word problems with detailed solutions" },
  
  # Materials for Cameron's History study
  { study: studies.find_by(learning_objective: "Understand major historical events and their causes"), name: "Historical Timeline", description: "Chronological timeline of major world events", format: "PDF", summary: "Visual timeline from ancient to modern times" },
  { study: studies.find_by(learning_objective: "Understand major historical events and their causes"), name: "Cause and Effect Analysis", description: "Analysis of historical events and their consequences", format: "PDF", summary: "Case studies of 10 major historical events" },
  
  # Materials for Drew's Geometry study
  { study: studies.find_by(learning_objective: "Prove geometric theorems using logical reasoning"), name: "Geometric Proofs Guide", description: "Introduction to writing geometric proofs", format: "PDF", summary: "Proof writing strategies and common theorems" },
  { study: studies.find_by(learning_objective: "Prove geometric theorems using logical reasoning"), name: "Proof Practice Problems", description: "Practice proofs for various geometric theorems", format: "PDF", summary: "12 proof problems with step-by-step solutions" },
  
  # Materials for remaining studies
  { study: studies.find_by(learning_objective: "Master trigonometric functions and identities"), name: "Trig Functions Reference", description: "Reference sheet for trigonometric functions", format: "PDF", summary: "Unit circle and common trig values" },
  { study: studies.find_by(learning_objective: "Analyze literary devices in poetry and prose"), name: "Literary Devices Handbook", description: "Guide to common literary devices", format: "PDF", summary: "Definitions and examples of 30 literary devices" },
  { study: studies.find_by(learning_objective: "Understand basic principles of matter and energy"), name: "Matter and Energy Notes", description: "Fundamental concepts in physical science", format: "PDF", summary: "States of matter and energy transformations" },
  { study: studies.find_by(learning_objective: "Learn about the American Revolution and Constitution"), name: "Revolution Timeline", description: "Key events leading to American independence", format: "PDF", summary: "Detailed timeline with important dates and battles" },
  { study: studies.find_by(learning_objective: "Master basic French pronunciation and vocabulary"), name: "French Pronunciation Guide", description: "Guide to French phonetics and pronunciation", format: "PDF", summary: "IPA symbols and audio pronunciation tips" },
  { study: studies.find_by(learning_objective: "Understand basic psychological principles and theories"), name: "Psychology Theories Overview", description: "Introduction to major psychological theories", format: "PDF", summary: "Freud, Piaget, and Behaviorism explained" }
])

puts "Created #{Material.count} materials"

puts "\n=== SEEDING COMPLETED ==="
puts "#{User.where(tutor: true).count} tutors created"
puts "#{User.where(tutor: false).count} learners created"
puts "#{Subject.count} subjects created"
puts "#{Expertise.count} expertises created"
puts "#{Study.count} studies created"
puts "#{Material.count} materials created"