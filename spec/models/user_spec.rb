require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(Name: 'Saraza', Photo: 'http://Instagram.com', Bio: 'This is a user test')

  describe 'Tests for User model validations' do
    it 'is not valid' do
      expect(user).to be_valid
    end

    it 'is valid ' do
      user.PostsCounter = 1
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.Name = nil
      expect(user).to_not be_valid
    end
  end
end
