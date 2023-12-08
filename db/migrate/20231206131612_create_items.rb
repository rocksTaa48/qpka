class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table(:items) do |t|
      t.string(:name, null: false, default: "")
      t.string(:description, default: "")
      t.decimal(:price, precision: 8, scale: 3, null: false)
      t.integer(:quantity, null: false, default: 1)
      t.string(:aasm_state, null: false, default: "")
      t.string(:value, null: false, default: "")
      t.belongs_to(:subcategory, null: false, index: true, foreign_key: true)
      t.integer(:auc_length, null: false, default: 7)

      t.timestamps
    end
  end
end
