# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'pry'

json_nasa = RestClient.get("https://api.nasa.gov/insight_weather/?api_key=4NezTCgzWXnZKO5VghltfSR1bHpKiJzhntk6ysoQ&feedtype=json")
parsed_nasa = JSON.parse(json_nasa)
parsed_nasa.map do |planet|

    Planet.create({
        name: "Mars",
        min_temp: planet[1]["AT"]["mn"].to_s,
        max_temp: planet[1]["AT"]["mx"].to_s,
        avg_temp: planet[1]["AT"]["av"].to_s,
        season: planet[1]["Season"],
        avg_wind_direction: planet[1]["WD"]["most_common"]["compass_point"],
        earth_date: planet[1]["First_UTC"],
        planet_date: planet[0]
    })

end
