module Api
  module V1
    class MainController < ActionController::API
      
      def authenticate_user 
      	if !token_decode(request.headers['Authorization']) #checks whether it can be decoded or not
      	  return invalid_user
      	end

      	load_current_user!   #saves current user

      	invalid_user unless @current_user  #if no current user, then renders json
      end

      def token_decode(token)
      	JWT.decode token, Rails.application.secrets.secret_key_base, false
        rescue
          nil
      end

      def invalid_user
      	render json: {error: 'Invalid Request'}, status: :unauthorized
      end

      def load_current_user!
  		@current_user = User.find_by(id: token_decode(request.headers['Authorization'])[0])
	  end

	end
  end
end