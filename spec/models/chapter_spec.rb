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

require 'rails_helper'

RSpec.describe Chapter, type: :model do
  # constant specs
  # associations specs
  context 'associations' do
    it { should belong_to(:novel) }
    it { should belong_to(:author) }
  end
  # validations specs
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :status }
  end
  it { should define_enum_for(:status) }
  # scope specs
  # class method specs
  # instance method specs
  describe '#next' do
    it 'returns next chapter'
  end

  describe '#previous' do
    it 'returns previous chapter'
  end
end
