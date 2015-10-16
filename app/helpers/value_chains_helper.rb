module ValueChainsHelper

  def get_breadcrumb_value_chain(id)
    breadcrumb ||= Array.new
    ProcessModule.where(id: id).each do |pp1|
      next_id = pp1.referrer_process_module_id
      breadcrumb.push(pp1.description)
      loop do
        break if next_id.nil? || next_id == ''
        ProcessModule.where(id: next_id).each do |pp2|
          breadcrumb.push(pp2.description)
          next_id = pp2.referrer_process_module_id
        end
      end
    end
    return breadcrumb.reverse
  end

  def show_process_chain(script_id)
    value_chains = ValueChain.where(script_id: script_id)
    process_modules ||= Array.new
    value_chains.each do |v|
      if  ProcessModule.find_by_referrer_process_module_id(v.process_module_id).nil?
        process_modules.push(get_breadcrumb_value_chain(v.process_module_id))
      end
    end
    return process_modules
  end

end
