class CreatePayMethodsService
  def call
    PayMethod.create( name:"Credit", notes: "Credito Concedido" )
    PayMethod.create( name:"CredCard", notes: "Cartão de crédido" )
  end
end
