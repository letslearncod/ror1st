class Question < ApplicationRecord
  belongs_to :form
  has_many :choices
  has_many :texts
end
