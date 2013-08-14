class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :provider

  def administerable_users
    if admin?
      User.where('1 = 1')
    elsif provider_admin?
      User.where(provider_id: provider_id)
    else
      User.where('1 = 0')
    end
  end

  def administerable_providers
    if admin?
      Provider.where('1 = 1')
    elsif provider_admin?
      Provider.where(id: provider_id)
    else
      Provider.where('1 = 0')
    end
  end

  #For ActiveAdmin to be able to display correctly in filters
  def to_s
    email
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  provider_id            :integer
#  admin                  :boolean          default(FALSE)
#  provider_admin         :boolean          default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

