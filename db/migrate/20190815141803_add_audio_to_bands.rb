class AddAudioToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :audio, :string
  end
end
