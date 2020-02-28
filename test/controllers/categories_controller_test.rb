require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup # runs first, before test
    @category = Category.create(name: "sports")
    @user = User.create(username: "admin", email: "admin@email.com", password: "password", admin: true)
  end

  test "should get categories index" do
    get categories_path # 'get' is a HTTP verb
    assert_response :success # Assures response is successfull
  end

  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path 
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: "sports" } }
    end
    assert_redirected_to 'categories/path'
  end

end
