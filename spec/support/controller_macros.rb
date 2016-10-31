module ControllerMacros
  def login_user
    before(:each) do
      User.delete_all
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @logged_in_user = FactoryGirl.create(:user)
      sign_in @logged_in_user
      allow(controller).to receive(:current_user) { @logged_in_user }
    end
  end
end
