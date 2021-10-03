class Order < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :address, optional: true
  belongs_to :user, optional: true
  belongs_to :created_by, :class_name => 'User', optional: true
  has_one :report
end
