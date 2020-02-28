require 'test_helper'

class CategoriesControllerTest < ActionController:TestCase

  test "should get categories index" do
    get :index # 'get' is a HTTP verb
    assert_response :success # Assures response is successfull
  end

  test "should get new" do
    get :new 
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
