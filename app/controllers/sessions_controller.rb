class SessionsController < ApplicationController
    def new; end

    def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to tasks_path, notice: 'Login feito com sucesso!'
        else
            redirect_to sign_up_path, alert: 'Email ou senha incorretos'
        end 
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logout feito com sucesso'
    end
end
