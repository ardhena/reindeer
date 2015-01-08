class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :news, class_name: 'New'

  scope :norway, -> { where(country: 'Norway') }
  scope :poland, -> { where(country: 'Poland') }
  default_scope { order('last_name asc, first_name asc') }
end
