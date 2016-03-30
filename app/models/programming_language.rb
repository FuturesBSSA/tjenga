class ProgrammingLanguage < ActiveRecord::Base
  belongs_to :developer

  validates :name, :level, presence: true
end
