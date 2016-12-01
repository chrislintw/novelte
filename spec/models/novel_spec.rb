# == Schema Information
#
# Table name: novels
#
#  id                   :integer          not null, primary key
#  title                :string
#  slug                 :string
#  chapters_number      :integer
#  rating               :integer
#  summary              :text
#  image_fingerprint    :string
#  published_on         :date
#  end_on               :date
#  terms_and_conditions :text
#  chpaters_count       :integer          default(0), not null
#  current_chapter      :integer
#  status               :integer          default("contributions_wanted"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe Novel, type: :model do
  # constant specs
  # associations specs
  it { should have_many(:chapters) }
  # validations specs
  it { should define_enum_for(:status) }
  # scope specs
  # class method specs
  # instance method specs
  describe '#authors' do
    it 'returns all of authors'
  end
end
