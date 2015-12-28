class TopController < ApplicationController
  def index
    @markers = Marker.includes(:user).all
    @messages = Message.includes(:user).all.last(30)
  end
end
