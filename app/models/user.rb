class User < ActiveRecord::Base
  enum role: [:student, :assistant, :teacher, :admin]

  after_initialize  :set_default_role, :if => :new_record?

  def set_default_role
  	self.role ||= :student
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :car, dependent: :destroy
end
