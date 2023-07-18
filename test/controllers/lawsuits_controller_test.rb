require "test_helper"

class LawsuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lawsuit = lawsuits(:one)
  end

  test "should get index" do
    get lawsuits_url
    assert_response :success
  end

  test "should get new" do
    get new_lawsuit_url
    assert_response :success
  end

  test "should create lawsuit" do
    assert_difference("Lawsuit.count") do
      post lawsuits_url, params: { lawsuit: { active: @lawsuit.active, case_number: @lawsuit.case_number, case_status: @lawsuit.case_status, case_title: @lawsuit.case_title, cmc: @lawsuit.cmc, date_filed: @lawsuit.date_filed, def_caption: @lawsuit.def_caption, judge_dept: @lawsuit.judge_dept, judge_name: @lawsuit.judge_name, last_roa: @lawsuit.last_roa, plt_caption: @lawsuit.plt_caption, user_id: @lawsuit.user_id } }
    end

    assert_redirected_to lawsuit_url(Lawsuit.last)
  end

  test "should show lawsuit" do
    get lawsuit_url(@lawsuit)
    assert_response :success
  end

  test "should get edit" do
    get edit_lawsuit_url(@lawsuit)
    assert_response :success
  end

  test "should update lawsuit" do
    patch lawsuit_url(@lawsuit), params: { lawsuit: { active: @lawsuit.active, case_number: @lawsuit.case_number, case_status: @lawsuit.case_status, case_title: @lawsuit.case_title, cmc: @lawsuit.cmc, date_filed: @lawsuit.date_filed, def_caption: @lawsuit.def_caption, judge_dept: @lawsuit.judge_dept, judge_name: @lawsuit.judge_name, last_roa: @lawsuit.last_roa, plt_caption: @lawsuit.plt_caption, user_id: @lawsuit.user_id } }
    assert_redirected_to lawsuit_url(@lawsuit)
  end

  test "should destroy lawsuit" do
    assert_difference("Lawsuit.count", -1) do
      delete lawsuit_url(@lawsuit)
    end

    assert_redirected_to lawsuits_url
  end
end
