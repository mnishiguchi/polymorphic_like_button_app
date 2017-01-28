# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user # belongs_to :user, class_name: :User, foreign_key: :user_id

  # has_many :likes
  # has_many :liked_users, through: :likes, source: :user
end
