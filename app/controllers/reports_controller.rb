class ReportsController < ApplicationController
  def index
  end

  def net_worth
  end

  def income_v_expense
    @transactions = Transaction.get_income_outcome
    
    respond_to do |format|
      format.json { render json: { :labels => format_data(:income),
                                   :datasets => [ 
                                                 { :data => format_data(:income)},
                                                 { :data => format_data(:outcome)}
                                                ]  } }
    end
  end

  def spending_by_payee
  end

  def spending_by_category
  end

  private

  def format_data(data)
    @transactions.map(&data)
  end
end
