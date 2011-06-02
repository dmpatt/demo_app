

if ENV['MONGOHQ_URL']
	MongoMapper.config = {RAILS_ENV => {'uri' => ENV['MONGOHQ_URL']}}
	MongoMapper.connect(RAILS_ENV)
	MongoMapper.database = "demo_app-#{Rails.env}"
else
	MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
	MongoMapper.database = "demo_app-#{Rails.env}"

	if defined?(PhusionPassenger)
		PhusionPassenger.on_event(:starting_worker_process) do |forked|
			MongoMapper.connection.connect if forked
		end
	end	
  
end

