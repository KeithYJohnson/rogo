class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.integer :user_id
      t.datetime :end_time
      t.datetime :start_time
      t.text :description

      t.timestamps
    end
  end
end
