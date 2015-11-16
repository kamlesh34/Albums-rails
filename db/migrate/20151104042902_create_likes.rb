class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
t.string :author
t.references :sharing, index: true
      t.timestamps null: false
    end
  end
end
