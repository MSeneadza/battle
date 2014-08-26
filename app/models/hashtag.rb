class Hashtag < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  has_many :tag_battles
  has_many :mentions

  before_save :strip_name

  def strip_name
    if /\#/ =~ self.name
      self.name[0] = ''
    end
  end

end
