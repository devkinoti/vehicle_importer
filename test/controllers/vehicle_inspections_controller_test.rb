require "test_helper"

class VehicleInspectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_inspection = vehicle_inspections(:one)
  end

  test "should get index" do
    get vehicle_inspections_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_inspection_url
    assert_response :success
  end

  test "should create vehicle_inspection" do
    assert_difference("VehicleInspection.count") do
      post vehicle_inspections_url, params: { vehicle_inspection: { inspection_date: @vehicle_inspection.inspection_date, inspection_passed: @vehicle_inspection.inspection_passed, inspection_period_id: @vehicle_inspection.inspection_period_id, org_name: @vehicle_inspection.org_name, vehicle_id: @vehicle_inspection.vehicle_id, vehicle_org_id: @vehicle_inspection.vehicle_org_id } }
    end

    assert_redirected_to vehicle_inspection_url(VehicleInspection.last)
  end

  test "should show vehicle_inspection" do
    get vehicle_inspection_url(@vehicle_inspection)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_inspection_url(@vehicle_inspection)
    assert_response :success
  end

  test "should update vehicle_inspection" do
    patch vehicle_inspection_url(@vehicle_inspection), params: { vehicle_inspection: { inspection_date: @vehicle_inspection.inspection_date, inspection_passed: @vehicle_inspection.inspection_passed, inspection_period_id: @vehicle_inspection.inspection_period_id, org_name: @vehicle_inspection.org_name, vehicle_id: @vehicle_inspection.vehicle_id, vehicle_org_id: @vehicle_inspection.vehicle_org_id } }
    assert_redirected_to vehicle_inspection_url(@vehicle_inspection)
  end

  test "should destroy vehicle_inspection" do
    assert_difference("VehicleInspection.count", -1) do
      delete vehicle_inspection_url(@vehicle_inspection)
    end

    assert_redirected_to vehicle_inspections_url
  end
end
