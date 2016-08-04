module ScriptCategoriesHelper

  def get_instace_script_category(script_id)
    sc = ScriptCategory.find_by_script_id(script_id)
    unless sc.nil?
      return sc
    else
      return ScriptCategory.new(script_id: script_id)
    end
  end

end
