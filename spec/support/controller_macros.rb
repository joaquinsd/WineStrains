module ControllerMacros

  def login_user
    # Before each test, create and login the user
    before(:each) do
      user = User.create(email:'test@test.cl', password: 123456, password_confirmation: 123456)
      # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
  
end