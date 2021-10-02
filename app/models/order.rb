class Order < ApplicationRecord
  belongs_to :client
  belongs_to :address
  belongs_to :user
  belongs_to :created_by, :class_name => 'User'
end
