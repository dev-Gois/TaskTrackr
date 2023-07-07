class ListsController < ApplicationController

    before_action :set_list, only: [:destroy]

    def create
      @list = List.new(list_params) 
      @list.user = User.find(session[:user_id])
  
      if @list.title.blank?
        redirect_to tasks_path, alert: 'Preencha o nome da lista!'
      elsif @list.save
        redirect_to tasks_path, notice: 'Lista criada com sucesso!'
      else
        redirect_to tasks_path, alert: 'Erro: ' + @list.errors.full_messages.join(', ')
      end
    end 

    def destroy
        @list.destroy

        respond_to do |format|
          format.html { redirect_to tasks_path, notice: "List was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private

    def list_params
        params.permit(:title)
    end

    def set_list
        @list = List.find(params[:id])
      end
  end
  