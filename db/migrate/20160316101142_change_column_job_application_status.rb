class ChangeColumnJobApplicationStatus < ActiveRecord::Migration
  def change
    change_column :job_applications, :status, :string, :default => "Pending"
  end
end
