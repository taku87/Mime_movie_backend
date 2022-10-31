class ContentVideoGuestSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :title, :description, :thumbnail, :state

end
