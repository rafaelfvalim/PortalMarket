module BanksHelper

  def all_banks
    Bank.where(" description != 'SEM BANCO'")
  end
end
