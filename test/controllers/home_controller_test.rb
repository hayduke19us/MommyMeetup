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

  test "meetup key is accesible thru ENV variable" do
    assert_match /.{28,30}/, ENV["meetup_api_key"]
  end

  test "total member count should be assigned" do
    get :dashboard
    assert assigns(:total_members)
  end

  test "members should be assigned" do
    get :dashboard
    assert assigns(:members)
  end

  test "members names should be a collection" do
    get :dashboard
    assert_equal 79, assigns(:members).count
  end

  test "total member count should be an Integer of 79" do
    get :dashboard
    assert_equal 79, assigns(:total_members)
  end

  test "members info should be a hash with :name in it" do
    get :dashboard
    assert_equal "Hash", assigns{:members}.class.superclass.name
  end

end
