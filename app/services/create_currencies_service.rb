class CreateCurrenciesService
  def call
    Currency.create(description: "BRL")
  end
end
