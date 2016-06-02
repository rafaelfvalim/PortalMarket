class CreateIndustriesService
  def call
    Industry.create(description:"Todas")
    Industry.create(description:"Outra")
    Industry.create(description:"Aerospace and Defense")
    Industry.create(description:"Automotive")
    Industry.create(description:"Banking")
    Industry.create(description:"Chemicals")
    Industry.create(description:"Consumer Products")
    Industry.create(description:"Defense and Security")
    Industry.create(description:"Engineering, Construction, and Operations")
    Industry.create(description:"Healthcare")
    Industry.create(description:"High Tech")
    Industry.create(description:"Higher,Education and Research")
    Industry.create(description:"Industrial Machinery and Components")
    Industry.create(description:"InsuranceLife Sciences")
    Industry.create(description:"Media")
    Industry.create(description:"Mill Products")
    Industry.create(description:"Mining")
    Industry.create(description:"Oil and Gas")
    Industry.create(description:"Professional Services")
    Industry.create(description:"Public SectorRetail")
    Industry.create(description:"Sports and Entertainment")
    Industry.create(description:"Telecommunications")
    Industry.create(description:"Travel and Transportation")
    Industry.create(description:"Utilities")
    Industry.create(description:"Wholesale Distribution")

  end

end