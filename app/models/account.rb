class Account < ActiveRecord::Base
  has_many :transactions

  def basic_balance
    transactions.active
  end

  def cleared_balance
    basic_balance.cleared.sum(:amount)
  end

  def current_balance
    basic_balance.before_today.sum(:amount)
  end

  def future_balance
    basic_balance.sum(:amount)
  end

  def available_credits
    0
  end

  def available_funds
    basic_balance.sum(:amount)
  end


end
