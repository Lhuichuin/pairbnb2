class UsersController < Clearance::UsersController

  def create
    @user = User.new(sign_up_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end
	private

	def sign_up_params
		params.require(:user).permit(:email, :password, :name) 
	end

end
