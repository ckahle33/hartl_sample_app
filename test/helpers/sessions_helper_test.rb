require 'test_helper'

class SessionHelperTest < ActionView::TestCase
	include SessionsHelper

	def setup
		@user = users(:craig)
		remember(@user)
	end

	test "current users returns right user when session is nil" do
		assert_equal @user, current_user, "#{current_user.inspect}"
		assert is_logged_in?
	end

	test "current user returns nil when remember digest is wrong" do
		@user.update_attribute(:remember_digest, User.digest(User.new_token))
		assert_nil current_user
	end
end