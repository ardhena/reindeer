class User < ActiveRecord::Base
  include Gravtastic
  has_gravatar default: :identicon, size: 40

  has_many :friendships
  has_many :friends, through: :friendships

  acts_as_taggable_on :interests, :languages

  acts_as_messageable required: :body

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

  def accepted_friends
    array = []
    self.friends.each do |friend|
      if self.is_fully_friends_with?(friend)
        array << friend
      end
    end
    array
  end

  def unaccepted_friends_requested_to_self
    array = []
    friendships ||= Friendship.where(friend_id: self.id)
    friendships.each do |friendship|
      user = User.find(friendship.user_id)
      if self.has_request_from?(user)
        array << user
      end
    end
    array
  end

  def unaccepted_friends_requested_by_self
    array = []
    self.friends.each do |friend|
      if !self.is_fully_friends_with?(friend)
        array << friend
      end
    end
    array
  end

  def has_no_friendship_with?(user)
    friendship ||= Friendship.where(user_id: self.id, friend_id: user.id) + Friendship.where(user_id: user.id, friend_id: self.id)
    friendship.empty? ? true : false
  end

  def has_send_request_to?(user)
    send_friendship ||= self.friendships.where(friend_id: user.id, accepted: false)
    opposite_friendship ||= user.friendships.where(friend_id: self.id)
    send_friendship.present? && opposite_friendship.first.nil?
  end

  def has_request_from?(user)
    receiver_friendship ||= user.friendships.where(friend_id: self.id, accepted: false)
    opposite_friendship ||= self.friendships.where(friend_id: user.id)
    receiver_friendship.present? && opposite_friendship.first.nil?
  end

  def is_fully_friends_with?(user)
    self_friendship ||= self.friendships.where(friend_id: user.id).first
    user_friendship ||= user.friendships.where(friend_id: self.id).first
    unless self_friendship.nil? || user_friendship.nil?
      self_friendship.accepted? && user_friendship.accepted?
    else
      false
    end
  end

  def new_messages
    self.messages.where(opened: false)
  end

  default_scope { order('last_name asc, first_name asc') }
end
