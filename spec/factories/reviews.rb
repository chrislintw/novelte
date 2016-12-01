# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  novel_id   :integer
#  user_id    :integer
#  title      :string
#  rate       :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reviews_on_novel_id  (novel_id)
#

FactoryGirl.define do
  factory :review do
  end
end
