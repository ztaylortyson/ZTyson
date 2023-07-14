require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Dln", with: @client.dln
    fill_in "Dob", with: @client.dob
    fill_in "Ec email", with: @client.ec_email
    fill_in "Ec name", with: @client.ec_name
    fill_in "Ec phone", with: @client.ec_phone
    fill_in "Fname", with: @client.fname
    fill_in "Lname", with: @client.lname
    fill_in "Mname", with: @client.mname
    fill_in "Phone", with: @client.phone
    fill_in "Ssn", with: @client.ssn
    fill_in "State", with: @client.state
    fill_in "User", with: @client.user_id
    fill_in "Zip", with: @client.zip
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Dln", with: @client.dln
    fill_in "Dob", with: @client.dob
    fill_in "Ec email", with: @client.ec_email
    fill_in "Ec name", with: @client.ec_name
    fill_in "Ec phone", with: @client.ec_phone
    fill_in "Fname", with: @client.fname
    fill_in "Lname", with: @client.lname
    fill_in "Mname", with: @client.mname
    fill_in "Phone", with: @client.phone
    fill_in "Ssn", with: @client.ssn
    fill_in "State", with: @client.state
    fill_in "User", with: @client.user_id
    fill_in "Zip", with: @client.zip
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
