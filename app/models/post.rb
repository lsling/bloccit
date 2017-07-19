class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  after_create :new_favorite

  default_scope { order('rank DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
 # # we find the up votes for a post by passing value: 1 to where
     votes.where(value: 1).count
   end

   def down_votes
 # # we find the down votes for a post by passing value: -1 to where
     votes.where(value: -1).count
   end

   def points
 # # we use ActiveRecord's sum method to add the value of all the given post's votes
     votes.sum(:value)
   end
   def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
   end

   def new_favorite
     Favorite.create(post: self, user: self.user)
     FavoriteMailer.new_post(self).deliver_now
   end
end
