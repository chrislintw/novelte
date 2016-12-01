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

FactoryGirl.define do
  factory :chapter do
    association :novel, factory: :novel
    association :author, factory: :user
    sequence :chapter_num do |n|
      n
    end
    title 'Chapter Title'
  end
end
