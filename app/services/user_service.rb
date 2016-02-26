class UserService

  def generateToken(member_cpf)
    # params ||= Array.new
    # params << member_cpf
    # return JavaService.new.execute_jar(Rails.configuration.jar_token, params)
    return Time.now
  end

end
