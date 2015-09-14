class Event < ActiveRecord::Base
  validates_presence_of :name
  has_many :comments
  validates :name, presence: true, length: {minimum: 5}
end
