class CreateSystemsService
  def call
    System.create( name:"SAP" )
    System.create( name:"Oracle" )
  end
end
