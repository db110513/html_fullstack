const http = require('http');


const server = http.createServer((req, res) => {
    
  if (req.method === 'DELETE') {
    
    if (req.url === '/delete-product') {

      // Create some dummy data for products
      let products = [
        { id: 1, name: 'Product A' },
        { id: 2, name: 'Product B' },
        { id: 3, name: 'Product C' },
      ];

      // Parse product ID from the URL
      const productID = parseInt(req.url.split('/')[2]);

      // Find and delete the product with the matching ID
      const updatedProducts = products.filter((product) => product.id !== productID);

      // Replace the old product list with the updated list
      products = updatedProducts;

      // Prepare the response to send back to the client
      // Set the HTTP status code to 200 (OK)
      // Specify that we are sending plain text as the response
      res.writeHead(200, { 'Content-Type': 'text/plain' });

      // Send a success message as the response body
      res.end('Product deleted successfully');
    }
  }
});