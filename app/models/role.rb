class Role < ApplicationRecord
    has_many :users, dependent: :destroy
    validates :name, uniqueness: true, presence: true
end
