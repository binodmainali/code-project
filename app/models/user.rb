class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :gender

  def female?
    gender.eql?('Female')
  end
end
