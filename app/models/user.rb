class User < ActiveRecord::Base
  include Gravtastic
  has_gravatar default: :identicon, size: 40

  has_many :friendships
  has_many :friends, through: :friendships

  acts_as_taggable_on :interests, :languages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum country: [:norway, :poland]
  enum school: [:norwegian_school, :polish_high_school, :polish_technical_school]
  enum sex: [:female, :male]

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :birth, presence: true
  validates :country, presence: true
  validates :school, presence: true
  validates :sex, presence: true
  validates :city, presence: true, length: { minimum: 2 }
  validates :bio, length: { maximum: 5000 }

  def age
    now = Time.now.utc.to_date
    now.year - self.birth.year - ((now.month > self.birth.month || (now.month == self.birth.month && now.day >= self.birth.day)) ? 0 : 1)
  end

  def friendship_with(user)
    friendship ||= Friendship.where(user_id: self.id, friend_id: user.id) || Friendship.where(user_id: user.id, friend_id: self.id)
    friendship.empty? ? nil : friendship.first
  end

  def has_friendship_with(user)
    friendship_with(user).nil? ? false : true
  end

  def has_accepted_friendship_with(user)
    friendship_with(user).nil? ? nil : friendship_with(user).accepted?
  end

  default_scope { order('last_name asc, first_name asc') }
end
