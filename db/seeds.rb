# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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


User.create(first_name: 'Alexandra', last_name: 'McPhee', email: 'alexandra.mcphee@gmail.com', password: "am1234")
User.create(first_name: 'Andrew', last_name: 'Osman', email: 'andrew.osman@gmail.com', password: "ao1234")
User.create(first_name: 'Carl', last_name: 'Boris', email: 'carl.boris@gmail.com', password: "cb1234")
User.create(first_name: 'Stephanie', last_name: 'Smith', email: 'stephanie.smith@gmail.com', password: "ss1234")


Quote.create(building_type: "Residential", num_apts: 10, num_floors: 10, num_base: 10, product_line: "Premium", num_elev: 1, unit_price: "CA$12,345.00", elev_cost: "CA$12,345.00", install_fee: "CA$1,604.85", total_cost: "CA$13,949.85")
Quote.create(building_type: "Corporate", num_floors: 12, num_base: 5, num_park: 20, num_corps: 2, max_occ: 20, product_line: "Standard", num_elev: 1, unit_price: "CA$7,565.00", elev_cost: "CA$7,565.00", install_fee: "CA$756.50", total_cost: "CA$8,321.50")
Quote.create(building_type: "Hybrid", num_floors: 27, num_park: 18, num_comp: 4, num_base: 3, b_hours: 14, max_occ: 9, product_line: "Excelium", num_elev: 2, unit_price: "CA$15,400", elev_cost: "CA#30,800", install_fee: "CA$4,928.00", total_cost: "CA$35,728.00")
