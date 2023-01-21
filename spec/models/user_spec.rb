require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'test', posts_counter: 0) }

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'subject should be invalid for giving a valid post_counter ' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
