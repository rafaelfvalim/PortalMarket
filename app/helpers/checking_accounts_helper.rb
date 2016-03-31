module CheckingAccountsHelper

  def get_status_checking_account_by_profile(status)
    if current_user.is_master_user_id?
      # Retorna todas as mihas e as dos meus funcionarios
      return CheckingAccount.joins(:invoice, :member).where('checking_accounts.status = ? and invoices.user_id = ? or members.master_user_id = ?', status, current_user.id, current_user.id).count
    else
      # Retorna apenas as minhas
      return CheckingAccount.joins(:invoice).where('status = ? and invoices.user_id = ?', status, current_user.id).count
    end
  end


  def dash_checking_account_panel_color(status)
    case status
      when 'Aguardando Pagamento' then
        'red-bg'
      when 'Pago e Consumido' then
        'lazur-bg'
      when 'Pago Aguardando Consumo' then
        'navy-bg'
      when 'Aguardando Consumo' then
        'yellow-bg'
      when 'Bloqueado' then
        'orange-bg'
      when 'Analise de Consumo' then
        'navy-bg'
      when 'Em Processamento' then
        'lazur-bg'
      when 'Pago' then
        'red-bg'
      when 'Desistência' then
        'lazur-bg'
    end
  end

  def dash_checking_account_icon(status)
    case status
      when 'Aguardando Pagamento' then
        'typcn typcn-credit-card typcn-4x typcn-dash'
      when 'Pago e Consumido' then
        'typcn typcn-credit-card typcn-4x typcn-dash'
      when 'Pago Aguardando Consumo' then
        'typcn typcn-credit-card typcn-4x typcn-dash'
      when 'Aguardando Consumo' then
        'typcn typcn-watch typcn-4x typcn-dash'
      when 'Bloqueado' then
        'typcn typcn-lock-closed typcn-4x typcn-dash'
      when 'Analise de Consumo' then
        'typcn typcn-time typcn-4x typcn-dash'
      when 'Em Processamento' then
        'typcn typcn-cog-outline typcn-4x typcn-dash'
      when 'Pago' then
        'typcn typcn-input-checked-outline typcn-4x typcn-dash'
      when 'Desistência' then
        'typcn typcn-thumbs-down typcn-4x typcn-dash'
    end
  end
end
