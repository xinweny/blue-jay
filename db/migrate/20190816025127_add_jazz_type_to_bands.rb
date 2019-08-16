class AddJazzTypeToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :jazz_type, :string
  end
end
