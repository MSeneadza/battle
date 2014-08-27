class TagBattle < ActiveRecord::Base

  belongs_to :user
  belongs_to :tag1, class_name: 'Hashtag'
  belongs_to :tag2, class_name: 'Hashtag'

  validates_presence_of :user, :tag1, :tag2

  validate :ensure_tags_differ

  def ensure_tags_differ
    if tag1 && tag2
      if tag1.id == tag2.id
        self.errors.clear
        self.errors[:tag2] << "can't be the same as Tag 1"
      end
    end
  end

  def last_fetched
    tag1_last_updated = tag1.updated_at
    tag2_last_updated = tag2.updated_at

    if tag1_last_updated > tag2_last_updated
      tag1_last_updated
    else
      tag2_last_updated
    end
  end

  def self.create_battle(user, name1, name2, desc)
    tag1 = Hashtag.find_or_create_by(name: name1.strip.downcase) if name1.present?
    tag2 = Hashtag.find_or_create_by(name: name2.strip.downcase) if name2.present?

    create(user: user,
           tag1: tag1,
           tag2: tag2,
          description: desc)
  end


end
