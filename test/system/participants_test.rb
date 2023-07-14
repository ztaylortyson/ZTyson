require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "should create participant" do
    visit participants_url
    click_on "New participant"

    fill_in "Address", with: @participant.address
    fill_in "City", with: @participant.city
    fill_in "Dob", with: @participant.dob
    fill_in "Email", with: @participant.email
    fill_in "Fname", with: @participant.fname
    fill_in "Lname", with: @participant.lname
    fill_in "Mname", with: @participant.mname
    fill_in "Phone", with: @participant.phone
    fill_in "Ssn", with: @participant.ssn
    fill_in "State", with: @participant.state
    fill_in "Zip", with: @participant.zip
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "should update Participant" do
    visit participant_url(@participant)
    click_on "Edit this participant", match: :first

    fill_in "Address", with: @participant.address
    fill_in "City", with: @participant.city
    fill_in "Dob", with: @participant.dob
    fill_in "Email", with: @participant.email
    fill_in "Fname", with: @participant.fname
    fill_in "Lname", with: @participant.lname
    fill_in "Mname", with: @participant.mname
    fill_in "Phone", with: @participant.phone
    fill_in "Ssn", with: @participant.ssn
    fill_in "State", with: @participant.state
    fill_in "Zip", with: @participant.zip
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "should destroy Participant" do
    visit participant_url(@participant)
    click_on "Destroy this participant", match: :first

    assert_text "Participant was successfully destroyed"
  end
end
