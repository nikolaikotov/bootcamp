class AddDevelopmentPlanToFlowSteps < ActiveRecord::Migration[6.0]
  def change
    add_reference :flow_steps, :development_plan, null: false, foreign_key: true
  end
end
