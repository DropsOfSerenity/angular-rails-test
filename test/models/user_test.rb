require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      username: 'Valid User',
      email: 'test@test.com',
      password: 'foobar123',
      password_confirmation: 'foobar123')
    @user.save
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should have a password 8 characters or longer' do
    invalid_user = User.new(
      username: 'Invalid User',
      email: 'invalid@user.com',
      password: 'abcd',
      password_confirmation: 'abcd'
    )
    assert_not invalid_user.valid?
  end

  test 'duplicate email, even if case is different should be invalid' do
    invalid_user = User.new(
      username: 'Invalid User 2',
      email: 'tEsT@TeSt.com',
      password: 'foobar123',
      password_confirmation: 'foobar123'
    )

    assert_not invalid_user.valid?
  end
end
