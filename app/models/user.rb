class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_one :role_user, :dependent => :destroy
  has_many :customers

  has_many :employee, :class_name => 'User',  :foreign_key => 'manager_id'

  belongs_to :manager, :class_name => 'User'

  validates_presence_of :role_id
  # accepts_nested_attributes_for :role
  validates_uniqueness_of :email, :case_sensitive => false
  # validates_existence_of :category 
  # validate :has_role #, :on => :create


  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role_id
  # attr_accessible :title, :body

  def has_role
    errors.add(:role, "Not specified Specify- #{self.role_user.blank? }") if self.role_user.blank?
  end

end
