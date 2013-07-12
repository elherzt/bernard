class Transaction < ActiveRecord::Base
  # pm_types
  # 0 Withdrawal
  # 1 Deposit
  # 2 Transfer
  # 3 
  # 4
  # 5 Dunno but removed it for now
  #

  scope :search, ->(q) { where "payee_name like ? OR uuid = ?", "%#{q}%", q }
  scope :uuid, ->(uuid) { where(uuid:uuid).first }
  scope :active, ->     { where(deleted:false).order('date desc').where('pm_type <> 5').includes(:splits) }
  scope :cleared, ->     { where(cleared:true) }
  scope :before_today, ->     { where('date < ?', Time.now) }
  scope :balance, -> { select('*').select('SUM(amount) OVER (PARTITION BY account_id ORDER BY date ASC) as balance') }

  belongs_to :account
  has_many :splits


  def split?
    @split ||= splits.size > 1
  end

  def category_name
    split? ? '<--Splits-->' : splits.first.category.try(:name)
  end

end
