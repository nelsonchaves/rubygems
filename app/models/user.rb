class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  rolify

  def to_s
    email
  end

  def username
    self.email.split(/@/).first
  end

  has_many :courses

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end

end
