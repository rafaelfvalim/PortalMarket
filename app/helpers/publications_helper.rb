module PublicationsHelper

  def get_icon_file(file)
    case File.extname(file.to_s.downcase)
      when '.pdf' then
        'fa fa-file-pdf-o'
      when '.doc' then
        'fa fa-file-word-o'
      when '.docx' then
        'fa fa-file-word-o'
      when '.odt' then
        'fa fa-file-word-o'
      when '.png' then
        'fa fa-file-image-o'
      when '.jpeg' then
        'fa fa-file-image-o'
      when '.gif' then
        'fa fa-file-image-o'
      when '.txt' then
        'fa fa-file-txt'
      when '.xls' then
        'fa fa-file-excel-o'
      when '.xlsx' then
        'fa fa-file-excel-o'
      when '.edy' then
        'fa fa-file-code-o'
      else
        'fa fa-file'
    end
  end
end
