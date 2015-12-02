class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.confirm!
      user.admin!
    end
    Member.create(user_id: user.id, member_type_id: 3, member_name: 'Rafael', member_last_name: 'Valim', bank_id: 87, cpf: '30081216831')
  end
end
