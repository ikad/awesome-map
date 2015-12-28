class BroadcastMarkerJob < ApplicationJob
  queue_as :default

  def perform(marker)
    ActionCable.server.broadcast('talk_channel', marker: render_marker(marker))
  end

  private

    def render_marker(marker)
      ApplicationController.renderer.render(json: marker)
    end
end
