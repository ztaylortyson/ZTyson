require "application_system_test_case"

class JournalsTest < ApplicationSystemTestCase
  setup do
    @journal = journals(:one)
  end

  test "visiting the index" do
    visit journals_url
    assert_selector "h1", text: "Journals"
  end

  test "should create journal" do
    visit journals_url
    click_on "New journal"

    fill_in "Lawsuit", with: @journal.Lawsuit_id
    fill_in "Binder", with: @journal.binder
    fill_in "Cost", with: @journal.cost
    fill_in "Description", with: @journal.description
    fill_in "Event date", with: @journal.event_date
    fill_in "Note", with: @journal.note
    click_on "Create Journal"

    assert_text "Journal was successfully created"
    click_on "Back"
  end

  test "should update Journal" do
    visit journal_url(@journal)
    click_on "Edit this journal", match: :first

    fill_in "Lawsuit", with: @journal.Lawsuit_id
    fill_in "Binder", with: @journal.binder
    fill_in "Cost", with: @journal.cost
    fill_in "Description", with: @journal.description
    fill_in "Event date", with: @journal.event_date
    fill_in "Note", with: @journal.note
    click_on "Update Journal"

    assert_text "Journal was successfully updated"
    click_on "Back"
  end

  test "should destroy Journal" do
    visit journal_url(@journal)
    click_on "Destroy this journal", match: :first

    assert_text "Journal was successfully destroyed"
  end
end
