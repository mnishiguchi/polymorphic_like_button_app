module Likable

  def set_liked_by(user)
    likes.where(user: user).first_or_create
  end

  def set_unliked_by(user)
    like = likes.where(user: user).first
    like.destroy if like.present?
  end

  def is_liked_by?(user)
    likes.where(user: user).present?
  end

  def like_count
    likes.count
  end

  # Returns a unique set of all the users that like this likable entity.
  def liked_users
    likes.map(&:user).uniq
  end
end
