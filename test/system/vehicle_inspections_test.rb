require "application_system_test_case"

class VehicleInspectionsTest < ApplicationSystemTestCase
  setup do
    @vehicle_inspection = vehicle_inspections(:one)
  end

  test "visiting the index" do
    visit vehicle_inspections_url
    assert_selector "h1", text: "Vehicle inspections"
  end

  test "should create vehicle inspection" do
    visit vehicle_inspections_url
    click_on "New vehicle inspection"

    fill_in "Inspection date", with: @vehicle_inspection.inspection_date
    fill_in "Inspection passed", with: @vehicle_inspection.inspection_passed
    fill_in "Inspection period", with: @vehicle_inspection.inspection_period_id
    fill_in "Org name", with: @vehicle_inspection.org_name
    fill_in "Vehicle", with: @vehicle_inspection.vehicle_id
    fill_in "Vehicle org", with: @vehicle_inspection.vehicle_org_id
    click_on "Create Vehicle inspection"

    assert_text "Vehicle inspection was successfully created"
    click_on "Back"
  end

  test "should update Vehicle inspection" do
    visit vehicle_inspection_url(@vehicle_inspection)
    click_on "Edit this vehicle inspection", match: :first

    fill_in "Inspection date", with: @vehicle_inspection.inspection_date
    fill_in "Inspection passed", with: @vehicle_inspection.inspection_passed
    fill_in "Inspection period", with: @vehicle_inspection.inspection_period_id
    fill_in "Org name", with: @vehicle_inspection.org_name
    fill_in "Vehicle", with: @vehicle_inspection.vehicle_id
    fill_in "Vehicle org", with: @vehicle_inspection.vehicle_org_id
    click_on "Update Vehicle inspection"

    assert_text "Vehicle inspection was successfully updated"
    click_on "Back"
  end

  test "should destroy Vehicle inspection" do
    visit vehicle_inspection_url(@vehicle_inspection)
    click_on "Destroy this vehicle inspection", match: :first

    assert_text "Vehicle inspection was successfully destroyed"
  end
end
