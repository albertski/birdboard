class CreateMembersProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :members_projects, id: false do |t|
      t.belongs_to :projects
      t.belongs_to :users
    end
  end
end
