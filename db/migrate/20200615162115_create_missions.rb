class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :program
      t.string :vehicle
      t.string :description
      t.string :timeframe

      t.timestamps
    end
  end
end
