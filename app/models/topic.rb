class Topic < ApplicationRecord
    belongs_to :project
    has_many :messages
end
