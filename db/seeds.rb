# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database...."
# UserActivity.destroy_all
# UserSkill.destroy_all
# ActivitySkill.destroy_all
Skill.destroy_all
Activity.destroy_all
User.destroy_all

puts "Creating users...."
coko = User.create!(
  email: "coko@example.com",
  password: "password"
)
# url = "https://media.licdn.com/dms/image/C4D03AQGM56o3VpiTrA/profile-displayphoto-shrink_800_800/0?e=1565827200&v=beta&t=PpsnAhC2-SCImmPxlDG84Sp8262Fzm-rEMpzpVzKZYU"
# coko.remote_avatar_url = url
# coko.save

puts "Creating activities...."

Activity.create!(
  name: "Natation",
  description: "Aller à la piscine pour faire 1km"
)
Activity.create!(
  name: "Permis 125",
  description: "Passer le permis 125cc"
)
Activity.create!(
  name: "Dé sur Unity",
  description: "Coder un dé sur Unity"
)
Activity.create!(
  name: "Méditation",
  description: "Méditer en se focalisant sur la respiration"
)
Activity.create!(
  name: "Théatre",
  description: "Joindre une troupe et jouer dans une pièce"
)

puts "Creating skills..."

Skill.create!(
  name: "Force",
  description: "Force physique brute, pour taper fort",
  character: "Bucheron"
)

Skill.create!(
  name: "Intelligence",
  description: "Mesure le raisonnement et la mémoire",
  character: "Mage"
)

Skill.create!(
  name: "Sagesse",
  description: "Mesure la perception et l'intuition",
  character: "Druide"
)

Skill.create!(
  name: "Dextérité",
  description: "Mesure l'agilité. Vous voyez les cartes ? Vous les voyez plus...",
  character: "Espion"
)

Skill.create!(
  name: "Charisme",
  description: "Mesure la force de la personnalité",
  character: "Keutard"
)

Skill.create!(
  name: "Constitution",
  description: "Mesure l'endurance",
  character: "Pyramide"
)

# puts "Creating activity skills...."

# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Natation"),
#   skill: Skill.find_by(name: "Constitution")
# )
# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Natation"),
#   skill: Skill.find_by(name: "Force")
# )

# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Permis 125"),
#   skill: Skill.find_by(name: "Dextérité")
# )
# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Permis 125"),
#   skill: Skill.find_by(name: "Charisme")
# )

# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Dé sur Unity"),
#   skill: Skill.find_by(name: "Intelligence")
# )

# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Méditation"),
#   skill: Skill.find_by(name: "Sagesse")
# )
# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Méditation"),
#   skill: Skill.find_by(name: "Constitution")
# )

# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Théatre"),
#   skill: Skill.find_by(name: "Charisme")
# )
# ActivitySkill.create!(
#   activity: Activity.find_by(name: "Théatre"),
#   skill: Skill.find_by(name: "Intelligence")
# )

# puts "Creating user skills...."

# UserSkill.create!(
#   user: User.first,
#   skill: Skill.find_by(name: "Constitution"),
#   amount: 30
# )

# UserSkill.create!(
#   user: User.first,
#   skill: Skill.find_by(name: "Sagesse"),
#   amount: 20
# )

# UserSkill.create!(
#   user: User.first,
#   skill: Skill.find_by(name: "Force"),
#   amount: 15
# )

# UserSkill.create!(
#   user: User.first,
#   skill: Skill.find_by(name: "Intelligence"),
#   amount: 15
# )

# UserSkill.create!(
#   user: User.first,
#   skill: Skill.find_by(name: "Dextérité"),
#   amount: 10
# )

# UserSkill.create!(
#   user: User.first,
#   skill: Skill.find_by(name: "Charisme"),
#   amount: 10
# )

puts "Done !"
