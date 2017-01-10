class DocumentsController < ApplicationController
  before_action :verify_user

  def new
    @document = Document.new
  end

  def create
    @document = current_user.documents.build document_params
    if @document.save
      flash[:success] = t ".create_success"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def document_params
    params.require(:document).permit :name, :description, :attachment,
      :category_id
  end
end
