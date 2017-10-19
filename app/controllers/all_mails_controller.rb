class AllMailsController < ApplicationController
  def index
  	@columns = Email.column_names - ["content","updated_at"]
  	@all_mails = Email.where(sender: current_user.email).order(created_at: :desc)
  end

  def show
  	email = Email.find(params[:id])
  	if email.sender == current_user.email
  	else
  		flash[:notice] = 'Insufficient rights!'
		redirect_to '/all_mails/index'
		# return redirect_to '/all_mails/index', :flash => { :error => "Insufficient rights!" }
  	end
  end

end
