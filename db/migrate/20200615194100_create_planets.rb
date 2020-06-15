class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :min_temp
      t.string :max_temp
      t.string :avg_temp
      t.string :season
      t.string :avg_wind_direction
      t.string :earth_date
      t.string :planet_date

      t.timestamps
    end
  end
end
