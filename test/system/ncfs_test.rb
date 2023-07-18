require "application_system_test_case"

class NcfsTest < ApplicationSystemTestCase
  setup do
    @ncf = ncfs(:one)
  end

  test "visiting the index" do
    visit ncfs_url
    assert_selector "h1", text: "Ncfs"
  end

  test "should create ncf" do
    visit ncfs_url
    click_on "New ncf"

    click_on "Create Ncf"

    assert_text "Ncf was successfully created"
    click_on "Back"
  end

  test "should update Ncf" do
    visit ncf_url(@ncf)
    click_on "Edit this ncf", match: :first

    click_on "Update Ncf"

    assert_text "Ncf was successfully updated"
    click_on "Back"
  end

  test "should destroy Ncf" do
    visit ncf_url(@ncf)
    click_on "Destroy this ncf", match: :first

    assert_text "Ncf was successfully destroyed"
  end
end
