class ReportsController < ApplicationController

  def index
  end

  def net_worth
    @report = Transaction.select(:pm_type, :amount).where(pm_type: [0, 1]).group(:pm_type).sum(:amount)
    respond_to do |format|
      format.html
      format.json { render json: net_worth_json }
    end
  end

  def net_worth_json
    {
      labels: @report.keys,
      datasets: [
        {
          fillColor: "rgba(225, 0, 0, 0.5)",
          strokeColor: "rgba(220, 220, 220, 1)",
          data: @report.values
        }
      ]
    }
  end

  def income_v_expense
    @report = Transaction.all.group(:pm_type).sum(:amount) 
    respond_to do |format|
      format.html
      format.json { render json: income_v_expense_json }
    end
  end

  def income_v_expense_json
    {
      labels: @report.keys,
      datasets: [
        {
          fillColor: "rgba(225, 0, 0, 0.5)",
          strokeColor: "rgba(220, 220, 220, 1)",
          data: @report.values
        }
      ]
    }
  end

  def spending_by_payee
  end

  def spending_by_category
  end
end
