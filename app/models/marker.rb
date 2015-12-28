class Marker < ApplicationRecord
  after_create_commit {BroadcastMarkerJob.perform_later(self)}

  belongs_to :user
end
