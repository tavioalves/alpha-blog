require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "invalid category submission results in failure" do
      get new_category_path
      assert_template 'categories/new'
      assert_no_difference 'Category.count' do
        post categories_path, params: { category: {name: " "} }
      end
      assert_template 'categories/new'
      assert_select 'p.panel-title'
      assert_select 'div.panel-body'
    end
end