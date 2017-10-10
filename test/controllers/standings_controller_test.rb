require 'test_helper'

class StandingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get standings_new_url
    assert_response :success
  end

end
