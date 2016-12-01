module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggings
  end

  def tag_list
    tags.map(&:name)
  end

  def tag_list=(arr)
    self.tags = []
    arr.each do |t|
      next if t.blank?
      tags << Tag.find_or_initialize_by(name: t.strip)
    end
  end

  def tags_string
    tag_list.join(', ')
  end

  def tags_string=(tag_string)
    self.tag_list = tag_string.to_s.split(',')
  end
end
