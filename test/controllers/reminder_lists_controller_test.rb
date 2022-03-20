require 'test_helper'

class ReminderListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reminder_list = reminder_lists(:one)
  end

  test "should get index" do
    get reminder_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_reminder_list_url
    assert_response :success
  end

  test "should create reminder_list" do
    assert_difference('ReminderList.count') do
      post reminder_lists_url, params: { reminder_list: { date: @reminder_list.date, description: @reminder_list.description, id: @reminder_list.id, isDone: @reminder_list.isDone, isOverDue: @reminder_list.isOverDue } }
    end

    assert_redirected_to reminder_list_url(ReminderList.last)
  end

  test "should show reminder_list" do
    get reminder_list_url(@reminder_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_reminder_list_url(@reminder_list)
    assert_response :success
  end

  test "should update reminder_list" do
    patch reminder_list_url(@reminder_list), params: { reminder_list: { date: @reminder_list.date, description: @reminder_list.description, id: @reminder_list.id, isDone: @reminder_list.isDone, isOverDue: @reminder_list.isOverDue } }
    assert_redirected_to reminder_list_url(@reminder_list)
  end

  test "should destroy reminder_list" do
    assert_difference('ReminderList.count', -1) do
      delete reminder_list_url(@reminder_list)
    end

    assert_redirected_to reminder_lists_url
  end
end
