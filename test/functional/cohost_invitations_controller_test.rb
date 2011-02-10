require 'test_helper'

class CohostInvitationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CohostInvitation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CohostInvitation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CohostInvitation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cohost_invitation_url(assigns(:cohost_invitation))
  end

  def test_edit
    get :edit, :id => CohostInvitation.first
    assert_template 'edit'
  end

  def test_update_invalid
    CohostInvitation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CohostInvitation.first
    assert_template 'edit'
  end

  def test_update_valid
    CohostInvitation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CohostInvitation.first
    assert_redirected_to cohost_invitation_url(assigns(:cohost_invitation))
  end

  def test_destroy
    cohost_invitation = CohostInvitation.first
    delete :destroy, :id => cohost_invitation
    assert_redirected_to cohost_invitations_url
    assert !CohostInvitation.exists?(cohost_invitation.id)
  end
end
