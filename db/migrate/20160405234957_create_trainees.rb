class CreateTrainees < ActiveRecord::Migration
  def change
    create_table :trainees do |t|
      t.string :lesson

      t.timestamps null: false
    end
  end
end
