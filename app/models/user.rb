class User < ApplicationRecord
  enum role: [:usuario, :professor, :secretaria, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :usuario
  end
  
  def role? (role_user)
    self.role == role_user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
