AdminUser.create!(email: 'admin@techstaff.com', password: 'tech1234', password_confirmation: 'tech1234') if Rails.env.development?

Role.create!(name: 'Coordinador')
Role.create!(name: 'Técnico')
coord = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    role_id: 1
)

30.times do
    address = Address.create!(full_address: Faker::Address.full_address)
    Client.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        rut: Faker::ChileRut.full_rut,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        address_id: address.id
    )
end

5.times do
    technician = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 6),
        role_id: 2
    )
    3.times do 
        Order.create(
            scheduled_at: Faker::Time.forward(days: 15, period: :morning),
            comments: Faker::Lorem.paragraph,
            user_id: technician.id,
            created_by_id: coord,
            client_id: rand(1..30)
        )
    end
end