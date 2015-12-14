require "test_helper"

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  test "logging in" do
    visit root_path
    assert_equal 200, page.status_code
  end
end
