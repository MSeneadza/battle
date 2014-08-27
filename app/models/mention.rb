class Mention < ActiveRecord::Base

  belongs_to :hashtag, touch: true

  validates_presence_of :hashtag, :tweet_id

  scope :most_recent, -> { order(tweet_id: :desc).limit(1) }

  scope :published_since, -> (start_time) {where("published_at >= ?", start_time)}

  scope :by_distinct_users, -> {select('DISTINCT(twitter_user_id)').order(:twitter_user_id)}

  def something
    @user.select("DISTINCT(badges.id), badges.*").badges.order("badges.id").order("badges.created_at DESC")
  end

  def self.max_tweet_id
    maximum(:tweet_id) || 0
  end

  def self.min_tweet_id
    minimum(:tweet_id) || 0
  end
end
