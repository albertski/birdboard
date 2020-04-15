class CreateActivity < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :project, foreign_key: { on_delete: :cascade }
      t.references :user, foreign_key: { on_delete: :cascade }
      t.string :description
      t.references :subject, polymorphic: true
      t.text :metadata
      t.timestamps
    end
  end
end
