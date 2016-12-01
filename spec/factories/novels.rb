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

FactoryGirl.define do
  factory :novel do
    sequence :title do |n|
      "Novel Title #{n}"
    end
    chapters_number { 1 }
    rating { 5 }
    summary { Faker::Lorem.paragraph }
    terms_and_conditions { Faker::Lorem.paragraph }
  end
end
