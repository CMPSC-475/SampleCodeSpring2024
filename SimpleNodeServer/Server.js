// Importing the 'http' module
const http = require('http');
const sample = require('./Person');

// Define the port number
const PORT = 3000;

// Creating the server
const server = http.createServer((req, res) => {
  // Set the response header
  res.writeHead(200, {'Content-Type': 'text/plain'});
  
  // create a person
  var person = new sample.Person("Alice", 30);
  
  // Write a response to the client
  res.end(person.greet())
  
});

// Start the server and listen on the defined port
server.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
});

