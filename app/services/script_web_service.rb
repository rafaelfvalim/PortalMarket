class ScriptWebService
  require 'base64'
  require 'fileutils'

  def generate_file_script(invoice)
    nome_arquivo = File.basename(invoice.script.script_file.to_s)
    arquivo = File.read("#{Rails.public_path}#{invoice.script.script_file.to_s}")
    numero_sap = invoice.workplace.system_number
    url = Rails.configuration.webservice_generate_file
    client = Savon.client(wsdl: url)
    client.operations
    response = client.call(:gerar_script, message: {nome_arquivo: nome_arquivo, arquivo_bytes: Base64.encode64(arquivo), numero_SAP: numero_sap})
    script_file_generated_name = "#{File.basename(invoice.script_file.gsub(/.edy/, "_#{Time.now.strftime("%Y%m%d%H%M%S")}.edy"))}"
    if response.success?
      path_dest = "#{Rails.public_path}#{invoice.invoice_script_path}"
      FileUtils.mkdir_p(path_dest) unless File.exists?(path_dest)
      binary_data = Base64.decode64(response.body[:gerar_script_response][:gerar_script_return])
      File.open("#{path_dest}#{invoice.script_file}", "wb") { |f| f.write(binary_data) }
    end
  rescue Savon::SOAPFault => error
    fault_code = error.to_hash[:fault][:faultcode]
    p '>>>>>>> start webservice generate script'
    p fault_code
    p '>>>>>>> send webservice generate script'
  end

  def generate_key_script(invoice)
    nome_arquivo = File.basename(invoice.invoice_script_url.to_s)
    aquivo = File.read("#{Rails.public_path}#{invoice.invoice_script_url.to_s}")
    url = Rails.configuration.webservice_generate_key
    client = Savon.client(wsdl: url)
    client.operations
    response = client.call(:gerar_key, message: {nome_arquivo: nome_arquivo, arquivo_bytes: Base64.encode64(aquivo)})
    if response.success?
      return response.body[:gerar_key_response][:gerar_key_return]
    end
  rescue Savon::SOAPFault => error
    fault_code = error.to_hash[:fault][:faultcode]
    p '>>>>>>> start webservice generate key'
    p fault_code
    p '>>>>>>> send webservice generate key'
  end
end