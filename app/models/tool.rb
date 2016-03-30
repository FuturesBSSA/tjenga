class Tool < ActiveRecord::Base
  belongs_to :developer

  validates :name, presence: true
end
