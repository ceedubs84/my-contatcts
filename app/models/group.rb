class Group < ApplicationRecord
  has_many :contacts, through: :group_contacts
end
