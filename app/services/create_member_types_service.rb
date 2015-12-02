class CreateMemberTypesService
  def call
    MemberType.create( description:"contributor")
    MemberType.create( description:"customer")
    MemberType.create( description:"god")
  end
end
