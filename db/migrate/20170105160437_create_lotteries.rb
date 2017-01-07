class CreateLotteries < ActiveRecord::Migration[5.0]
  def change
    create_table :lotteries do |t|
      t.string :result_date
      t.string :result_no

      t.timestamps
    end
  end
end
