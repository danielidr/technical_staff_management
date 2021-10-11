class Order < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :address, optional: true
  belongs_to :user, optional: true
  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  has_one :report, dependent: :destroy

  enum status: ["Asignada", "En el lugar", "Cancelada", "Terminada"]

  ratyrate_rateable "puntuality", "speed", "performance"

  validates :scheduled_at, :comments, :user_id, :client_id, presence: true

end
