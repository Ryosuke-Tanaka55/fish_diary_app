require 'test_helper'

class RigsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rigs_new_url
    assert_response :success
  end

end
