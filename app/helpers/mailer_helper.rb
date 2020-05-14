module MailerHelper
    def email_image_tag(image, **options)
        attachments.inline[image]= {
            :data => File.read(Rails.root.join("app/assets/images/email/#{image}")),
            :mime_type => "image/#{image.split('.').last}",
            # :encoding => "base64"
        }
        image_tag attachments[image].url, **options
    end
 end