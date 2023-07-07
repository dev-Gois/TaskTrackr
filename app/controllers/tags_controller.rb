class TagsController < ApplicationController

    before_action :set_tag, only: [:destroy]

    def create
      @tag = Tag.new(tag_params) 
      @tag.user = User.find(session[:user_id])
  
      if @tag.title.blank?
        redirect_to tasks_path, alert: 'Preencha o nome da tag!'
      elsif @tag.save
        redirect_to tasks_path, notice: 'Tag criada com sucesso!'
      else
        redirect_to tasks_path, alert: 'Erro: ' + @tag.errors.full_messages.join(', ')
      end
    end 

    def destroy
        @tag.destroy

        respond_to do |format|
          format.html { redirect_to tasks_path, notice: "Tag was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private

    def tag_params
        params.permit(:title, :color)
    end

    def set_tag
        @tag = Tag.find(params[:id])
      end
end
