class CreateMembersService
  def call(user)
    Member.create(user_id: user.id, master_user_id: nil, member_type_id: 3, member_name: 'Klustter', member_last_name: 'Store', bank_id: 87, cpf: '30081216831')
  end
end
