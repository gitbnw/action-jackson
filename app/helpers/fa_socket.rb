# module FASocket
#     require 'rubygems'
#     require 'socket.io-client-simple'
#     require 'httparty'

#     # require './FlightXML2Rest.rb'

#     username = 'ByronWeiss'
#     apiKey = 'b2d7d5c11619bb9b652aba27642b6a097f78bbc5'    
#     # require 'savon'
#     #This provides the basis for all future calls to the API


    
#     # SOAP_URL = 'http://flightxml.flightaware.com/soap/FlightXML2/wsdl'
#     # USERNAME = 'sampleuser'
#     # API_KEY = 'abc123abc123abc123abc123abc123abc123'
    
#     # client = Savon::Client.new do
#     #   wsdl.document = SOAP_URL
#     #   http.auth.basic USERNAME, API_KEY
#     # end
    
#     # result = client.request(:enroute) do
#     #   soap.body = {
#     #     :airport => 'KSMO',
#     #     :how_many => 10,
#     #     :filter => '',
#     #     :offset => 0
#     #   }
#     # end
    
#     # flights = result.to_hash[:enroute_results][:enroute_result][:enroute]
    
#     # print "Aircraft en route to KSMO:\n"
#     # flights.each { |flight|
#     #   print "#{flight[:ident]} (#{flight[:aircrafttype]}) \t#{flight[:origin_name]} (#{flight[:origin]})\n"
#     # }
        
#     socket = SocketIO::Client::Simple.connect 'http://flightxml.flightaware.com/json/FlightXML2/MetarEx?airport=KJFK&startTime=0&howMany=1&offset=0', {username: username, apiKey: apiKey}
    
#     socket.on :connect do
#       puts "connect!!!"
#     end 
    
#     socket.on :disconnect do
#       puts "disconnected!!"
#     end
    
#     socket.on :chat do |data|
#       puts "> " + data['msg']
#     end
    
#     socket.on :error do |err|
#       p err
#     end
    
#     puts socket.inspect
    
# end