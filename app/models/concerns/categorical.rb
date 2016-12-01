module Categorical
  extend ActiveSupport::Concern

  included do
    has_many :categorizing, as: :categorical, dependent: :destroy
    has_many :categories, through: :categorizing, source: :category
  end
end
