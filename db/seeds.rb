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

# binding.pry