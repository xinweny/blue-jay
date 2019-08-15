class AddTagsSamplesToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :tags, :text
    add_column :bands, :video_url, :string
  end
end
