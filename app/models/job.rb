class Job < ActiveRecord::Base
  belongs_to :client

  has_one :accepted_application, -> { where(status: "Accepted") }, class_name: "Application"
  has_one :accepted_developer, through: :accepted_application, source: "developer"

  has_many :applications, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :budget, presence: true, :format => {:with => /\A\d+(?:\.\d{0,2})?\z/}
end
