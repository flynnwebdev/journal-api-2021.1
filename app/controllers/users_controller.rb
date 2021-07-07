class UsersController < ApplicationController
    def login
        user = User.find_by_email(user_params[:email])
        if user && user.authenticate(user_params[:password])
            payload = { email: user.email, exp: Time.now.to_i + (4 * 3600) }
            token = JWT.encode(payload, @@jwt_secret, 'HS512')
            render json: { token: token }
        else
            render json: { error: 'Username or password incorrect' }, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:email, :password)
    end
end
