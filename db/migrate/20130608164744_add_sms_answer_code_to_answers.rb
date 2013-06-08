class AddSmsAnswerCodeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :sms_answer_code, :integer
  end
end
