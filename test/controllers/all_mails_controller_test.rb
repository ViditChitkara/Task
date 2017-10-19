require 'test_helper'

class AllMailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_mails_index_url
    assert_response :success
  end

end
