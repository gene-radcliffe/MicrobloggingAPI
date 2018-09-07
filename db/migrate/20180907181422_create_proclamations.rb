class CreateProclamations < ActiveRecord::Migration[5.2]
  def change
    create_table :proclamations do |t|
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
