class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  #index for email
  def change
    add_index :users, :email, unique: true
  end
end
