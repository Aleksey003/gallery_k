class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.attachment :data

      t.timestamps
    end
  end
end
