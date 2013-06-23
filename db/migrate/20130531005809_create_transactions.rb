class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.boolean :pm_deleted
      t.integer :pm_timestamp
      t.integer :pm_type
      t.integer :pm_date
      t.boolean :pm_cleared
      t.integer :pm_account_id
      t.text    :pm_payee
      t.text    :pm_check_number
      t.decimal :pm_sub_total, :precision => 10, :scale => 2
      t.text    :pm_of_x_id
      t.binary  :pm_image
      t.text    :pm_server_id
      t.text    :pm_overdraft_id

      t.integer :account_id
      t.boolean :deleted
      t.text    :check_number
      t.text    :payee_name
      t.integer :payee_id
      t.integer :category_id
      t.integer :department_id
      t.text    :memo
      t.decimal :amount
      t.boolean :cleared
      t.string :currency_id
      t.decimal :currency_exchange_rate, :precision => 10, :scale => 2
      t.decimal :balance, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
