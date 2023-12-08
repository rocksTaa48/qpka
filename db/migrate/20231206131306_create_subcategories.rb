class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table(:subcategories) do |t|
      t.string(:title, null: false, default: "")
      t.string(:description, default: "")
      t.belongs_to(:category, null: false, index: true, foreign_key: true)
      t.timestamps
    end
  end
end
