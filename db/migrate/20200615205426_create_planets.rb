class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name

      t.references :planet_days, foreign_key: true
      t.timestamps
    end
  end
end
