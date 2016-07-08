class AddPhotoToBar < ActiveRecord::Migration
  def change
    add_column(:bars, :photo_url, :string, {null: false})
  end
end
