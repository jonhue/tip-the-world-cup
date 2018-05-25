class Match < ApplicationRecord
  belongs_to :home, class_name: 'Nation'
  belongs_to :away, class_name: 'Nation'
  has_many :tips
end
