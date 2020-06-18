class AddDescriptionToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :description, :string
  end
end
