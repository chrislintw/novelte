# == Schema Information
#
# Table name: categorizings
#
#  id               :integer          not null, primary key
#  category_id      :integer
#  categorical_type :string
#  categorical_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_categorizings_on_categorical_type_and_categorical_id  (categorical_type,categorical_id)
#  index_categorizings_on_category_id                          (category_id)
#

class Categorizing < ActiveRecord::Base
  belongs_to :category
  belongs_to :categorical, polymorphic: true

  validates :category_id, :categorical_type, presence: true

end
