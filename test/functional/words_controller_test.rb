require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get autocomplete" do
    get :autocomplete
    assert_response :success
  end

end
