class AddVideoUrlToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :video_url, :string
  end
end
