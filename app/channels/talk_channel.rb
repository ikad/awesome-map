# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class TalkChannel < ApplicationCable::Channel
  def subscribed
    stream_from "talk_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    current_user.messages.create!(content: ApplicationController.helpers.sanitize(data['message']))
  end

  def plot(data)
    current_user.markers.create!(lat: data['lat'], lng: data['lng'])
  end

  def delete(data)
    current_user.markers.destroy(data['id'])
  rescue
    marker = Marker.find(data['id'])
    BroadcastMarkerJob.perform_later(marker)
  end
end
