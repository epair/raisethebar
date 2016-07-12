class MakeUserIdRequired < ActiveRecord::Migration
  def up
    change_column(:bars, :user_id, :integer, {null: false})
  end
  def down
    change_column(:bars, :user_id, :integer)
  end
end
