class CreateInvoiceStatusesService
  def call
    InvoiceStatus.create( description:"Waiting")
    InvoiceStatus.create( description:"Sent")
    InvoiceStatus.create( description:"Complete")
    InvoiceStatus.create( description:"Canceled")
  end
end
