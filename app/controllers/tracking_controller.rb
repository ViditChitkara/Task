class TrackingController < ApplicationController
  def image
    # do something with params[:id]
    Mail.markRead(params[:id])
    send_file asset_path("small.png")
  end
end
