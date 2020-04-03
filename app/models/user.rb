class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :event
  belongs_to :event_participant

  validates_presence_of :name, :gender
end
