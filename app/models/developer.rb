class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]

  validates :first_name, :last_name, presence: true
  # validates :price_per_hour, presence: true, :format => {:with => /\A\d+(?:\.\d{0,2})?\z/}

  has_many :applications, dependent: :destroy
  has_many :accepted_applications, -> { where(status: "Accepted") }, class_name: "Application"
  has_many :accepted_jobs, through: :accepted_applications, source: :job
  has_many :job_reviews, through: :accepted_jobs, source: :reviews
  has_many :tools, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :programming_languages, dependent: :destroy

  has_many :references, class_name: "Recommendation", dependent: :destroy
  has_many :recommendations, as: :author, dependent: :destroy
  has_many :reviews, as: :author, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  accepts_nested_attributes_for :programming_languages, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :tools, reject_if: :all_blank, allow_destroy: true

  def self.find_for_linkedin_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |developer|
      developer.provider = auth.provider
      developer.uid = auth.uid
      developer.email = auth.info.email
      developer.password = Devise.friendly_token[0,20]  # Fake password for validation
      developer.first_name = auth.info.first_name
      developer.last_name = auth.info.last_name
      developer.linkedin_picture = auth.info.image
      developer.city = auth.info.location.name
      developer.token = auth.credentials.token
      developer.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end
end
