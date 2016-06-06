module PublicationsHelper
  def get_icon_file(file, size_icon = '60')
    image_tag("file_types/file_#{File.extname(file.to_s.downcase).gsub('.', '')}.png", size: size_icon)
  end
end
