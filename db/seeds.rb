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

PlanetDay.create({
    min_temp: "-155",
    max_temp: "327",
    avg_temp: "86",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: mercury
})

PlanetDay.create({
    min_temp: "-156",
    max_temp: "330",
    avg_temp: "86",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: mercury
})

PlanetDay.create({
    min_temp: "-150",
    max_temp: "334",
    avg_temp: "90",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: mercury
})

PlanetDay.create({
    min_temp: "-150",
    max_temp: "335",
    avg_temp: "90",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: mercury
})

PlanetDay.create({
    min_temp: "-150",
    max_temp: "337",
    avg_temp: "90",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: mercury
})

PlanetDay.create({
    min_temp: "-151",
    max_temp: "340",
    avg_temp: "90",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: mercury
})

PlanetDay.create({
    min_temp: "-152",
    max_temp: "344",
    avg_temp: "90",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: mercury
})

venus = Planet.create({
    name: "Venus"
})

PlanetDay.create({
    min_temp: "850",
    max_temp: "870",
    avg_temp: "860",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: venus
})

PlanetDay.create({
    min_temp: "850",
    max_temp: "870",
    avg_temp: "860",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: venus
})

PlanetDay.create({
    min_temp: "850",
    max_temp: "870",
    avg_temp: "860",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: venus
})

PlanetDay.create({
    min_temp: "850",
    max_temp: "870",
    avg_temp: "860",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: venus
})

PlanetDay.create({
    min_temp: "850",
    max_temp: "870",
    avg_temp: "860",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: venus
})

PlanetDay.create({
    min_temp: "850",
    max_temp: "870",
    avg_temp: "860",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: venus
})

PlanetDay.create({
    min_temp: "850",
    max_temp: "870",
    avg_temp: "860",
    season: "N/A",
    avg_wind_direction: "N/A",
    planet_date: "1",
    planet: venus
})

earth = Planet.create({
    name: "Earth"
})

PlanetDay.create({
    min_temp: "-100", 
    max_temp:  "100",
    avg_temp:  "0",
    season:  "Summer",
    avg_wind_direction: "NNE",    
    planet_date: "2020-06-16",
    planet: earth
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: earth
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: earth
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: earth
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: earth
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: earth
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: earth
})

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

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: jupiter
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: jupiter
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: jupiter
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: jupiter
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: jupiter
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: jupiter
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: jupiter
})

saturn = Planet.create({
    name: "Saturn"
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: saturn
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: saturn
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: saturn
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: saturn
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: saturn
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: saturn
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: saturn
})

uranus = Planet.create({
    name: "Uranus"
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: uranus
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: uranus
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: uranus
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: uranus
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: uranus
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: uranus
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: uranus
})

neptune = Planet.create({
    name: "Neptune"
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: neptune
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: neptune
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: neptune
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: neptune
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: neptune
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: neptune
})

PlanetDay.create({
    min_temp: "-100",
    max_temp: "100",
    avg_temp: "0",
    season: "Summer",
    avg_wind_direction: "NNE",
    planet_date: "2020-06-16",
    planet: neptune
})