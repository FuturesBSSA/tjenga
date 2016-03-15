class Recommendation < ActiveRecord::Base
  belongs_to :author, polymorphic: true
  belongs_to :developer
end
