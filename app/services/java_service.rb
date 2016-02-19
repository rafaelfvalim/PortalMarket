class JavaService
  require 'open3'

  def cripty_file_job(input_file, output_file, system_number)
    params ||= Array.new
    params << "#{Rails.public_path}#{input_file}"
    params << "#{Rails.public_path}#{output_file}"
    params << system_number

    Rails.logger.info input_file
    Rails.logger.info output_file
    Rails.logger.info system_number
    return execute_jar(Rails.configuration.jar_encrypt, params)
  end

  def execute_jar(jar_path = Rails.public_path, jar_file, params)
    cmd = "java -jar #{jar_file} #{params.join(' ')}"
    cmdout_read = ''

    Dir.chdir(jar_path) do
      Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
        cmdout_read = stdout.read
      end
    end
    #return cmdout.gsub(/\n/,'') == 'sucess' ? true : false
    return cmdout_read
  end

end
