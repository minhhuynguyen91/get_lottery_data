class CreateLotteryNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :lottery_numbers do |t|
      t.string :lottery_no
      t.integer :counter

      t.timestamps
    end
  end
end
