class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'authorId'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_counter

  def update_counter
    post.update(CommentsCounter: post.comments.count)
  end
end
