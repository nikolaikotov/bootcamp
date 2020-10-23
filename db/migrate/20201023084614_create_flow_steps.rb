class CreateFlowSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :flow_steps do |t|
      t.string :title

      t.timestamps
    end
  end
end
