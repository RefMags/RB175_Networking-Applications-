require "socket" # create server and application

server = TCPServer.new("localhost", 3003) # creating a TCPServer to connect 2 computers
# "localhost"; creating server on local host and port is 3003 which is which service
# is used to connect.
loop do
  # waits until someone request from the server,  returned from server
  client = server.accept

  # get the first request
  # program prints to console
  request_line = client.gets
  next if !request_line || request_line =~ /favicon/ # prevents assignment request
  puts request_line # prints to console

  # client.puts request_line
  # and send back to client to display on browser
  client.puts "HTTP/1.1 200 OK\r\n\r\n"
  client.puts rand(6) + 1
  # client.puts "Content-Type: text/plain\r\n\r\n"
  client.close
end
