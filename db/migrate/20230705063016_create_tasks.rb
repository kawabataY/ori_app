class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string     :content,      null: false
      t.integer    :frequency_id, null: false
      t.date       :when,         null: false
      t.references :room,         null: false, foreign_key: true
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
