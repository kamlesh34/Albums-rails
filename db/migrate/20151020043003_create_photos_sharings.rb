class CreatePhotosSharings < ActiveRecord::Migration
  def change
    create_table :photos_sharings, id: false do |t|
    	t.belongs_to :photo, index: true
		t.belongs_to :sharing, index: true
    end
  end
end
