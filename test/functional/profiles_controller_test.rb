require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:kenny).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "renders a 404 page if the user isn't found" do
    get :show, id: "does not exsist"
    assert_response :not_found
  end

  test "that variables are assigned on a successful profile viewing page" do
    get :show, id: users(:kenny).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
  end
 
  test "only show the correct users statuses" do
    get :show, id: users(:kenny).profile_name
    assigns(:statuses).each do |status|
    	assert_equal users(:kenny), status.user 
    end
  end

end
