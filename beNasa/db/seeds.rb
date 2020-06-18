# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'require_all'
require 'pry'
require_all './db/planet_images'
PlanetDay.destroy_all
Planet.destroy_all

json_nasa = RestClient.get("https://api.nasa.gov/insight_weather/?api_key=4NezTCgzWXnZKO5VghltfSR1bHpKiJzhntk6ysoQ&feedtype=json")
parsed_nasa = JSON.parse(json_nasa)
sol_keys = parsed_nasa["sol_keys"]

mercury = Planet.create({
    name: "Mercury",
    picture: "./mercury.jpg",
    description: "Mercury is the smallest and innermost planet in the Solar System. Its orbit around the Sun takes 87.97 days, the shortest of all the planets in the Solar System. It is named after the Roman deity Mercury, the messenger of the gods."
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
    name: "Venus",
    picture: "./Venus.jpg",
    description: "Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the second-brightest natural object in the night sky after the Moon, Venus can cast shadows and can be, on rare occasion, visible to the naked eye in broad daylight. Venus lies within Earth's orbit, and so never appears to venture far from the Sun, either setting in the west just after dusk or rising in the east a bit before dawn. Venus orbits the Sun every 224.7 Earth days. With a rotation period of 243 Earth days, it takes longer to rotate about its axis than any other planet in the Solar System and does so in the opposite direction to all but Uranus (meaning the Sun rises in the west and sets in the east). Venus does not have any moons, a distinction it shares only with Mercury among planets in the Solar System"
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
    name: "Earth",
    picture: "./earth.jpg",
    description: "Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, which is Earth's only natural satellite."
})

day = 0
7.times do
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
    name: "Mars",
    picture: "./mars.jpg",
    description: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being only larger than Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the 'Red Planet'."
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
    name: "Juipter",
    picture: "./juipter.jpg",
    description: "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter is one of the brightest objects visible to the naked eye in the night sky, and has been known to ancient civilizations since before recorded history."
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
    name: "Saturn",
    picture: "./saturn.jpg",
    description: "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine times that of Earth. It only has one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive."
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
    name: "Uranus",
    picture: "./uranus.jpg",
    description: "Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have bulk chemical compositions which differ from that of the larger gas giants Jupiter and Saturn. For this reason, scientists often classify Uranus and Neptune as 'ice giants' to distinguish them from the gas giants. "
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
    name: "Neptune",
    picture: "./neptune.jpg",
    description: "Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. Neptune is 17 times the mass of Earth, slightly more massive than its near-twin Uranus."
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