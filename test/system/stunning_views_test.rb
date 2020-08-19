require "application_system_test_case"

class StunningViewsTest < ApplicationSystemTestCase
  setup do
    @stunning_view = stunning_views(:one)
  end

  test "visiting the index" do
    visit stunning_views_url
    assert_selector "h1", text: "Stunning Views"
  end

  test "creating a Stunning view" do
    visit stunning_views_url
    click_on "New Stunning View"

    check "Car access" if @stunning_view.car_access
    fill_in "City", with: @stunning_view.city_id
    fill_in "Description", with: @stunning_view.description
    check "Family friendly" if @stunning_view.family_friendly
    check "Free access" if @stunning_view.free_access
    fill_in "Latitude", with: @stunning_view.latitude
    fill_in "Longitude", with: @stunning_view.longitude
    fill_in "Overlooking", with: @stunning_view.overlooking
    check "Serviced" if @stunning_view.serviced
    fill_in "Title", with: @stunning_view.title
    click_on "Create Stunning view"

    assert_text "Stunning view was successfully created"
    click_on "Back"
  end

  test "updating a Stunning view" do
    visit stunning_views_url
    click_on "Edit", match: :first

    check "Car access" if @stunning_view.car_access
    fill_in "City", with: @stunning_view.city_id
    fill_in "Description", with: @stunning_view.description
    check "Family friendly" if @stunning_view.family_friendly
    check "Free access" if @stunning_view.free_access
    fill_in "Latitude", with: @stunning_view.latitude
    fill_in "Longitude", with: @stunning_view.longitude
    fill_in "Overlooking", with: @stunning_view.overlooking
    check "Serviced" if @stunning_view.serviced
    fill_in "Title", with: @stunning_view.title
    click_on "Update Stunning view"

    assert_text "Stunning view was successfully updated"
    click_on "Back"
  end

  test "destroying a Stunning view" do
    visit stunning_views_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stunning view was successfully destroyed"
  end
end
