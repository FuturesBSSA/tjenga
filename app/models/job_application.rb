class JobApplication < ActiveRecord::Base
  belongs_to :developer
  belongs_to :job
end
