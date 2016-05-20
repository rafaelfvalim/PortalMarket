module LicensesHelper

  def enableGenerateLicense(r)
    # Regras:
    # Se a key da licença estiver gerada  r.license_key.present?
    # Se esse registro tem mais de 30 dias
    # Se o status da invoice for desistencia (5) Backoff
    return (r.created_at.to_date - Date.today).to_i > 30 || r.license_key.present? || r.invoice.invoice_status_id == 5
  end
end
