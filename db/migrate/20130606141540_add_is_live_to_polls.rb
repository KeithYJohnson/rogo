class AddIsLiveToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :is_live, :boolean, :default => false
  end
end
