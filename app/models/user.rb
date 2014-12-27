class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum country: [:norway, :poland]
  enum school: [:zsk, :nschool]
  enum sex: [:female, :male]

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth, presence: true
  validates :country, presence: true
  validates :school, presence: true
  validates :sex, presence: true
  validates :city, presence: true, length: { minimum: 2 }
end
