class Contact < ApplicationRecord
  belongs_to :user
  
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def friendly_updated_at
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japan_phone_number
    "+81 #{phone}"
  end

  def self.all_johns
    Contact.where(first_name: "John")
  end
end