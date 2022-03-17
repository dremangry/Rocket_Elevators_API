require 'pg'

desc "Create data warehouse for facts."

namespace :warehouse do
    
    task :create_quoteFact, [:db_name] do |task, args|
        puts "connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        conn.exec("CREATE TABLE IF NOT EXISTS quote_fact (
            id SERIAL PRIMARY KEY,
            company_name VARCHAR(50) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            num_elev INTEGER NOT NULL,
            created_at TIMESTAMP NOT NULL
        )");
        puts "...quote_fact table created"
    end

    task :import_quoteFact, [:db_name] => :environment do |task, args|        
        puts "Connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        Quote.where("extract(year from created_at)" => 2019..2022) do |quote|

            quote.company_name.sub! '\'', '"'

            conn.exec("INSERT INTO quote_fact (id, company_name, email, num_elev, created_at) VALUES ('#{quote.id}', '#{quote.company_name}', '#{quote.email}', '#{quote.num_elev}', '#{quote.created_at}')")
        end
        puts "...quote form data saved to data warehouse at table: quote_fact."
    end

    ########################################################################
    ########################################################################

    task :create_contactFact, [:db_name] do |task, args|
        puts "connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        conn.exec("CREATE TABLE IF NOT EXISTS contact_fact (
            id SERIAL PRIMARY KEY,
            company_name VARCHAR(50) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            project_name VARCHAR(255) NOT NULL,
            created_at TIMESTAMP NOT NULL
        )");
        puts "...contact_fact table created."
    end

    task :import_contactFact, [:db_name] => :environment do |task, args|        
        puts "Connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        Lead.where("extract(year from created_at)" => 2019..2022) do |lead|

            lead.company_name.sub! '\'', '"'
            lead.project_name.sub! '\'', '"'

            conn.exec("INSERT INTO contact_fact (id, company_name, email, project_name, created_at) VALUES ('#{lead.id}', '#{lead.company_name}', '#{lead.email}', '#{lead.project_name}', '#{lead.created_at}')")
        end  
        puts "...lead form data saved to data warehouse at table: contact_fact."
    end

    ########################################################################
    ########################################################################

    task :create_elevFact, [:db_name] do |task, args|
        puts "connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        conn.exec("CREATE TABLE IF NOT EXISTS elevator_fact (
            id SERIAL PRIMARY KEY,
            serial_number VARCHAR(255) NOT NULL,
            commission_date TIMESTAMP NOT NULL,
            building_id INTEGER NOT NULL,
            customer_id INTEGER NOT NULL,
            building_city VARCHAR(50) NOT NULL
        )")
    end

    task :import_elevFact, [:db_name] => :environment do |task, args|        
        puts "Connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        Elevator.where("extract(year from created_at)" => 2019..2022) do |elevator|
            
            # elevator_id > column_id > battery_id > building_id > customer_id 
            building_id = Battery.find(Column.find(elevator.column_id).battery_id).building_id
            # customer_id
            customer_id = Building.find(building_id).customer_id
            
            conn.exec("INSERT INTO elevator_fact (id, serial_number, commission_date, building_id, customer_id, building_city) VALUES ('#{elevator.id}', '#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{building_id}', '#{customer_id}', '#{Address.find(Building.find(building_id).address_id).city}')")

        end
        puts "...elevator data saved to data warehouse at table: elevator_fact."
    end

    ########################################################################
    ########################################################################

    task :create_dimCustomer, [:db_name] do |task, args|
        puts "connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        conn.exec("CREATE TABLE IF NOT EXISTS dim_customer (
            id SERIAL PRIMARY KEY,
            customer_creation_date TIMESTAMP NOT NULL,
            company_name VARCHAR(50) NOT NULL,
            contact_full_name VARCHAR(255) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            num_elev INTEGER NOT NULL,
            city VARCHAR(50) NOT NULL
        )");
        puts "...dim_customer table created"
    end

    task :import_dimCustomer, [:db_name] => :environment do |task, args|        
        puts "Connected to #{args[:db_name]}"
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")

        Customer.where("extract(year from created_at)" => 2019..2022) do |customer|

            num_elev = 0

            Elevator.all.each do |elevator|
                if Building.find(Battery.find(Column.find(elevator.column_id).battery_id).building_id).customer_id == customer.id
                    num_elev += 1
                end
            end

            customer.company_name.sub! '\'', '"'
            customer.full_name_of_the_company_contact.sub! '\'', '"'

            conn.exec("INSERT INTO dim_customer (id, customer_creation_date, company_name, contact_full_name, email, city, num_elev) VALUES ('#{customer.id}', '#{customer.customer_creation_date}', '#{customer.company_name}', '#{customer.full_name_of_the_company_contact}', '#{customer.email_of_the_company_contact}', '#{num_elev}', '#{Address.find(customer.address_id).city}')")

        end

        puts "...customer data saved to data warehouse ."
    end

end

namespace :query do 

    task :one, [:db_name] => :environment do |task, args|
        # The number of unique requests (ContactId) grouped by Month (Creation Date)
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        conn.exec("SELECT COUNT(id) as total_contact, date_trunc('month', created_at) as month FROM contact_fact GROUP BY date_trunc('month', created_at) ORDER BY date_trunc('month', created_at)")
        
    end

    task :two, [:db_name] => :environment do |task, args|
        # The number of unique requests (QuoteId) grouped by Month (Creation Date)
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        conn.exec("SELECT COUNT(id) as total_quote, date_trunc('month', created_at) as month FROM quote_fact GROUP BY date_trunc('month', created_at) ORDER BY date_trunc('month', created_at)")
    end

    task :three do
        # The number of elevators (ElevatorId) contained in the buildings belonging to each customer
        conn = PG::Connection.open(:dbname => "#{args[:db_name]}")
        conn.exec("SELECT num_elev, id FROM dim_customer")

    end

end