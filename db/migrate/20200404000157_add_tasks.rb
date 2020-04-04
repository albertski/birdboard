class AddTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :body
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
