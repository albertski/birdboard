class AddNotesToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :notes, :string
  end
end
