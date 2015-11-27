class UtilSecurityService

  def encripty_url(url, user)
    if user.key_phrase.nil?
      user.update_attributes(key_phrase: generate_radom_phrase)
    end
    encryptor = EncryptorService.new(get_user_key(user), user.key_phrase)
    encryptor.encrypt(url)
  end

  def dencripty_url(url_encryptor, user)
    dencryptor = EncryptorService.new(get_user_key(user), user.key_phrase)
    dencryptor.decrypt(url_encryptor)
  end

  def get_user_key(user)
    "#{user.id}#{user.confirmation_token}"
  end

  def generate_radom_phrase
    ["avatar", "brahma", "bluedreamer", "caduceus", "calappidae", "devildog", "ganesha", "gnosis", "icharus", "logos", "logosii", "mariner", "mjolnir", "nabonidus", "nebuchadnezzar", "neoshope", "novalis", "novalisii", "osiris", "pequod", "polaris", "prometheus", "saltpillar", "scanline", "shiva", "vigilant", "vishnu"].shuffle.sample.to_s
  end


end