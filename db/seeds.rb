# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Developer.destroy_all
Client.destroy_all

available_photos = ["profile_1.jpg", "profile_2.jpg", "profile_3.jpg", "profile_4.jpg", "profile_5.jpg"]
available_languages = ["Ruby", "Python", "Javascript", "CSS", "HTML"]
available_tools = ["git", "github", "sketch", "photoshop", "command line", "bootstrap", "middleman"]
available_works = ["work_1.jpg", "work_2.jpg", "work_3.jpg", "work_4.jpg", "work_5.jpg"]
# eerste 20 emails zijn clients, laatste 20 developers
available_emails = ["rianne1@hotmail.com", "matthias2@email.com", "roy3@email.com", "jeroen4@hotmail.com", "melchior5@hotmail.com", "matthijs6@live.nl", "nicolas7@hotmail.com", "cecile8@hotmail.com", "anne9@lewagon.org", "irene10@hotmail.com", "fien11@kpn.nl", "joes12@email.com", "paul@email.com", "hans@gmail.com", "elise@hotmail.com", "laura@gmail.com", "nosh@gmail.com", "vlinder@gmail.com", "fee@gmail.com", "david@gmail.com", "rianne@hotmail.com", "matthias@email.com", "roy@email.com", "jeroen@hotmail.com", "melchior@hotmail.com", "matthijs@live.nl", "nicolas@hotmail.com", "cecile@hotmail.com", "anne@lewagon.org", "iwestgeest@hotmail.com", "fientje@kpn.nl", "joesemans@email.com", "paula@email.com", "hansje@gmail.com", "elise35@hotmail.com", "laura36@gmail.com", "nosh37@gmail.com", "vlinder38@gmail.com", "fee39@gmail.com", "david40@gmail.com" ]

20.times do
  photo = File.open(Rails.root.join("db/fixtures/images", available_photos.sample))
  work = File.open(Rails.root.join("db/fixtures/images", available_works.sample))

  developer = Developer.create!(
    email: available_emails.pop,
    password: "12345678",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    photo: photo,
    price_per_hour: (15..150).to_a.sample,
    expertise: ["front-end", "back-end", "Ruby", "full-stack", "Java", "Phyton", "Applications"].sample,
    availability: ["full-time", "part-time", "project base", "not available", "available"].sample,
  )

  developer.programming_languages.create!(name: available_languages.sample, level: (1..5).to_a.sample)
  developer.works.create!(title: Faker::Lorem.words, description: Faker::Lorem.paragraph(2, false, 4), photo: work, client_name: Faker::Company.name, website_url: Faker::Internet.url)
  developer.tools.create!(name: available_tools.sample)
  developer.recommendations.create!(content: Faker::Lorem.paragraph(2, false, 4), author_id: developer, author_type: "developer")
end

20.times do
  photo = File.open(Rails.root.join("db/fixtures/images", available_photos.sample))

  client = Client.create!(
    email: available_emails.pop,
    password: "12345678",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company: Faker::Company.name,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    photo: photo
  )

  Job.create!(
    title: Faker::Lorem.words,
    description: Faker::Lorem.paragraph(2, false, 4),
    difficulty_level: ["beginner", "senior", "junior"].sample,
    budget: [50, 100, 250, 1000, "unknown", "negotiable"].sample,
    duration: ["half year", "undetermined time", "year", "3 months", "month", "week", "day"].sample,
    start_date: Faker::Date.between(Date.today, 1.year.from_now),
    deadline: Faker::Date.between(1.year.from_now, 2.year.from_now),
    request_type: ["full-time", "part-time", "project base"].sample,
    status: ["open", "interviews started", "fullfilled"].sample,
    client: client
  )
end


