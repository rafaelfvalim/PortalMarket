class UserService

  def generateToken(member_cpf)
    # params ||= Array.new
    # params << member_cpf.gsub(/\W/, '')
    # return JavaService.new.execute_jar(Rails.configuration.jar_token, params)
   return UserWebService.new.generateToken(member_cpf)
  end

end
