class LicenseService

  def create_license_key(invoice)
    # charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    # key = (0...20).map{ charset.to_a[rand(charset.size)] }.join
    # params ||= Array.new
    # params << "#{Rails.public_path}#{invoice.invoice_script_url}"
    # key = JavaService.new.execute_jar(Rails.configuration.jar_license, params)
    key = ScriptWebService.new.generate_key_script(invoice)
    # key = key.gsub!(/\s+/, '')
    return key.chars.each_slice(6).map(&:join).join('-')
  end

  def initialize_license(invoice)
    license = License.new
    license.attributes = {invoice_id: invoice.id, description: invoice.script.description}
    license.save
  end

end
