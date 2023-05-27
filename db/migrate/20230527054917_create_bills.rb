class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.string :icon
      t.references :author, null: false, foreign_key: { to_table: :users }
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
