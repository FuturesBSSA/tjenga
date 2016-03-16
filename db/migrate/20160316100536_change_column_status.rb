class ChangeColumnStatus < ActiveRecord::Migration
  def change
    change_column :jobs, :status, :string, :default => "Open"
    change_column :job_applications, :status, :string, :default => "Open"
  end
end
