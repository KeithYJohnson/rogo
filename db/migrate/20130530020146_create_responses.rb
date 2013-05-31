class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :sid
      t.string :date_created
      t.string :date_updated
      t.string :date_sent
      t.string :boolean
      t.string :account_sid
      t.string :to
      t.string :from
      t.string :body
      t.string :status
      t.string :direction

      t.timestamps
    end
  end
end
