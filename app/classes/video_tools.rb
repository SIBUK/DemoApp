class VideoTools
  def initialize(video_url)
    @url = video_url
  end

  def get_video_id
    if @url.include?('www.youtube.com')
      new_url  = @url.sub('watch?v=', 'embed/')
      video_id = new_url.split('embed/')[1]
      video_id = video_id.split('&')[0]
      video_id = video_id.split('?')[0]
      video_id = video_id.split('/')[0]
      return video_id
    elsif @url.include?('vimeo.com')
      video_id = @url.scan(/vimeo.com\/(\d+)\/?/).flatten[0].to_s           # extract the video id
      if video_id == ""
        video_id = @url.scan(/video\/(\d+)\/?/).flatten[0].to_s
      end
      return video_id
    end
  end

  def get_embedded_url
    id = get_video_id
    if @url.include?('www.youtube.com')
      embedded_url = 'https://www.youtube.com/embed/%s' % id
      return embedded_url
    elsif @url.include?('vimeo.com')
      embedded_url = 'https://player.vimeo.com/video/%s?title=0&byline=0&portrait=0' % id
      return embedded_url
    end
    return nil
  end

  def get_thumbnail
    id = get_video_id
    if @url.include?('www.youtube.com')
      thumb_url = 'https://img.youtube.com/vi/%s/mqdefault.jpg' % id
      return thumb_url
    elsif @url.include?('vimeo.com')
      vimeo_video_json_url = 'https://vimeo.com/api/v2/video/%s.json' % id   # API call to get JSON file
      # Parse the JSON and extract the thumbnail_medium url
      thumb_url = JSON.parse(open(vimeo_video_json_url).read).first['thumbnail_medium'] rescue nil
      return thumb_url
    end
    return nil
  end

end