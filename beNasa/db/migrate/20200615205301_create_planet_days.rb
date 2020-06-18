class CreatePlanetDays < ActiveRecord::Migration[6.0]
  def change
    create_table :planet_days do |t|
      t.string :min_temp
      t.string :max_temp
      t.string :avg_temp
      t.string :season
      t.string :avg_wind_direction
      t.string :planet_date

      t.references :planet, foreign_key: true
      t.timestamps
    end
  end
end
