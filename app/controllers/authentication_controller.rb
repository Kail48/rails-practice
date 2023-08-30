class AuthenticationController < ApplicationController
    require './lib/services/json_web_token'
    skip_before_action :verify_authenticity_token
    before_action :authorize_request, except: :login
    def login
        @user=User.find_by_username(params[:username])
        puts params[:password]
        puts @user.authenticate(params[:password])
        if @user&.authenticate(params[:password]) 
            token=JsonWebToken.encode(user_id:@user.id)
            time=Time.now+24.hours.to_i 
            render json:{token: token,exp:time.strftime("%m-%d-%Y %H:%M"),username:@user.username,position:@user.position}, status: :ok
        else
            render json: {error: 'unatuthorized'}, status: :unauthorized
        end
    end
end
