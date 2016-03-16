class Job < ActiveRecord::Base
  belongs_to :client
  has_many :applications, dependent: :destroy
  validates :budget, presence: true, :format => {:with => /\A\d+(?:\.\d{0,2})?\z/}
end
