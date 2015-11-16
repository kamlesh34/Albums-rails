class CreateSharings < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
t.string :title
t.references :user, index: true
      t.timestamps null: false
    end
  end
end
