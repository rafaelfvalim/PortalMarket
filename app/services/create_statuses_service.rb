class CreateStatusesService
  def call
    Status.create( description:"Gravado" )
    Status.create( description:"Verificação de Duplicidade" )
    Status.create( description:"Verificação de Consistência" )
    Status.create( description:"Verficação de Complexidade" )
    Status.create( description:"Aprovado" )
    Status.create( description:"Inicial" )
  end
end
