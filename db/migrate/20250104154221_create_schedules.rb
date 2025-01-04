class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :date_summary, null: false, foreign_key: true
      t.time :time, null: false
      t.string :goal
      t.integer :weather

      t.timestamps
    end
  end
end
