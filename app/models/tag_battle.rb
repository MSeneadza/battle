class TagBattle < ActiveRecord::Base

  belongs_to :user
  belongs_to :tag1, class_name: 'Hashtag'
  belongs_to :tag2, class_name: 'Hashtag'

  validates_presence_of :user, :tag1, :tag2

  validate :tags_must_be_different

  def tags_must_be_different
    if tag1 && tag2
      errors.add(:tag2, "can't be the same as Tag 1") if tag1.id == tag2.id
    end
  end

  def self.create_battle(user, name1, name2, desc)
    tag1 = Hashtag.find_or_create_by(name: name1)
    tag2 = Hashtag.find_or_create_by(name: name2)

    create(user: user,
           tag1: tag1,
           tag2: tag2,
          description: desc)
  end


end
