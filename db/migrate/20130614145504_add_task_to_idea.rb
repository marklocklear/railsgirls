class AddTaskToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :task_id, :integer
  end
end
