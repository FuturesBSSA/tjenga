class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_email

  has_many :jobs, dependent: :destroy
  has_many :applications, through: :jobs

  has_many :recommendations, as: :author, dependent: :destroy
  has_many :reviews, as: :author, dependent: :destroy

  validates :first_name, :last_name, :photo, presence: true
  mount_uploader :photo, PhotoUploader


  private

  def send_welcome_email
    ClientMailer.welcome(self).deliver_now
  end
end
