class CreateDateSummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :date_summaries do |t|
      t.date :date, null: false
      t.decimal :complete_rate, precision: 5, scale: 2, default: 0.0
      t.text :memo
      t.timestamps
    end
  end
end
