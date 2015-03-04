require 'test_helper'

class TestRegistrationsControllerTest < ActionController::TestCase
  setup do
    @test_registration = test_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_registration" do
    assert_difference('TestRegistration.count') do
      post :create, test_registration: { confirmation_status: @test_registration.confirmation_status, confirmed: @test_registration.confirmed, name: @test_registration.name }
    end

    assert_redirected_to test_registration_path(assigns(:test_registration))
  end

  test "should show test_registration" do
    get :show, id: @test_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_registration
    assert_response :success
  end

  test "should update test_registration" do
    patch :update, id: @test_registration, test_registration: { confirmation_status: @test_registration.confirmation_status, confirmed: @test_registration.confirmed, name: @test_registration.name }
    assert_redirected_to test_registration_path(assigns(:test_registration))
  end

  test "should destroy test_registration" do
    assert_difference('TestRegistration.count', -1) do
      delete :destroy, id: @test_registration
    end

    assert_redirected_to test_registrations_path
  end
end
