require 'rails_helper'

RSpec.describe User, type: :model do
  it 'update_likes_counter should increment likes_counter' do
    user = User.create(name: 'Joel', posts_counter: 0)
    post = Post.create(title: 'First post on the blog', author: user, comments_counter: 0, likes_counter: 1)
    Like.create(post:, author: user)
    expect(post.likes_counter).to eq(1)
  end
end
