class Report < ApplicationRecord
  belongs_to :order
  require 'sendgrid-ruby'
  include SendGrid

  def send_email
    client_email = self.order.client.email
    client_name = self.order.client.first_name
    client_lastname = self.order.client.last_name

    from = Email.new(email: 'danielid132@gmail.com')
    to = Email.new(email: client_email)
    subject = "TechStaff - Reporte de orden #{self.order.id}"
    content = Content.new(type: 'text/plain', value: "Estimado(a) #{client_name} #{client_lastname},\n\nSe envia reporte de la visita efectuada en su domicilio:\n\n\nPruebas Realizadas: #{self.tests_performed}\n\nComentarios: #{self.report_comments}\n\n\nSaludos Cordiales")
    mail = Mail.new(from, subject, to, content)    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts "*******#{response.inspect}"
    puts response.status_code
    puts response.body
    puts response.headers
    
    # Cambia status a terminada
    self.order.update(status: 3)
  end
end
