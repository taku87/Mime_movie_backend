class CompletedVideoSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :video_url, :created_at
end