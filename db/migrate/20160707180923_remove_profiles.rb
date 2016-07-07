class RemoveProfiles < ActiveRecord::Migration
  def up
    drop_table :profiles
  end

  def down
    create_table :profiles do |t|
      t.integer :user_id
    end
  end
end
