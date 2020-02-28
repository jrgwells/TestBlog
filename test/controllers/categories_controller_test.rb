require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup # runs first, before test
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    get categories_path # 'get' is a HTTP verb
    assert_response :success # Assures response is successfull
  end

  test "should get new" do
    get new_category_path 
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

end
