class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.integer :time_interval, null: false, default: 60 # デフォルトは1時間
      t.time :start_time, null: false, default: "10:00"
      t.time :end_time, null: false, default: "18:00"

      t.timestamps
    end
  end
end
