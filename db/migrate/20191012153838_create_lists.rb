class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :desc
      t.belongs_to :project
      t.timestamps
    end
  end
end
