class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  default_scope -> { order('email ASC') }

  def last_login(format=:long)
    last_sign_in_at.present? ? last_sign_in_at.to_s(format) : nil
  end
end
