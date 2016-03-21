class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :price_per_hour, presence: true, :format => {:with => /\A\d+(?:\.\d{0,2})?\z/}

  has_many :applications, dependent: :destroy
  has_many :tools, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :programming_languages, dependent: :destroy

  has_many :references, class_name: "Recommendation", dependent: :destroy
  has_many :recommendations, as: :author, dependent: :destroy
  has_many :reviews, as: :author, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
