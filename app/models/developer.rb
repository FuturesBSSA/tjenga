class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # search
  include PgSearch
  pg_search_scope :global_search,
    against: [ :city, :expertise ],
    associated_against: {
      programming_languages: [:name],
      tools: [:name]
    }

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
end
