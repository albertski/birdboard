require 'digest/md5'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_and_belongs_to_many :projects_as_member,
                          class_name: 'Project',
                          join_table: "members_projects",
                          foreign_key: "users_id",
                          association_foreign_key: "projects_id"

  scope :with_email, ->(email) { where("email = ?", email) }

  def get_md5_email
    Digest::MD5.hexdigest(self.email)
  end

end
