class CreateAstronauts < ActiveRecord::Migration[6.0]
  def change
    create_table :astronauts do |t|
      t.string :name
      t.string :years_avtive
      t.references :mission, foreign_key: true

      t.timestamps
    end
  end
end
