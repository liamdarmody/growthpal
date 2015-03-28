# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  title        :string
#  content_html :text
#  slug         :string
#

class Page < ActiveRecord::Base
# Use friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Validations
  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :content_html, presence: true
end
