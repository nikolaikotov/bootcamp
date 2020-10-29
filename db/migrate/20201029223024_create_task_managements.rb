class CreateTaskManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :task_managements do |t|
    	t.references :task, foreign_key: true
    	t.references :user, foreign_key: true
    	t.integer :state, null: false, default: 0
      t.timestamps
    end
  end
end
