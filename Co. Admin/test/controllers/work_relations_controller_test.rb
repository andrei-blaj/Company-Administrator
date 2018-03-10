require 'test_helper'

class WorkRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get work_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get work_relations_destroy_url
    assert_response :success
  end

end
