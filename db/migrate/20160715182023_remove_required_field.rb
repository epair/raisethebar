class RemoveRequiredField < ActiveRecord::Migration
  def change
    remove_column(:bars, :photo_url, :string, {null: false})
  end
end
