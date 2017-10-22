class AllMailsController < ApplicationController
  def index
  	@columns = Email.column_names - ["content","updated_at"]
  	@all_mails = Email.where(sender: current_user.email).order(created_at: :desc).page params[:page]
  end

  def show
  	email = Email.find(params[:id])
  	if email.sender == current_user.email
  		@email = email
  		@columns = Email.column_names - ["updated_at"]
  	else
  		flash[:notice] = 'Insufficient rights!'
		redirect_to '/all_mails/index'
  	end
  end

end
