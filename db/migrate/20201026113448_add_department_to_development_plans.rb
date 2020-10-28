class AddDepartmentToDevelopmentPlans < ActiveRecord::Migration[6.0]
  def change
    add_reference :development_plans, :department, null: false, foreign_key: true
  end
end
