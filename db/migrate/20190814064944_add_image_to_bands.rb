class AddImageToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :image, :string
  end
end
