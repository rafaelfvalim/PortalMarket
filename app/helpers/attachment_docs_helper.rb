module AttachmentDocsHelper
  def attachment_icon(filename, id)
    html = <<-HTML
      <tr>
        <td> #{get_icon_file(filename, '35')}</td>
        <td> #{filename} </td>
        <td>#{check_box_tag 'attachment_docs[]', id}</td>
      </tr>
    HTML
    html.html_safe
  end
end
