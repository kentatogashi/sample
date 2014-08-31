module SessionsHelper
    def sign_in(user)
        remember_token = User.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        user.update_attribute(:remember_token, User.encrypt(remember_token))
        self.current_user = user
        p "current_user is =>"
        p self.current_user
        p "current_user is end above."

    end
    
    def current_user=(user)
        @current_user = user
    end

    def current_user
        remember_token = User.encrypt(cookies[:remember_token])
        p "remember_token: =>"
        p remember_token
        @current_user ||= User.find_by(remember_token: remember_token)
        p "current_user: =>"
        p @current_user
    end
    
    def signed_in?
        p "TRYING TO SIGN IN"
        p !current_user.nil?
        p current_user
        p self.current_user
        p @current_user
        p self.current_user

        !current_user.nil?
    end

    def sign_out
        self.current_user = nil
        cookies.delete(:remember_token)
    end
end
