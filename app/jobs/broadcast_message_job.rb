class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast('talk_channel', message: render_message(message))
  end

  private

    def render_message(message)
      ApplicationController.renderer.render(json: message)
    end
end
