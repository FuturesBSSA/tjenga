class RenameTableJobapplications < ActiveRecord::Migration
  def change
     rename_table :job_applications, :applications
   end
end
