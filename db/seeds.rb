# Using faker, needed import
require "faker"

# Manually created employee users from excel sheet
User.create(first_name: 'Mathieu', last_name: 'Houde', email: 'mathieu.houde@codeboxx.biz', password: "mh1234", password_confirmation: "mh1234")
Employee.create(title: "Captain", user_id: 1)
User.create(first_name: 'Patrick', last_name: 'Thibault', email: 'patrick.thibault@codeboxx.biz', password: "pt1234", password_confirmation: "pt1234")
Employee.create(title: "Engineer", user_id: 2)
User.create(first_name: 'Francis', last_name: 'Patry-Jessop', email: 'francis.patry-jessop@codeboxx.biz', password: "fpj1234", password_confirmation: "fpj1234")
Employee.create(title: "Engineer", user_id: 3)
User.create(first_name: 'Abdul', last_name: 'Akeeb', email: 'abdul.akeeb@codebozz.biz', password: "aa1234", password_confirmation: "aa1234")
Employee.create(title: "Engineer", user_id: 4)
User.create(first_name: 'David', last_name: 'Amyot', email: 'david.amyot@codeboxx.biz', password: "da1234", password_confirmation: "da1234")
Employee.create(title: "Developer", user_id: 5)
User.create(first_name: 'Thomas', last_name: 'Carrier', email: 'thomas.carrier@codeboxx.biz', password: "tc1234", password_confirmation: "tc1234")
Employee.create(title: "Developer", user_id: 6)
User.create(first_name: 'Timothy', last_name: 'Kleinerman', email: 'timothy.wever@codeboxx.biz', password: "tk1234", password_confirmation: "tk1234")
Employee.create(title: "Developer", user_id: 7)
User.create(first_name: 'Kiril', last_name: 'Derilus', email: 'kiril.kleinerman@codeboxx.biz', password: "kd1234", password_confirmation: "kd1234")
Employee.create(title: "Developer", user_id: 8)
User.create(first_name: 'Emmanuela', last_name: 'Houde', email: 'emmanuela.derilus@codeboxx.biz', password: "ed1234", password_confirmation: "ed1234")
Employee.create(title: "Developer", user_id: 9)
User.create(first_name: 'Marie-Ève', last_name: 'Goupil', email: 'marie-eve.goupil@codeboxx.biz', password: "meg1234", password_confirmation: "meg1234")
Employee.create(title: "Developer", user_id: 10)
User.create(first_name: 'Perry', last_name: 'Sawatsky', email: 'perry.sawatsky@codeboxx.biz', password: "ps1234", password_confirmation: "ps1234")
Employee.create(title: "Developer", user_id: 11)

# Manually created simple users
User.create(first_name: 'Alexandra', last_name: 'McPhee', email: 'alexandra.mcphee@gmail.com', password: "am1234")
User.create(first_name: 'Andrew', last_name: 'Osman', email: 'andrew.osman@gmail.com', password: "ao1234")
User.create(first_name: 'Carl', last_name: 'Boris', email: 'carl.boris@gmail.com', password: "cb1234")
User.create(first_name: 'Stephanie', last_name: 'Smith', email: 'stephanie.smith@gmail.com', password: "ss1234")

# Generated simple user 25 times to be used as customers
(16..40).each do |i|
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password")
end

# Manually created quotes
Quote.create(building_type: "Residential", num_apts: 10, num_floors: 10, num_base: 10, product_line: "Premium", num_elev: 1, unit_price: "CA$12,345.00", elev_cost: "CA$12,345.00", install_fee: "CA$1,604.85", total_cost: "CA$13,949.85")
Quote.create(building_type: "Corporate", num_floors: 12, num_base: 5, num_park: 20, num_corps: 2, max_occ: 20, product_line: "Standard", num_elev: 1, unit_price: "CA$7,565.00", elev_cost: "CA$7,565.00", install_fee: "CA$756.50", total_cost: "CA$8,321.50")
Quote.create(building_type: "Hybrid", num_floors: 27, num_park: 18, num_comp: 4, num_base: 3, b_hours: 14, max_occ: 9, product_line: "Excelium", num_elev: 2, unit_price: "CA$15,400", elev_cost: "CA#30,800", install_fee: "CA$4,928.00", total_cost: "CA$35,728.00")
Quote.create(building_type: "Residential", num_floors: 25, num_base: 11, num_apts: 9, num_elev: 2, product_line: "Excelium", unit_price: "CA$15,400.00", elev_cost: "CA$30,800.00", install_fee: "CA$4,928.00", total_cost: "CA$35,728.00")
Quote.create(building_type: "Corporate", num_floors: 81, num_base: 7, num_park: 201, num_corps: 4, max_occ: 431, product_line: "Standard", num_elev: 35, unit_price: "CA$7,565.00", elev_cost: "CA$264,775.00", install_fee: "CA$26,477.50", total_cost: "CA$291,252.50")
Quote.create(building_type: "Hybrid", num_floors: 91, num_base: 4, num_comp: 10, num_park: 30, max_occ: 50, b_hours: 20, product_line: "Standard", num_elev: 5, unit_price: "CA$7,565.00", elev_cost: "CA$37,825.00", install_fee: "CA$3,782.50", total_cost: "CA$3,782.50")
Quote.create(building_type: "Residential", num_floors: 2, num_base: 41, num_apts: 50, num_elev: 5, product_line: "Premium", unit_price: "CA$12,345.00", elev_cost: "CA$61,725.00", install_fee: "CA$8,024.25", total_cost: "CA$69,749.25")
Quote.create(building_type: "Corporate", num_floors: 59, num_base: 28, num_park: 10, num_corps: 9, max_occ: 80, product_line: "Premium", num_elev: 5, unit_price: "CA$12,345.00", elev_cost: "CA$61,725.00", install_fee: "CA$8,024.25", total_cost: "CA$69,749.25")
Quote.create(building_type: "Hybrid", num_floors: 8, num_base: 1, num_comp: 2, num_park: 20, max_occ: 30, b_hours: 16, product_line: "Premium", num_elev: 1, unit_price: "CA$12,345.00", elev_cost: "CA$12,345.00", install_fee: "CA$1,604.85", total_cost: "CA$1,604.85")
Quote.create(building_type: "Residential", num_floors: 164, num_base: 10, num_apts: 1205, num_elev: 18, product_line: "Excelium", unit_price: "CA$15,400.00", elev_cost: "CA$277,200.00", install_fee: "CA$44,352.00", total_cost: "CA$321,552.00")

# Manually created Leads
Lead.create(full_name_of_the_contact: "Alanna Turner", company_name: "Amazon", email: "A_Turner@amazon.com", phone: "(514)208-1689", project_name: "Command Program", project_description: "(in military contexts) having a position of authority.", department_in_charge_of_elevators: "sharp", message: "Hello", attached_file_stored_as_binary: "", date_of_contact_request: "29/08/2015 12:32:23")
Lead.create(full_name_of_the_contact: "Camilla Castillo", company_name: "Google", email: "C_Castillo@gmail.com", phone: "(514)353-1248", project_name: "UglyFox", project_description: "foxes have long snouts and red fur across the face, back, sides, and tail.", department_in_charge_of_elevators: "Beacon", message: "my", attached_file_stored_as_binary: "", date_of_contact_request: "26/03/2006 13:26:02")
Lead.create(full_name_of_the_contact: "Ernest Duran", company_name: "Facebook", email: "E_Duran@facebook.com", phone: "(438)794-2438", project_name: "Peacocks", project_description: "Peacocks are extravagant birds, with iridescent blue necks, and bright green tail feathers dotted with eyespots", department_in_charge_of_elevators: "Dash", message: "name", attached_file_stored_as_binary: "", date_of_contact_request: "29/05/2013 03:07:18")
Lead.create(full_name_of_the_contact: "Gloria Washington", company_name: "IGA", email: "G_Washington@iga.com", phone: "(514)946-4634", project_name: "Rocky Ray", project_description: "American Dream story of Rocky Balboa (Stallone)", department_in_charge_of_elevators: "Flower", message: "is", attached_file_stored_as_binary: "", date_of_contact_request: "15/08/2009 02:12:00")
Lead.create(full_name_of_the_contact: "Janiyah Mcknight", company_name: "Microsoft", email: "J_Mcknight@microsoft.com", phone: "(514)978-3661", project_name: "Tribe", project_description: "taxonomic category that ranks above genus and below family or subfamily", department_in_charge_of_elevators: "Resort", message: "Bryant", attached_file_stored_as_binary: "", date_of_contact_request: "01/07/2016 16:39:37")
Lead.create(full_name_of_the_contact: "Hector Archer", company_name: "Ebay", email: "H_Archer@ebay.com", phone: "(514)458-3397", project_name: "Sunergy", project_description: "the energy generated by the sun and radiated through space", department_in_charge_of_elevators: "Hiatus", message: "and", attached_file_stored_as_binary: "", date_of_contact_request: "14/11/2017 09:40:50")
Lead.create(full_name_of_the_contact: "Noah Hays", company_name: "La Ronde", email: "N_Hays@laronde.ca", phone: "(514)410-5971", project_name: "Early First", project_description: "happening or done before the usual or expected time", department_in_charge_of_elevators: "Panaroma", message: "I'm", attached_file_stored_as_binary: "", date_of_contact_request: "14/08/2001 11:13:00")
Lead.create(full_name_of_the_contact: "Leroy Arroyo", company_name: "La Cosa Nostra", email: "L_Arroyo@lacosanostra.it", phone: "(514)366-2449", project_name: "Uzzin", project_description: "They are one of the largest ethnolinguistic minorities in the Philippines", department_in_charge_of_elevators: "Scape", message: "born", attached_file_stored_as_binary: "", date_of_contact_request: "29/12/1999 21:15:34")
Lead.create(full_name_of_the_contact: "Shayna Flynn", company_name: "Vice", email: "S_Flynn@vice.com", phone: "(514)836-9261", project_name: "Ranzer", project_description: "Follow them on Weibo: @就叫Ranzer ", department_in_charge_of_elevators: "Jewel", message: "in", attached_file_stored_as_binary: "", date_of_contact_request: "16/05/2010 08:15:23")
Lead.create(full_name_of_the_contact: "Whitney Shaffer", company_name: "Youtube", email: "W_Shaffer@youtubeteam.com", phone: "(514)982-3040", project_name: "Colusa", project_description: "Mesonychoteuthis hamiltoni is part of the family Cranchiidae", department_in_charge_of_elevators: "Viva", message: "Guangxi", attached_file_stored_as_binary: "", date_of_contact_request: "29/05/2022 05:15:39")
Lead.create(full_name_of_the_contact: "Edward Mason", company_name: "Charcuterie Richard", email: "E_Mason@charcuterierichard.com", phone: "(514)315-7037", project_name: "WhiteJacks", project_description: "lead singer and guitarist of the duo the White Stripes", department_in_charge_of_elevators: "Frost", message: "it's", attached_file_stored_as_binary: "", date_of_contact_request: "17/09/2000 11:36:40")
Lead.create(full_name_of_the_contact: "Kellen Shea", company_name: "Magna International", email: "K_Shea@MI.ca", phone: "(514)637-6101", project_name: "No-Bull Bootcamp", project_description: "sell performance product that had pseudo-technologies embedded in it", department_in_charge_of_elevators: "Anchor", message: "a southern", attached_file_stored_as_binary: "", date_of_contact_request: "20/06/2005 21:22:02")
Lead.create(full_name_of_the_contact: "Avery Giles", company_name: "Royal Bank of Canada", email: "A_Giles@rbc.ca", phone: "(514)977-9083", project_name: "Prime Eight", project_description: "One player must pocket balls of the group numbered 1 through 7 (solid colors)", department_in_charge_of_elevators: "Glow", message: "chinese", attached_file_stored_as_binary: "", date_of_contact_request: "01/08/1999 09:59:17")
Lead.create(full_name_of_the_contact: "Mattie Welch", company_name: "Norda Stelo", email: "M_Welch@norda.ca", phone: "(514)862-9969", project_name: "DejaVu", project_description: "the fascinating and strange experience where you feel that something is very familiar", department_in_charge_of_elevators: "Diamond", message: "province", attached_file_stored_as_binary: "", date_of_contact_request: "26/11/2015 05:42:53")
Lead.create(full_name_of_the_contact: "Dante Kirby", company_name: "A&W", email: "D_Kirby@aw.ca", phone: "(450)484-6018", project_name: "YoungMarker", project_description: "Young Maker process-focused tinkering learning framework", department_in_charge_of_elevators: "Phantom", message: "known", attached_file_stored_as_binary: "", date_of_contact_request: "30/07/2009 15:50:48")
Lead.create(full_name_of_the_contact: "Paloma Stewart", company_name: "Air Canada", email: "P_Stewart@aircanada.ca", phone: "(514)495-9120", project_name: "WhiteCoast", project_description: "Luxury suites each with a private infinity pool", department_in_charge_of_elevators: "Limit", message: "for", attached_file_stored_as_binary: "", date_of_contact_request: "22/05/2005 19:28:44")
Lead.create(full_name_of_the_contact: "Nikhil Mcclain", company_name: "BC Hydro", email: "N_Mcclain@bchydro.ca", phone: "(450)331-3213", project_name: "Lonesome", project_description: "causing a feeling of loneliness the empty house", department_in_charge_of_elevators: "Presto", message: "their", attached_file_stored_as_binary: "", date_of_contact_request: "29/10/2020 05:02:15")
Lead.create(full_name_of_the_contact: "Juliana Acosta", company_name: "Bell Canada", email: "J_Acosta@bell.ca", phone: "(514)496-5685", project_name: "EverLast", project_description: "To last always or forever; to continue, endure, or remain", department_in_charge_of_elevators: "Expo", message: "most", attached_file_stored_as_binary: "", date_of_contact_request: "25/05/2020 06:52:47")
Lead.create(full_name_of_the_contact: "Nylah Ruiz", company_name: "Bioware", email: "N_Ruiz@bioware.ca", phone: "(514)488-1955", project_name: "Whistler", project_description: "he couldn't tell whether the whistler was moving away from or towards him", department_in_charge_of_elevators: "Steel", message: "beautiful", attached_file_stored_as_binary: "", date_of_contact_request: "09/08/2002 04:20:32")
Lead.create(full_name_of_the_contact: "Amiya Bond", company_name: "Canadian Tire", email: "A_Bond@canadiantire.ca", phone: "(514)601-9915", project_name: "KingFish", project_description: "Salmon is called the king of fish", department_in_charge_of_elevators: "Night", message: "", attached_file_stored_as_binary: "", date_of_contact_request: "08/10/2021 06:53:09")

# Generating 80 leads to have total of 100
department_elevators = ["Residential", "Commercial"] 
80.times {
    Lead.create!(full_name_of_the_contact: Faker::Name.name, company_name: Faker::Company.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, project_name: Faker::FunnyName.two_word_name, project_description: Faker::Company.buzzword, department_in_charge_of_elevators: department_elevators.sample, message: Faker::ChuckNorris.fact, date_of_contact_request: Faker::Date.between(from: '2017-09-23', to: '2022-01-25'))
}

# Generating 75 addresses
statuses = ["active", "inactive"]
types = ["business", "billing", "shipping", "home"]
soa = ["suite", "apartment"]
 
path = File.join(File.dirname(__FILE__), "./seeds/addresses-us-100.json")
records = JSON.parse(File.read(path))
 
(1..75).each do |i|
    address = records["addresses"][i]
    if i >= 0 and i <= 24
        entity = "customer"
    elsif i >= 25 and i <= 98
        entity = "building"
    end
    Address.create!(type_of_address: types.sample, status: statuses.sample, entity: entity, number_and_street: address["address1"], suite_or_apartment: soa.sample, city: address["city"], postal_code: address["postalCode"], country: "United States", notes: Faker::Company.buzzword)
end

# Generating 25 customers connected with generated users
(16..40).each do |i|
    Customer.create!(customer_creation_date: Faker::Date.between(from: '2017-09-23', to: '2022-01-25'), user_id: i, company_name: Faker::Company.name, full_name_of_the_company_contact: Faker::Name.name, company_contact_phone: Faker::PhoneNumber.cell_phone, email_of_the_company_contact: Faker::Internet.safe_email, company_description: Faker::Company.buzzword, full_name_of_service_technical_authority: Faker::Name.name, technical_authority_phone_for_service: Faker::PhoneNumber.phone_number, technical_manager_email_for_service: Faker::Internet.email, address_id: i)
end

# Generating 75 buildings, connected with Customer
(1..75).each do |i|
   name = Faker::Name.name
   name2 = Faker::Name.name
   email = Faker::Internet.email(name: name)
   email2 = Faker::Internet.email(name: name2)
   phone = Faker::PhoneNumber.cell_phone
   phone2 = Faker::PhoneNumber.cell_phone
   customerIDList = (1..25).to_a
   Building.create!(customer_id: customerIDList.sample, full_name_of_the_building_administrator: name, email_of_the_administrator_of_the_building: email,phone_number_of_the_building_administrator: phone, full_name_of_the_technical_contact_for_the_building: name2,technical_contact_email_for_the_building: email2, technical_contact_phone_for_the_building: phone2)
end

# Generating 75 BuildingDetails connected with Cuilding
(1..75).each do |i|
    BuildingDetail.create!(
    information_key: Faker::Construction.material,
    value: Faker::Boolean.boolean,
    building_id: i)
end

# Generating 75 batteries, connected with Building and Employee
(1..75).each do |i|
    employeeIDList = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    Battery.create!(building_id: i, typing: Faker::Company.type, status: ["online","offline"].sample, date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2022-01-25'), date_of_last_inspection: Faker::Date.between(from: '2017-09-23', to: '2022-01-25'), information: Faker::Computer.platform, notes: Faker::Lorem.sentence(word_count: 4), employee_id: employeeIDList.sample)
end

# Generating 150 Columns, connected with battery (average of 2 Columns per Battery)
(1..150).each do |i|
    status = ["on", "off"]
    batteryIdList = (1..75).to_a
    Column.create!(battery_id: batteryIdList.sample, typing: Faker::Company.type, number_of_floors_served: Faker::Number.between(from: 1, to: 100),  status: status.sample, information: Faker::Company.buzzword, notes: Faker::ChuckNorris.fact)
end

# Generating 450 Elevators, connected with Columns (average of 3 Elevators per Column)
(1..450).each do |i|
    typing = ["Residential", "Commercial", "Corporate"]
    model = ["Standard", "Premium", "Excelium"]
    status = ["valid", "invalid"]
    columnIdList = (1..150).to_a
    Elevator.create!(column_id: columnIdList.sample, serial_number: Faker::IDNumber.valid_south_african_id_number, model: model.sample, typing: typing.sample, status: status.sample, date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2022-01-25'), date_of_last_inspection: Faker::Date.between(from: '2017-09-23', to: '2022-01-25'), information: Faker::Company.buzzword, notes: Faker::ChuckNorris.fact)
end
