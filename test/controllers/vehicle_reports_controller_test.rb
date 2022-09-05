require "test_helper"

class VehicleReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_report = vehicle_reports(:one)
  end

  test "should get index" do
    get vehicle_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_report_url
    assert_response :success
  end

  test "should create vehicle_report" do
    assert_difference("VehicleReport.count") do
      post vehicle_reports_url, params: { vehicle_report: {  } }
    end

    assert_redirected_to vehicle_report_url(VehicleReport.last)
  end

  test "should show vehicle_report" do
    get vehicle_report_url(@vehicle_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_report_url(@vehicle_report)
    assert_response :success
  end

  test "should update vehicle_report" do
    patch vehicle_report_url(@vehicle_report), params: { vehicle_report: {  } }
    assert_redirected_to vehicle_report_url(@vehicle_report)
  end

  test "should destroy vehicle_report" do
    assert_difference("VehicleReport.count", -1) do
      delete vehicle_report_url(@vehicle_report)
    end

    assert_redirected_to vehicle_reports_url
  end
end
