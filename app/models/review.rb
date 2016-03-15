class Review < ActiveRecord::Base
  belongs_to :author, polymorphic: true
  belongs_to :job
end
