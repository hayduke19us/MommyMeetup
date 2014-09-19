require "test_helper"

class HomeControllerTest < ActionController::TestCase
  def test_dashboard
    get :dashboard
    assert_response :success
  end

end
