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

class Novel < ApplicationRecord
  include Taggable
  include Categorical
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: %i(contributions_wanted voting end)

  validates :title, presence: true

  has_attached_file :image,
                    styles: { original: ['1080x675>', :jpg], public: ['640x440#', :jpg], view: ['352x220#', :jpg] },
                    convert_options: {
                      original: '-coalesce -sample "1080x675>" -colorspace sRGB',
                      public: '-background white -gravity center -extent 640x440 -colorspace sRGB -quality 70',
                      view: '-colorspace sRGB -quality 60'
                    },
                    path: ':rails_root/public/uploads/novels/:id_:style_:fingerprint.:extension',
                    url: '/uploads/novels/:id_:style_:fingerprint.:extension',
                    default_url: '/images/missing.png'

  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]

  attr_accessor :image_file_name, :image_content_type

  has_many :chapters

  def self.search(str=nil)
    if str.nil? || str.empty?
      nil
    else
      Novel.where('title LIKE ?', "%#{str}%")
    end
  end

  def image_file_name
    "#{image_fingerprint}.jpg"
  end

  def authors
    user_ids = chapters.where(status: 'main').map(&:author_id).join(',')
    user_ids.empty? ? nil : User.where("id in (#{user_ids})").map(&:pen_name).join(', ')
  end
end
