module ControllerMacros
  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryBot.create(:admin) # Using factory bot as an example
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.build(:user)
    sign_in user
  end
	def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
			# debugger
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
	end
end
