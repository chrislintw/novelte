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

require 'rails_helper'

RSpec.describe Review, type: :model do
  # constant specs
  # associations specs
  # validations specs
  # scope specs
  # class method specs
  # instance method specs
end
