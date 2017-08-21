class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :collaborators
  has_many :wikis, through: :collaborators

  validates :role, inclusion: {in: %w(standard premium admin)}

  enum role: [:standard, :admin, :premium]
end
