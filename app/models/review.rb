class Review < ActiveRecord::Base
  belongs_to :client
  belongs_to :developer
  belongs_to :job
end
