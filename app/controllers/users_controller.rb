class UsersController < Clearance::UsersController


  before_action :set_user, only: [:show, :edit, :update]


  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end


  def show
    render "static/home"
  end


  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
      # Handle a successful update.
    else
      render 'edit'
      # render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :photo) 
  end

  def set_user
    @user= User.find(params[:id])
  end

end
