class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.email.blank? || @user.password.blank? || @user.password_confirmation.blank?
            flash[:alert] = 'Preencha todos os campos'
            render :new 
        elsif User.exists?(email: @user.email)
            flash[:alert] = 'Email ja existente'
            render :new
        elsif @user.password != @user.password_confirmation
            flash[:alert] = 'Senhas nao coincidem'
            render :new
        elsif @user.save
            session[:user_id] = @user.id
            redirect_to tasks_path, notice: 'User created'
        else
            flash[:alert] = 'Erro na criacao'
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
