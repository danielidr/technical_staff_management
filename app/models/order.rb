class Order < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :address, optional: true
  belongs_to :user, optional: true
  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id", optional: true
  has_one :report, dependent: :destroy

  enum status: ["Creada", "Asignada", "En el lugar", "Terminada"]

  ratyrate_rateable "puntuality", "speed", "performance"

end
