# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'pry'
PlanetDay.destroy_all
Planet.destroy_all

json_nasa = RestClient.get("https://api.nasa.gov/insight_weather/?api_key=4NezTCgzWXnZKO5VghltfSR1bHpKiJzhntk6ysoQ&feedtype=json")
parsed_nasa = JSON.parse(json_nasa)
sol_keys = parsed_nasa["sol_keys"]

mercury = Planet.create({
    name: "Mercury",
    picture: "http://www.simpleimageresizer.com/_uploads/photos/10ee2506/AW_Mercury_ladprw_25.jpg"
})

7.times do
    PlanetDay.create({
        min_temp: Faker::Number.between(from: -175, to: -135).to_s,
        max_temp: Faker::Number.between(from: 330, to: 375).to_s,
        avg_temp: Faker::Number.between(from: 75, to: 100).to_s,
        season: "N/A",
        avg_wind_direction: "N/A",
        planet_date: "1",
        planet: mercury
    })
end

venus = Planet.create({
    name: "Venus"
})

7.times do
    PlanetDay.create({
        min_temp: Faker::Number.between(from: 860, to: 870).to_s,
        max_temp: Faker::Number.between(from: 850, to: 860).to_s,
        avg_temp: Faker::Number.between(from: 855, to: 865).to_s,
        season: "N/A",
        avg_wind_direction: "N/A",
        planet_date: "1",
        planet: venus
    })
end

earth = Planet.create({
    name: "Earth"
})

7.times do
    day = 0
    forecast = (Date.today + day).to_s
    PlanetDay.create({
        min_temp: Faker::Number.between(from: -20, to: 10).to_s,
        max_temp: Faker::Number.between(from: 5, to: 50).to_s,
        avg_temp: Faker::Number.between(from: -5, to: 25).to_s,
        season: "Summer",
        avg_wind_direction: Faker::Compass.half_wind_abbreviation,
        planet_date: forecast,
        planet: earth
    })
    day += 1
end

mars = Planet.create({
    name: "Mars"
})

days = sol_keys.map do |key|
    PlanetDay.create({
        min_temp: parsed_nasa[key]["AT"]["mn"],
        max_temp: parsed_nasa[key]["AT"]["mx"],
        avg_temp: parsed_nasa[key]["AT"]["av"],
        season: parsed_nasa[key]["Season"],
        avg_wind_direction: parsed_nasa[key]["WD"]["most_common"]["compass_point"],
        planet_date: key,
        planet: mars
    })
end

jupiter = Planet.create({
    name: "Juipter"
})

7.times do
    PlanetDay.create({
        min_temp: Faker::Number.between(from: -350, to: -200).to_s,
        max_temp: Faker::Number.between(from: -250, to: -100).to_s,
        avg_temp: Faker::Number.between(from: -300, to: -225).to_s,
        season: "Summer",
        avg_wind_direction: Faker::Compass.half_wind_abbreviation,
        planet_date: "1",
        planet: jupiter
    })
end

saturn = Planet.create({
    name: "Saturn"
})

7.times do
    PlanetDay.create({
        min_temp: Faker::Number.between(from: -173, to: -125).to_s,
        max_temp: Faker::Number.between(from: -150, to: -114).to_s,
        avg_temp: Faker::Number.between(from: -160, to: -120).to_s,
        season: "Summer",
        avg_wind_direction: Faker::Compass.half_wind_abbreviation,
        planet_date: "1",
        planet: saturn
    })
end

uranus = Planet.create({
    name: "Uranus"
})

7.times do
    PlanetDay.create({
        min_temp: Faker::Number.between(from: -373, to: -330).to_s,
        max_temp: Faker::Number.between(from: -350, to: -300).to_s,
        avg_temp: Faker::Number.between(from: -360, to: -340).to_s,
        season: "Summer",
        avg_wind_direction: Faker::Compass.half_wind_abbreviation,
        planet_date: "1",
        planet: uranus
    })
end

neptune = Planet.create({
    name: "Neptune"
})

7.times do
    PlanetDay.create({
        min_temp: Faker::Number.between(from: -373, to: -330).to_s,
        max_temp: Faker::Number.between(from: -350, to: -300).to_s,
        avg_temp: Faker::Number.between(from: -360, to: -340).to_s,
        season: "Summer",
        avg_wind_direction: Faker::Compass.half_wind_abbreviation,
        planet_date: "1",
        planet: neptune
    })
end