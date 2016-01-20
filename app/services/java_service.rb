class JavaService
  require 'open3'

  def cripty_file_job(input_file, output_file)
    params ||= Array.new
    params << "#{Rails.public_path}#{input_file}"
    params << "#{Rails.public_path}#{output_file}"
    return execute_jar(Rails.configuration.jar_encrypt, params)
  end

  def execute_jar(jar_path = Rails.public_path, jar_file, params)
    cmd = " java -jar #{jar_file} #{params.join(' ')}"
    cmdout_read = ''
    cmdout_err = ''
    cmdout_din = ''
    cmdout_wait = ''

    Dir.chdir(jar_path) do
      Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
        cmdout_read = stdout.read
        cmdout_err = stderr.read
        cmdout_din = stdin.read
        cmdout_wait = wait_thr.read
      end
    end
    #return cmdout.gsub(/\n/,'') == 'sucess' ? true : false
    return cmdout_read + cmdout_err + cmdout_din + cmdout_wait
  end

end
