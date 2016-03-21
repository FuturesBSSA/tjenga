class Review < ActiveRecord::Base
  belongs_to :author, polymorphic: true
  belongs_to :job
  validates_numericality_of :rating, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5
end
