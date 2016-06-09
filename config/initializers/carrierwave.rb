module CarrierWave
  module Crop
    module Helpers
      def previewbox(attachment, opts = {})
        attachment = attachment.to_sym

        if (self.object.send(attachment).class.ancestors.include? CarrierWave::Uploader::Base)
          ## Fixes Issue #1 : Colons in html id attributes with Namespaced Models
          model_name = self.object.class.name.downcase.split("::").last
          width, height = 100, 100
          if (opts[:width] && opts[:height])
            width, height = opts[:width].round, opts[:height].round
          end
          wrapper_attributes = {id: "#{model_name}_#{attachment}_previewbox_wrapper", style: "width:#{width}px; height:#{height}px; overflow:hidden; border-radius: 50%;"}
          if opts[:version]
            img = self.object.send(attachment).url(opts[:version])
          else
            img = self.object.send(attachment).url
          end
          preview_image = @template.image_tag(img, id: "#{model_name}_#{attachment}_previewbox")
          @template.content_tag(:div, preview_image, wrapper_attributes)
        end
      end

      def cropbox(attachment, opts={})
        attachment = attachment.to_sym
        attachment_instance = self.object.send(attachment)

        if (attachment_instance.class.ancestors.include? CarrierWave::Uploader::Base)
          ## Fixes Issue #1 : Colons in html id attributes with Namespaced Models
          model_name = self.object.class.name.downcase.split("::").last
          hidden_elements = self.hidden_field(:"#{attachment}_crop_x", id: "#{model_name}_#{attachment}_crop_x")
          [:crop_y, :crop_w, :crop_h].each do |attribute|
            hidden_elements << self.hidden_field(:"#{attachment}_#{attribute}", id: "#{model_name}_#{attachment}_#{attribute}")
          end

          box = @template.content_tag(:div, hidden_elements, style: "display:none")

          wrapper_attributes = {id: "#{model_name}_#{attachment}_cropbox_wrapper"}
          if (opts[:width] && opts[:height])
            wrapper_attributes.merge!(style: "width:#{opts[:width].round}px; height:#{opts[:height].round}px; overflow:hidden")
          end

          if opts[:version]
            img = self.object.send(attachment).url(opts[:version])
          else
            img = self.object.send(attachment).url
          end
          crop_image = @template.image_tag(img, :id => "#{model_name}_#{attachment}_cropbox")
          box << @template.content_tag(:div, crop_image, wrapper_attributes)
        end
      end
    end
  end
end