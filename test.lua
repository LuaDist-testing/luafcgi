-- FastCGI Test Program

require 'fcgi'

-- The unix module is needed for a Unix dup2 function, replace it with
-- luaposix if you want.

require 'unix'

-- Create a local socket, make sure the FastCGI enable webserver
-- has r/w access to it, might need a chmod call here

socket = fcgi.openSocket('/tmp/.s.luafcgi', 4)

-- Now dup2 the socket to filedes 0, stdin, so the FastCGI library can
-- use it (need to find a better way to specify the socket, though...)
unix.dup2(socket, 0)

-- Accept requests in a loop
while fcgi.accept() == 0 do
	print('Incoming FastCGI request')
	len = fcgi.getParam('CONTENT_LENGTH')
	if len ~= nil then
		print('CONTENT_LENGTH: ' .. len)
	end
	print('URI: ' .. fcgi.getParam('REQUEST_URI'))

	-- Send some HTML to the client
	fcgi.putStr('Content-Type: text/html\n\n')
	fcgi.putStr('<h1>Hello from Lua</h1>')

	-- finish this request
	fcgi.finish()
end
print('ending')
