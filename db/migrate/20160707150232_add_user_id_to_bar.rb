class AddUserIdToBar < ActiveRecord::Migration
  def change
    add_column(:bars, :user_id, :integer)
  end
end
