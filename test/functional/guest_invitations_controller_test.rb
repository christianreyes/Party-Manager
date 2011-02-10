require 'test_helper'

class GuestInvitationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GuestInvitation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GuestInvitation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GuestInvitation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to guest_invitation_url(assigns(:guest_invitation))
  end

  def test_edit
    get :edit, :id => GuestInvitation.first
    assert_template 'edit'
  end

  def test_update_invalid
    GuestInvitation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GuestInvitation.first
    assert_template 'edit'
  end

  def test_update_valid
    GuestInvitation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GuestInvitation.first
    assert_redirected_to guest_invitation_url(assigns(:guest_invitation))
  end

  def test_destroy
    guest_invitation = GuestInvitation.first
    delete :destroy, :id => guest_invitation
    assert_redirected_to guest_invitations_url
    assert !GuestInvitation.exists?(guest_invitation.id)
  end
end
