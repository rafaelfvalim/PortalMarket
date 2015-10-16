module ValueChainsHelper

  def get_breadcrumb_value_chain(id)
    breadcrumb ||= Array.new
    ProcessModule.where(id: id).each do |pp1|
      next_id = pp1.referrer_process_module_id
      breadcrumb.push(pp1.description)
      p "pp1 #{pp1.description}"
      loop do
        break if next_id.nil? || next_id == ''
        ProcessModule.where(id: next_id).each do |pp2|
          breadcrumb.push(pp2.description)
          next_id = pp2.referrer_process_module_id
          p "pp2 #{pp2.description}"
        end
      end
    end
    return breadcrumb
  end

  def show_process_chain(script_id)
    values_chains = ValueChain.where(script_id: script_id)
    process_modules ||= Array.new
    values_chains.each do |value_chain|
      breadcrumb = get_breadcrumb_value_chain(value_chain.process_module_id)

      breadcrumb.each do |b|
        process_modules.push(b) unless process_modules.include?(b)
      end

    end
    p process_modules
  end

end
