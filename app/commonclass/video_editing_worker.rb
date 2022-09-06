require 'streamio-ffmpeg'

class VideoEditingWorker
  def self.user_video_to_mp4(users_video)
    user_video_path = users_video.video_url
    user_video_path = user_video_path.file.file
    movie = FFMPEG::Movie.new(user_video_path)
    @transcoded_user_video_name = "#{users_video.content_number}_content_user_movie_#{users_video.number}.mp4"
    output_path = "#{Rails.root}/public/assets/transcoded_user_video/#{users_video.content_number}_content_user_movie_#{users_video.number}.mp4"
    options = { video_codec: "h264",  audio_codec: "aac",  resolution: "1280x720" }
    transcoded_user_video = movie.transcode(output_path, options)
    trancoded_output_path = "/assets/transcoded_user_video/#{users_video.content_number}_content_user_movie_#{users_video.number}.mp4"
    trancoded_output_path
  end
end
