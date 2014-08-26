class Hashtag < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  has_many :tag_battles
  has_many :mentions

  before_save :strip_name

  #scope :all_in_battles, -> { joins(:tag_battles) }

  def strip_name
    if /\#/ =~ self.name
      self.name[0] = ''
    end
  end

  def get_tweets
    client = get_twitter_client

    tweets =  client.search("##{name} since_id:#{most_recent_mention_id}")

    tweets.each do |t|
      mention = Mention.where(tweet_id: t.id).first
      next if mention
      mention = Mention.create(hashtag_id: id,
                                 tweet_id: t.id,
                                 message: t.text,
                                 published_at: t.created_at
                                )
    end
  end

  def mentions_since(start_time)
    mentions.published_since(start_time).count
  end

  def most_recent_mention_id
    latest = mentions.most_recent.first
    if latest
      latest.tweet_id
    else
      Mention.max_tweet_id
    end
  end

  private

  def get_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_OAUTH_TOKEN']
      config.access_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
    end
  end

end
