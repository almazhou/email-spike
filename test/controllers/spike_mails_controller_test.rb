require 'test_helper'

class SpikeMailsControllerTest < ActionController::TestCase
  setup do
    @spike_mail = spike_mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spike_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spike_mail" do
    assert_difference('SpikeMail.count') do
      post :create, spike_mail: {  }
    end

    assert_redirected_to spike_mail_path(assigns(:spike_mail))
  end

  test "should show spike_mail" do
    get :show, id: @spike_mail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spike_mail
    assert_response :success
  end

  test "should update spike_mail" do
    patch :update, id: @spike_mail, spike_mail: {  }
    assert_redirected_to spike_mail_path(assigns(:spike_mail))
  end

  test "should destroy spike_mail" do
    assert_difference('SpikeMail.count', -1) do
      delete :destroy, id: @spike_mail
    end

    assert_redirected_to spike_mails_path
  end
end
