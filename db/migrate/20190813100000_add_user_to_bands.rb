class AddUserToBands < ActiveRecord::Migration[5.2]
  def change
    add_reference :bands, :user, foreign_key: true
  end
end
