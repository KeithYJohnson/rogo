class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :sid
      t.string :date_create
      t.string :date_updated
      t.string :date_sent
      t.string :account_sid
      t.string :to
      t.string :from
      t.string :body
      t.string :status
      t.string :direction
      t.string :uri

      t.timestamps
    end
  end
end
