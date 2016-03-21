class Work < ActiveRecord::Base
  belongs_to :developer
  validates :title, :description, :photo, :client_name, :website_url, presence: true
  mount_uploader :photo, PhotoUploader
end

