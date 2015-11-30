class InvoiceReportService

  def report_test(invoice)
    report = ODFReport::Report.new("#{Rails.public_path}/reports/my_template.odt") do |r|
      r.add_field :user_name, "TEETE"
      r.add_field :address, "My new address"
    end
    report.generate("#{Rails.public_path}/reports/my_template_out.odt")
  end

  def report_test(start_date, end_date, invoice_status_id)
    #invoices = Invoice.where('invoice_status_id = ?', invoice_status_id)
    invoices = Invoice.all
    report = ODFReport::Report.new("#{Rails.public_path}/reports/invoices_report.odt") do |r|
      r.add_field :start_date, start_date
      r.add_field :end_date, end_date
      r.add_field :invoice_status, InvoiceStatus.find(invoice_status_id).description

      r.add_table("TABLEINVOICES", invoices, :header=>true) do |t|
        t.add_column(:id, :id)
      end
    end
    report.generate("#{Rails.public_path}/reports/invoices_report_out.odt")
  end

end