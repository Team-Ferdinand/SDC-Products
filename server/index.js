const express = require('express');
const app = express();
const port = 3000;

const products = require('./database/models/products.js');

app.use(express.json());

// Intro
app.get('/', (req, res) => {
  res.send('Welcome to "MatchewXD"s products server.\n"/products" returns the first page of 5 products\n"/products/:product_id" returns the product at the id\n"/products/:product_id/styles" returns the styles\n"/products/:product_id/related" returns related product ids');
});

// Products
app.get('/products', (req, res) => {
  products.getProducts(req)
    .then((response) => {
      console.log("products called");
      res.send(response.rows);
    })
    .catch((err) => {
      console.log(err);
    });
});

// Specific Product
app.get('/products/:product_id', (req, res) => {
  products.getProduct(req.params.product_id)
    .then((response) => {
      console.log('Specific Product Recieved');
      res.send(response.rows);
    })
    .catch((err) => {
      console.log(err);
    });
});

// Specific products Style
app.get('/products/:product_id/styles', (req, res) => {
  res.send('Styles');
});

// Specific products related product ids
app.get('/products/:product_id/related', (req, res) => {
  res.send('Related');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});


/**
 * /products
 *   page - integer - Selects the page of results to return. Default 1.
 *   count - integer - Specifies how many results per page to return. Default 5
 * /products/:product_id
 *   product_id - integer - Required ID of the Product requested
 * /products/:product_id/styles
 *   product_id - integer - Required ID of the Product requested
 * /products/:product_id/related
 *   product_id	- integer - Required ID of the Product requested
 */