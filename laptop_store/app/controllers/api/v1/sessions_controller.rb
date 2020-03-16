module Api
  module V1
    class SessionsController < MainController

      def login
      	user = User.find_by(username: params[:username])
      	if user and user.password == params[:password]
      	  token = JWT.encode user.id, Rails.application.secrets.secret_key_base, 'HS256'
  	  	  render json: {token: token, message: 'login successful', status: 200}
  	  	else 
  	  	  render json: {message: "login unsuccessfull"}, status: :unauthorized
      	end
      end
      
	end
  end
end