require "application_system_test_case"

class LawsuitsTest < ApplicationSystemTestCase
  setup do
    @lawsuit = lawsuits(:one)
  end

  test "visiting the index" do
    visit lawsuits_url
    assert_selector "h1", text: "Lawsuits"
  end

  test "should create lawsuit" do
    visit lawsuits_url
    click_on "New lawsuit"

    check "Active" if @lawsuit.active
    fill_in "Case number", with: @lawsuit.case_number
    fill_in "Case status", with: @lawsuit.case_status
    fill_in "Case title", with: @lawsuit.case_title
    fill_in "Cmc", with: @lawsuit.cmc
    fill_in "Date filed", with: @lawsuit.date_filed
    fill_in "Def caption", with: @lawsuit.def_caption
    fill_in "Judge dept", with: @lawsuit.judge_dept
    fill_in "Judge name", with: @lawsuit.judge_name
    fill_in "Last roa", with: @lawsuit.last_roa
    fill_in "Plt caption", with: @lawsuit.plt_caption
    fill_in "User", with: @lawsuit.user_id
    click_on "Create Lawsuit"

    assert_text "Lawsuit was successfully created"
    click_on "Back"
  end

  test "should update Lawsuit" do
    visit lawsuit_url(@lawsuit)
    click_on "Edit this lawsuit", match: :first

    check "Active" if @lawsuit.active
    fill_in "Case number", with: @lawsuit.case_number
    fill_in "Case status", with: @lawsuit.case_status
    fill_in "Case title", with: @lawsuit.case_title
    fill_in "Cmc", with: @lawsuit.cmc
    fill_in "Date filed", with: @lawsuit.date_filed
    fill_in "Def caption", with: @lawsuit.def_caption
    fill_in "Judge dept", with: @lawsuit.judge_dept
    fill_in "Judge name", with: @lawsuit.judge_name
    fill_in "Last roa", with: @lawsuit.last_roa
    fill_in "Plt caption", with: @lawsuit.plt_caption
    fill_in "User", with: @lawsuit.user_id
    click_on "Update Lawsuit"

    assert_text "Lawsuit was successfully updated"
    click_on "Back"
  end

  test "should destroy Lawsuit" do
    visit lawsuit_url(@lawsuit)
    click_on "Destroy this lawsuit", match: :first

    assert_text "Lawsuit was successfully destroyed"
  end
end
