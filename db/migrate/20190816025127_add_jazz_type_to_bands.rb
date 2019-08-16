class AddJazzTypeToBands < ActiveRecord::Migration[5.2]
  def change
    remove_column :bands, :tags, :text
    add_column :bands, :jazz_type, :string
  end
end
