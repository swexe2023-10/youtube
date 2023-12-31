class TopController < ApplicationController
    
    def main
        render "login"
    end

    def login
        if user = User.find_by(uid: params[:uid]) and BCrypt::Password.new(user.pass) == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path 
        else
            render 'login_form'
        end

    end
    
    def login_form
        render 'login_form'
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end