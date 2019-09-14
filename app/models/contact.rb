class Contact < ActiveRecord::Base
  # one of the forms of validation, see rails guide for more info...
  validates :email, presence: true
  validates :name, presence: true
end