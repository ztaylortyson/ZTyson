require "test_helper"

class DiscoveryControllerTest < ActionDispatch::IntegrationTest
  test "should get srog" do
    get discovery_srog_url
    assert_response :success
  end

  test "should get frog_e" do
    get discovery_frog_e_url
    assert_response :success
  end

  test "should get frog_g" do
    get discovery_frog_g_url
    assert_response :success
  end

  test "should get rfa" do
    get discovery_rfa_url
    assert_response :success
  end

  test "should get depo_pmk" do
    get discovery_depo_pmk_url
    assert_response :success
  end

  test "should get depo_indiv" do
    get discovery_depo_indiv_url
    assert_response :success
  end
end
