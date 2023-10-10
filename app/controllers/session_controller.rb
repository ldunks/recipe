class SessionController < ApplicationController
    def new
    end

    def create
        user = UserInfo.find_by(username: params[:username])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid username or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        @user = nil
        redirect_to root_path, notice: "Logged out"
    end
end