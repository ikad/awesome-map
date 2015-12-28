class MarkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :lng
  belongs_to :user
end
