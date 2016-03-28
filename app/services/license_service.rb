class LicenseService

  def create_license_key(invoice)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    key = (0...20).map{ charset.to_a[rand(charset.size)] }.join
    return key.chars.each_slice(4).map(&:join).join('-')
  end

end
