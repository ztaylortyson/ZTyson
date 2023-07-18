require "test_helper"

class NcfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ncf = ncfs(:one)
  end

  test "should get index" do
    get ncfs_url
    assert_response :success
  end

  test "should get new" do
    get new_ncf_url
    assert_response :success
  end

  test "should create ncf" do
    assert_difference("Ncf.count") do
      post ncfs_url, params: { ncf: {  } }
    end

    assert_redirected_to ncf_url(Ncf.last)
  end

  test "should show ncf" do
    get ncf_url(@ncf)
    assert_response :success
  end

  test "should get edit" do
    get edit_ncf_url(@ncf)
    assert_response :success
  end

  test "should update ncf" do
    patch ncf_url(@ncf), params: { ncf: {  } }
    assert_redirected_to ncf_url(@ncf)
  end

  test "should destroy ncf" do
    assert_difference("Ncf.count", -1) do
      delete ncf_url(@ncf)
    end

    assert_redirected_to ncfs_url
  end
end
