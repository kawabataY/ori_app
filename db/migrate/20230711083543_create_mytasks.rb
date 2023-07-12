class CreateMytasks < ActiveRecord::Migration[6.0]
  def change
    create_table :mytasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.timestamps
    end
  end
end
