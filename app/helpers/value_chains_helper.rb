module ValueChainsHelper

  def get_breadcrumb_value_chain(process_module_id)
    show = ''
    ProcessModule.where('id = ? ', process_module_id).each do |pp1|
      breadcrumb ||= Array.new
      next_reference = pp1.referrer_process_module_id
      breadcrumb.push(pp1.description)
      loop do
        break if next_reference.nil? || next_reference == ''
        ProcessModule.where('id = ? ', next_reference).each do |pp2|
          breadcrumb.push(pp2.description)
          next_reference = pp2.referrer_process_module_id
        end
      end
      show = breadcrumb.reverse.to_sentence
      breadcrumb.clear
    end
    return show
  end

end
