class TagBattle < ActiveRecord::Base

  belongs_to :user
  belongs_to :tag1, class_name: 'Hashtag'
  belongs_to :tag2, class_name: 'Hashtag'

  validates_presence_of :user, :tag1, :tag2
end
