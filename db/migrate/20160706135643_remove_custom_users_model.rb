class RemoveCustomUsersModel < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :email, null: false
    end
  end
end
