class Mention < ActiveRecord::Base

  belongs_to :hashtag

  validates_presence_of :hashtag
end
