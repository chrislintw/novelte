# == Schema Information
#
# Table name: chapters
#
#  id                  :integer          not null, primary key
#  novel_id            :integer          not null
#  author_id           :integer          not null
#  chapter_num         :integer          not null
#  title               :string           not null
#  outline             :text
#  contents            :text
#  contributed_at      :datetime
#  previous_chapter_id :integer
#  next_chapter_id     :integer
#  status              :integer          default("draft"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_chapters_on_author_id  (author_id)
#  index_chapters_on_novel_id   (novel_id)
#

class Chapter < ApplicationRecord
  belongs_to :novel
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  enum status: %i(draft contributed voting main others)
  validates :novel_id, :author_id, :title, :chapter_num, :status, presence: true
  def next
    Chapter.find(next_chapter_id)
  end

  def previous
    Chapter.find(previous_chapter_id)
  end

end
