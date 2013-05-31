class RemoveBooleanFromResponses < ActiveRecord::Migration
  def up
    remove_column :responses, :boolean
  end

  def down
    add_column :responses, :boolean, :string
  end
end
