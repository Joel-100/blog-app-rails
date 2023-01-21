require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should be valid' do
    post = Post.create(title: nil)
    expect(post).to_not be_valid
  end

  it 'update_posts_counter should increment posts_counter' do
    user = User.create(name: 'Joel', posts_counter: 1)
    Post.create(author: user, title: 'First post on the blog', comments_counter: 0, likes_counter: 0)
    expect(user.posts_counter).to eql(1)
  end

  it 'recent_comments should return last comments' do
    user = User.create(name: 'Joel', posts_counter: 0)
    post = Post.create(title: 'First post on the blog', author: user, comments_counter: 0, likes_counter: 0)
    first_comment = Comment.create(post:, author: user, Text: 'Welcome!')
    expect(post.recent_comments).to include(first_comment)
  end
end
