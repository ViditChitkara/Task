class TrackingController < ApplicationController
  def image
    # do something with params[:id]
    Email.markRead(params[:id])
    # path = ActionController::Base.helpers.asset_path('small.png')

    # send_file "https://drive.google.com/file/d/0B5VSXKf5GnOWM2ktSGJIV3poUTQ/view?usp=sharing"
    # send_file path, :type => 'image/png', :disposition => 'inline'
    # send_file File.open(path,"rb"), :type => 'image/png', :disposition => 'inline'
    send_data("#{Rails.root}/assets/images/small.png",:type => 'image/png', :disposition  =>  'inline')

  end
end
