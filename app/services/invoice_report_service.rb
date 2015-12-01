class InvoiceReportService


  def report_invoice_per_date(start_date, end_date, invoice_status_id)
    invoices = Invoice.where('DATE(created_at) >= ? and DATE(created_at) <= ? and invoice_status_id = ?', start_date, end_date, invoice_status_id)

    report = ODFReport::Report.new("#{Rails.public_path}/reports/invoices_report.odt") do |r|
      r.add_field :start_date, start_date
      r.add_field :end_date, end_date
      r.add_field :invoice_status, InvoiceStatus.find(invoice_status_id).description

      r.add_table("TABLEINVOICES", invoices, :header => true) do |t|
        t.add_column(:id, :id)
        t.add_column(:user) { |u| u.user.full_name }
        t.add_column(:script_code, :script_id)
        t.add_column(:value, :value)
        t.add_column(:script_file, :script_file)
        t.add_column(:shipped_to, :shipped_to)
        t.add_column(:date, :created_at)
        t.add_column(:pay_method) { |p| p.pay_method.name }
      end
    end
    report
  end

end