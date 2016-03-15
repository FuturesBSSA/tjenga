class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :price_per_hour, presence: true, :format => {:with => /\A\d+(?:\.\d{0,2})?\z/}

  has_many :job_applications
  has_many :tools
  has_many :works
  has_many :programming_languages
end
