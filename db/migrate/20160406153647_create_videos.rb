class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end
