class AddPictureToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :picture, :string
  end
end
