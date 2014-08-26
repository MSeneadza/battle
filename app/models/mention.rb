class Mention < ActiveRecord::Base

  belongs_to :hashtag

  validates_presence_of :hashtag, :tweet_id

  scope :most_recent, -> { order(tweet_id: :desc).limit(1) }

  scope :published_since,  -> (start_time) {where("published_at >= ?", start_time)}

  def self.max_tweet_id
    maximum(:tweet_id) || 0
  end
end
