require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(Name: 'Tester', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Tester from Mexico.',
                     PostsCounter: 0)
  post = Post.create(Title: 'Rspec test', Text: 'rspec test for post model', CommentsCounter: 1, LikesCounter: 0,
                     authorId: user.id)
  comment = Comment.new(post_id: post.id, authorId: user.id, Text: 'This is a test for comment model')

  describe 'Tests for Comment model validations' do
    it 'comment should be valid' do
      expect(comment).to be_valid
    end

    it 'Increases the comments_counter' do
      counter = Post.find(post.id).CommentsCounter
      comment.update_counter
      expect(Post.find(post.id).CommentsCounter).to eq(counter + 1)
    end
  end
end
