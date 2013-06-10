class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :title
      t.integer :question_id
      t.boolean :is_correct
      t.integer :votes, :default => 0

      t.timestamps
    end
  end
end
