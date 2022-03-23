class Building < ApplicationRecord
  belongs_to :customer
  has_many :batteries

  def self.map_data
    data = {}
    Building.all.each do |building|
      coord_hash = coords(building)
      info_template = info_html(building)
      data[building.id] = {info: info_template, coordinates: coord_hash}
    end
    return data
  end 

end

def hash_addresses
  path = File.join(Rails.application.root, "/db/seeds/addresses-us-250.json")
  records = JSON.parse(File.read(path))
  addresses_list = records["addresses"]
  address_hash = {}
  addresses_list.each do |address|
    address_hash[address["address1"]] = {lat: address["coordinates"]["lat"], lng: address["coordinates"]["lng"]}
  end
  return address_hash
end

def coords(building)
  address_hash = hash_addresses()
  address = Address.find(building.address_id)
  lat = address_hash[address.number_and_street][:lat]
  lng = address_hash[address.number_and_street][:lng]
  return {lat: lat, lng: lng}
end 

def info_html(building)  
  address = Address.find(building.address_id)
  battery_ids = Battery.where(building_id: building.id).ids
  column_ids = Column.where(battery_id: battery_ids).ids
  elevator_ids = Elevator.where(column_id: column_ids).ids
  user = User.find(Customer.find(building.customer_id).user_id)

  
  location = "#{address.number_and_street}, #{address.city}, #{address.state}"
  client_name = "#{user.first_name} #{user.last_name}"
  battery_info = "#{battery_ids.count} Battries"
  # floor_info = "#{building.num_floors} Floors"
  col_info = "#{column_ids.count} Columns"
  elev_info = "#{elevator_ids.count} Elevators"
  tech_info = "Technical Contact Name: #{building.full_name_of_the_technical_contact_for_the_building}"

  info = '<div id="content">' +
            '<div id="siteNotice"></div>' + 
            "<h3 id='firstHeading' class='firstHeading'>Client: #{client_name}</h3>" +
            "<h4>Location: #{location}</h4>"+
            '<div id="bodyContent">' +
              "<p> Building Information: </p>" +
              "<ul>"+
                # "<li> #{floor_info} </li>" +
                "<li> #{battery_info} </li>" +
                "<li> #{col_info} </li>" +
                "<li> #{elev_info} </li>" +
                "<li> #{tech_info} </li>" +
              "</ul>" +
            "</div>" +
          "</div>"
  
  return info
end
