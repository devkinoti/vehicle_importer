require "application_system_test_case"

class VehicleReportsTest < ApplicationSystemTestCase
  setup do
    @vehicle_report = vehicle_reports(:one)
  end

  test "visiting the index" do
    visit vehicle_reports_url
    assert_selector "h1", text: "Vehicle reports"
  end

  test "should create vehicle report" do
    visit vehicle_reports_url
    click_on "New vehicle report"

    click_on "Create Vehicle report"

    assert_text "Vehicle report was successfully created"
    click_on "Back"
  end

  test "should update Vehicle report" do
    visit vehicle_report_url(@vehicle_report)
    click_on "Edit this vehicle report", match: :first

    click_on "Update Vehicle report"

    assert_text "Vehicle report was successfully updated"
    click_on "Back"
  end

  test "should destroy Vehicle report" do
    visit vehicle_report_url(@vehicle_report)
    click_on "Destroy this vehicle report", match: :first

    assert_text "Vehicle report was successfully destroyed"
  end
end
