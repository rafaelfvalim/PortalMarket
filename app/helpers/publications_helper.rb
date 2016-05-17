module PublicationsHelper

  def get_icon_file(file)
    case File.extname(file.to_s.downcase)
      when '.pdf' then
        image_tag("file_types/file_pdf.png", size: '60')
      # 'fa fa-file-pdf-o'
      when '.doc' then
        image_tag("file_types/file_doc.png", size: '60')
      # 'fa fa-file-word-o'
      when '.docx' then
        image_tag("file_types/file_docx.png", size: '60')
      # 'fa fa-file-word-o'
      when '.png' then
        image_tag("file_types/file_png.png", size: '60')
      # 'fa fa-file-image-o'
      when '.jpeg' then
        image_tag("file_types/file_jpg.png", size: '60')
      # 'fa fa-file-image-o'
      when '.gif' then
        image_tag("file_types/file_gif.png", size: '60')
      # 'fa fa-file-image-o'
      when '.txt' then
        image_tag("file_types/file_txt.png", size: '60')
      # 'fa fa-file-txt'
      when '.xls' then
        image_tag("file_types/file_xlx.png", size: '60')
      # 'fa fa-file-excel-o'
      when '.xlsx' then
        image_tag("file_types/file_xlx.png", size: '60')
      # 'fa fa-file-excel-o'
      else
        # 'fa fa-file-o'4
        image_tag("file_types/file_uknow.png", size: '60')
    end
  end
end
