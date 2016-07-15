class AddColumnPhotoUrlToBars < ActiveRecord::Migration
  def change
    add_column(:bars, :photo_url, :string)
  end
end
