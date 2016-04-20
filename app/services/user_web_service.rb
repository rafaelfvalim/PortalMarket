class UserWebService

  def generateToken(member_cpf)
    url = Rails.configuration.webservice_user_token
    client = Savon.client(wsdl: url)
    client.operations
    response = client.call(:generate_user_token, message: {cpf: member_cpf.gsub(/\W/, '')})
    if response.success?
      return response.body[:generate_user_token_response][:generate_user_token_return]
    end
  rescue Savon::SOAPFault => error
    fault_code = error.to_hash[:fault][:faultcode]
    p '>>>>>>> start userservice generate token'
    p fault_code
    p '>>>>>>> send userservice generate token'
  end


end