class CreateComplexitiesService
  def call
    Complexity.create(description:"AC5M (Altamente Complexo nível 5)")
    Complexity.create(description:"AC4M (Altamente Complexo nível 4)")
    Complexity.create(description:"AC3M (Altamente Complexo nível 3)")
    Complexity.create(description:"AC2M (Altamente Complexo nível 2)")
    Complexity.create(description:"AC1M (Altamente Complexo nível 1)")
    Complexity.create(description:"MCMAX (Muito Complexo nível máximo)")
    Complexity.create(description:"MCMIN (Muito Complexo nível mínimo)")
    Complexity.create(description:"CMAX (Complexo nível máximo)")
    Complexity.create(description:"CMIN (Complexo nível mínimo)")
    Complexity.create(description:"MMAX (Média Complexidade nível máximo)")
    Complexity.create(description:"MMIN (Média Complexidade nível mínimo)")
    Complexity.create(description:"BMAX (Baixa Complexidade nível máximo)")
    Complexity.create(description:"BMIN (Baixa Complexidade nível mínimo)")
    Complexity.create(description:"MBMAX (Complexidade muito baixa nível máximo)")
    Complexity.create(description:"MBMIN (Complexidade muito baixa nível mínimo)")
  end

end