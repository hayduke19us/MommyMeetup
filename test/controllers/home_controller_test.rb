require "test_helper"

class HomeControllerTest < ActionController::TestCase
  def test_dashboard
    get :dashboard
    assert_response :success
  end

  test "title is present" do
    get :dashboard
    assert_select 'title', "MommyMeetup"
  end

  test "total member count should be assigned" do
    get :dashboard
    assert assigns(:total_members)
  end

  test "total member count should be a collection" do
    get :dashboard
    assert_equal 0, assigns(:total_members)
  end

end
