class JobApplication < ActiveRecord::Base
  belongs_to :developer
  belongs_to :job

  validates :price, :format => {:with => /\A\d+(?:\.\d{0,2})?\z/}
end
