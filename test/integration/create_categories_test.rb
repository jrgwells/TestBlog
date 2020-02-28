require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
    get new_category_path # Goes to new category path
    assert_template 'categories/new' # requires 'rails-controller-testing' gem. Gets new form
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: {name: "sports"}} # posting to form with new category 'sports'
      follow_redirect! 
    end
    assert_template 'categories/index' # redirects to index page
    assert_match "sports", response.body # checks index page for new category 'sports'
  end
end