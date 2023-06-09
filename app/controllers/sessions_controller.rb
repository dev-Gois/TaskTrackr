class SessionsController < ApplicationController
    def new; end

    def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to tasks_path, notice: 'Login feito com sucesso!'
        else
            flash.now[:alert] = 'Email ou senha invalidos'
            render :new
        end 
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logout feito com sucesso'
    end
end
