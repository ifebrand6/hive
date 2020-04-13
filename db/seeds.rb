# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
defaults_talent_types = TalentType.create([
     {:expert_specialization => "Farm manager"},
     {:expert_specialization => "Farm attendant"},
     {:expert_specialization => "Drone Service expert"},
     {:expert_specialization => "Agricultural feasibility expert"},
     {:expert_specialization => "Agricultural business plan expert"},
     {:expert_specialization => "Fumigation and vaccination expert"}
    ])