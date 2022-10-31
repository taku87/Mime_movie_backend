class ContentVideoSerializer
  include JSONAPI::Serializer
  attributes :id, :number, :title, :description, :thumbnail, :state

  def initialize(resource, options = {})
    @@current_user = options[:current_user]
    super(resource)
  end


  attribute :liked do |content_video|
    if @@current_user.nil?
      'Not Loggin'
    else
      @@current_user.like?(content_video)
    end
  end
end
