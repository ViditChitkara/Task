class TrackingController < ApplicationController
  def image
    Email.markRead(params[:id])
    send_file("#{Rails.root}/public/images/small.png",:type => 'image/png', :disposition  =>  'inline', :x_sendfile => true)
  end
end
