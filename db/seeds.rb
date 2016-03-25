# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Developer.destroy_all
Client.destroy_all

available_languages = ["Ruby", "Python", "Javascript", "CSS", "HTML"]
available_tools = ["git", "github", "sketch", "photoshop", "command line", "bootstrap", "middleman", "indesign"]
available_works = ["work_1.jpg", "work_2.jpg", "work_3.jpg", "work_4.jpg", "work_5.jpg", "works_6.jpg", "works_7.jpg", "works_8.jpg", "works_9.jpg", "works_10.jpg", "works_11.jpg", "works_12.jpg", "works_13.jpg", "works_14.jpg", "works_15.jpg", "works_16.jpg", "works_18.jpg", "works_19.jpg", "works_20.jpg", "works_21.jpg"]
available_job_titles = ["Full-stack webdeveloper gezocht", "Senior Ruby on Rails developer", "Junior full-stack phyton developer", "Stage voor Ruby developers", "Traineeship voor JavaScript master", "Traineeship voor Ruby developer", "Front-end wizard gezocht", "Cool project voor nieuwe start-up", "Tech start-up zoekt developers", "Full-stack engineer", "Portfolio website", "Java technical team leader", "CTO / Senior RoR developer", "Lead iOs developer" ]
available_titles = ["Project voor start-up", "Portfolio website", "Front-end design", "Back-end production", "Freelance Project"]
# eerste 20 emails zijn clients, laatste 20 developers
available_emails = ["rianne1@hotmail.com", "matthias2@email.com", "roy3@email.com", "jeroen4@hotmail.com", "melchior5@hotmail.com", "matthijs6@live.nl", "nicolas7@hotmail.com", "cecile8@hotmail.com", "anne9@lewagon.org", "irene10@hotmail.com", "fien11@kpn.nl", "joes12@email.com", "paul@email.com", "hans@gmail.com", "elise@hotmail.com", "laura@gmail.com", "nosh@gmail.com", "vlinder@gmail.com", "fee@gmail.com", "david@gmail.com", "rianne@hotmail.com", "matthias@email.com", "roy@email.com", "jeroen@hotmail.com", "melchior@hotmail.com", "matthijs@live.nl", "nicolas@hotmail.com", "cecile@hotmail.com", "anne@lewagon.org", "iwestgeest@hotmail.com", "fientje@kpn.nl", "joesemans@email.com", "paula@email.com", "hansje@gmail.com", "elise35@hotmail.com", "laura36@gmail.com", "nosh37@gmail.com", "vlinder38@gmail.com", "fee39@gmail.com", "david40@gmail.com" ]

developer_attributes = [
  { email: "rianne_w@gmail.com", password: "12345678", first_name: "Rianne", last_name: "Westgeest", phone_number: "06 22 05 09 33", city: "Ouderkerk a/d Amstel", address: "Aart van der Neerweg 25", photo: "profile_5.jpg", price_per_hour: 28, expertise: "full-stack", availability: "fulltime" },
  { email: "melchior_r@gmail.com", password: "12345678", first_name: "Melchior", last_name: "Rutte", phone_number: "06 16 85 45 90", city: "Nijmegen", address: "Neptunus 25", photo: "melchior.jpg", price_per_hour: 32, expertise: "full-stack", availability: "fulltime" },
  { email: "matthijs_k@gmail.com", password: "12345678", first_name: "Matthijs", last_name: "Kolkman", phone_number: "06 87 74 21 37", city: "Amsterdam", address: "Tweede hugo de grootstraat 30", photo: "matthijs.jpg", price_per_hour: 23, expertise: "full-stack", availability: "fulltime" },
  { email: "henk@hotmail.com", password: "12345678", first_name: "Henk", last_name: "de Groot", phone_number: "06 78 22 10 87", city: "Almere", address: "Stadhuisplein 1", photo: "profile_1.jpg", price_per_hour: 34, expertise: "front-end", availability: "parttime" },
  { email: "david@hotmail.com", password: "12345678", first_name: "David", last_name: "Fernandez", phone_number: "06 37 98 10 47", city: "Amsterdam", address: "Admiraal de ruijterweg 22", photo: "profile_2.jpg", price_per_hour: 53, expertise: "back-end", availability: "parttime" },
  { email: "latitia@hotmail.com", password: "12345678", first_name: "Latitia", last_name: "Schipper", phone_number: "06 78 72 18 11", city: "Amsterdam", address: "Johan Huizingalaan 763", photo: "profile_3.jpg", price_per_hour: 34, expertise: "front-end", availability: "parttime" },
  { email: "henk_6@hotmail.com", password: "12345678", first_name: "Henk", last_name: "de Groot", phone_number: "06 78 22 10 87", city: "Almere", address: "Stadhuisplein 1", photo: "profile_1.jpg", price_per_hour: 34, expertise: "front-end", availability: "parttime" },
  { email: "damian@gmail.com", password: "12345678", first_name: "Damien", last_name: "Gaanderse", phone_number: "06 18 42 60 77", city: "Rotterdam", address: "Kruiskade 63", photo: "profile_6.jpg", price_per_hour: 34, expertise: "back-end", availability: "fulltime" },
  { email: "annebeth@gmail.com", password: "12345678", first_name: "Annebeth", last_name: "van Velzen", phone_number: "06 18 42 21 90", city: "Utrecht", address: "Stadsplateau 1", photo: "profile_7.jpg", price_per_hour: 44, expertise: "full-stack", availability: "fulltime" },
  { email: "fon@gmail.com", password: "12345678", first_name: "Fon", last_name: "Fu", phone_number: "06 95 42 60 12", city: "Haarlem", address: "Gedempte oude gracht 34", photo: "profile_8.jpg", price_per_hour: 18, expertise: "back-end", availability: "project base" },
  { email: "don@gmail.com", password: "12345678", first_name: "Donald", last_name: "Draper", phone_number: "06 22 22 66 19", city: "Amsterdam", address: "Nassaukade 44", photo: "profile_9.jpg", price_per_hour: 35, expertise: "front-end", availability: "project base" },
  { email: "eunchae@gmail.com", password: "12345678", first_name: "Eun Chae", last_name: "Parker", phone_number: "06 18 88 34 71", city: "Rotterdam", address: "Kruiskade 23", photo: "profile_10.jpg", price_per_hour: 25, expertise: "back-end", availability: "fulltime" },
  { email: "jorrick@gmail.com", password: "12345678", first_name: "Jorrick", last_name: "de Bok", phone_number: "06 98 32 68 78", city: "Amstelveen", address: "Binnenhof 63", photo: "profile_11.jpg", price_per_hour: 38, expertise: "front-end", availability: "fulltime" },
  { email: "alban@gmail.com", password: "12345678", first_name: "Alban", last_name: "Benali", phone_number: "06 18 42 66 21", city: "Amsterdam", address: "Spui 11", photo: "profile_12.jpg", price_per_hour: 66, expertise: "full-stack", availability: "project base" },
  { email: "marcella@gmail.com", password: "12345678", first_name: "Marcella", last_name: "Dupot", phone_number: "06 18 44 60 71", city: "Utrecht", address: "Heidelberglaan 100", photo: "profile_13a.jpg", price_per_hour: 25, expertise: "back-end", availability: "fulltime" },
  { email: "romy@gmail.com", password: "12345678", first_name: "Romy", last_name: "van Domburg Scipio", phone_number: "06 18 42 60 77", city: "Amsterdam", address: "Amstelveenseweg 33", photo: "profile_14.jpg", price_per_hour: 35, expertise: "front-end", availability: "project base" }
]

client_attributes = [
  { email: "proctor_exam@gmail.com", password: "12345678", first_name: "Hans" , last_name: "Haan", company: "Proctor Exam", city: "Amsterdam", address: "johan huizingalaan 763a", photo: "proctor_exam.jpg" },
  { email: "wortels@gmail.com", password: "12345678", first_name: "Irene" , last_name: "Latsers", company: "Wortels", city: "Den Bosch", address: "graafseweg 60", photo: "logo_1.jpg" },
  { email: "wave_restaurant@gmail.com", password: "12345678", first_name: "Melvin" , last_name: "Potters", company: "Wave Restaurants", city: "Amsterdam", address: "herengracht 82", photo: "logo_3.jpg" },
  { email: "zazzy@gmail.com", password: "12345678", first_name: "Gert Jan" , last_name: "Spriensma", company: "Zazzy", city: "Amsterdam", address: "Prinsengracht 182", photo: "logo_4.jpg" },
  { email: "adidas@gmail.com", password: "12345678", first_name: "Robert" , last_name: "Peters", company: "Adidas", city: "Amsterdam", address: "johan huizingalaan 763a", photo: "logo_5.jpg" },
  { email: "wehkamp@gmail.com", password: "12345678", first_name: "Anita" , last_name: "de la Croix", company: "Wehkamp", city: "Utrech", address: "stadsplateau 6", photo: "logo_6.jpg" },
  { email: "kpn@gmail.com", password: "12345678", first_name: "Bernard" , last_name: "Flinkers", company: "KPN", city: "Amsterdam", address: "johan huizingalaan 763a", photo: "logo_7.jpg" },
  { email: "thenextcloset@gmail.com", password: "12345678", first_name: "Lieke" , last_name: "Pijpers", company: "The Next Closet", city: "Amsterdam", address: "kinkerstraat 30", photo: "logo_8.jpg" },
  { email: "fabrique@gmail.com", password: "12345678", first_name: "Janneke" , last_name: "Tapert", company: "Fabrique", city: "Delft", address: "jaffalaan 5", photo: "logo_9.jpg" },
  { email: "linden_it@gmail.com", password: "12345678", first_name: "Gerbert Jan" , last_name: "Valk", company: "Linden IT", city: "Amsterdam", address: "johan huizingalaan 763a", photo: "logo_10.jpg" },
  { email: "dashmote@gmail.com", password: "12345678", first_name: "Bart" , last_name: "Graafsma", company: "Dashmote", city: "Amsterdam", address: "johan huizingalaan 763a", photo: "logo_11.jpg" },
  { email: "mandate@gmail.com", password: "12345678", first_name: "Mans" , last_name: "Timmerman", company: "Mandate", city: "Amsterdam", address: "bilderdijkkade 12", photo: "logo_12.jpg" },
  { email: "dailychef@gmail.com", password: "12345678", first_name: "Pieter" , last_name: "Janssen", company: "Daily Chef", city: "Amsterdam", address: "johan huizingalaan 763a", photo: "logo_13.jpg" },
  { email: "wetransfer@gmail.com", password: "12345678", first_name: "Nalden" , last_name: "Naldinga", company: "WeTransfer", city: "Amsterdam", address: "johan huizingalaan 763a", photo: "logo_14.jpg" },
]

developer_attributes.each do |attributes|
  work = File.open(Rails.root.join("db/fixtures/images", available_works.sample))

  developer = Developer.create!(attributes)

  developer.programming_languages.create!(name: available_languages.sample, level: (1..5).to_a.sample)
  developer.programming_languages.create!(name: available_languages.sample, level: (1..5).to_a.sample)
  developer.programming_languages.create!(name: available_languages.sample, level: (1..5).to_a.sample)
  developer.works.create!(title: available_titles.sample, description: Faker::Lorem.paragraph(2, false, 4), photo: work, client_name: Faker::Company.name, website_url: Faker::Internet.url)
  developer.tools.create!(name: available_tools.sample)
  developer.tools.create!(name: available_tools.sample)
  developer.tools.create!(name: available_tools.sample)
  developer.recommendations.create!(content: Faker::Lorem.paragraph(2, false, 4), author_id: developer, author_type: "developer")
end

client_attributes.each do |client_attributes|

  client = Client.create!(client_attributes)

    Job.create!(
    title: available_job_titles.sample,
    description: Faker::Lorem.paragraph(2, false, 4),
    difficulty_level: ["beginner", "senior", "junior"].sample,
    budget: [1000, 1500, 500, 1200, 2200, 2600, 4500, 3000, 3200, 3100, 3400, "unknown", "negotiable"].sample,
    duration: ["half year", "undetermined time", "1 year", "3 months", "a month", "2 weeks", "3 days", "1,5 year", "6 months", "9 months"].sample,
    start_date: Faker::Date.between(Date.today, 1.year.from_now),
    deadline: Faker::Date.between(1.year.from_now, 2.year.from_now),
    request_type: ["full-time", "part-time", "project base"].sample,
    status: ["open", "interviews started", "fullfilled"].sample,
    client: client
  )
end

  melchior = Developer.create!(email: "melchior@develop.com", password: "12345678", first_name: "Melchior", last_name: "Rutte", phone_number: Faker::PhoneNumber.cell_phone, city: "Amsterdam",
    address: Faker::Address.street_address, photo: "profile_1.jpg", price_per_hour: 110, expertise: "full-stack", availability: "available")
  hamza = Client.create!(email: "hamza@manpower.nl", password: "12345678", first_name: "Hamza", last_name: "de Groot", company: "Manpower", city: "Amsterdam", address: Faker::Address.street_address, photo: "profile_2.jpg" )
  ruby_job = Job.create!(title: "Cool platform to connect people", description: Faker::Lorem.paragraph(2, false, 4), difficulty_level: "junior", budget: "unknown", duration: "half year", start_date: Faker::Date.between(Date.today, 1.year.from_now), deadline: Faker::Date.between(1.year.from_now, 2.year.from_now), request_type: "full-time", status: "open", client: hamza)

  application = Application.create!(developer: melchior, job: ruby_job, motivation: Faker::Lorem.paragraph(2, false, 4), price: 50)


