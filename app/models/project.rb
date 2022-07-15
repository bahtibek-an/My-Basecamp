class Project < ApplicationRecord
#   has_many :tasks
  belongs_to :user
  has_many :members
  has_many_attached :files, dependent: :destroy
  has_many :topics
  
  resourcify

end
