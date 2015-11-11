module SystemsHelper
  def get_system_id_by_name(name)
    @system = System.where("lower(name) = ?", name.downcase).first
    return @system.id
  end
end
