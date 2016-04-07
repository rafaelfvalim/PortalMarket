class JavaService
  require 'open3'

  def cripty_file_job(input_file, output_file, system_number)
    params ||= Array.new
    params << "#{Rails.public_path}#{input_file}"
    params << "#{Rails.public_path}#{output_file}"
    params << system_number
    return execute_jar(Rails.configuration.jar_encrypt, params)
  end

  def execute_jar(jar_path = Rails.public_path, jar_file, params)
    p "===========================START SERVICE JAVA LOG==============================="
    p "LOCAL: #{jar_path}"
    p "PROGRAM: #{jar_file}"
    params.each { |e| p "PARAMS :#{e.to_s}" }
    cmd = "java -jar #{jar_file} #{params.join(' ')}"
    cmdout_read = ''
    Dir.chdir(jar_path) do
      Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
        cmdout_read = stdout.read
      end
    end
    p "OUTPUT: #{cmdout_read}"
    #return cmdout.gsub(/\n/,'') == 'sucess' ? true : false
    p "===========================END SERVICE JAVA LOG================================="
    return cmdout_read

  end

end
