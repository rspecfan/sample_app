require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: "",
                                       email: "user@qq.com",
                                       password: "foo",
                                       password_confirmation: "bar" }}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end
  
  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do 
      post users_path, params: { user: {name: "rails",
                                        email: "rails@qq.com",
                                        password: "aaaaaa",
                                        password_confirmation: "aaaaaa"
      }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    #assert_select 'div.alert-success'
  end
end
