class AddSnapsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :snaps, :string
  end
end
