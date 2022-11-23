class User::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(user_params)
    if @user.save
      token = @user.generate_jwt
      debugger
      render json: { 
        message: 'Signed up sucessfully.',
        user: @user,
        token: token
      } 

    else
      render json: { errors: "#{@user.errors.full_messages}"}, status: :unprocessable_entity
    end
  end

    def user_params
      params.require(:user).permit(:email, :password, :role, :password_confirmation, :first_name, :last_name, :gender, :contact_no)
    end
  end