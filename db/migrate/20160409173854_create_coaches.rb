class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :company
      t.string :field

      t.timestamps null: false
    end
  end
end
