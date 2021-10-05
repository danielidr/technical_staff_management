class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :orders

  def coord?
    role.name == "Coordinador"
  end

  def tech?
    role.name == 'Técnico'
  end
end
