# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  likable_type :string           not null
#  likable_id   :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user

  # User can like once per post.
  validates :likable_id, uniqueness: { scope: :user_id }
end
