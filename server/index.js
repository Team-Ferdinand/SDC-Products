const express = require('express');
const app = express();
const port = 3000;

const products = require('./database/models/products.js');
const styles = require('./database/models/styles.js');
const related = require('./database/models/related.js');

app.use(express.json());

// Intro
app.get('/', (req, res) => {
  res.send('Welcome to "MatchewXD"s products server!\n\n"/products" returns the first page of 5 products\n Paramaters: Page - Integer, Count - Integer\n\n"/products/:product_id" returns the specific product at the id\n\n"/products/:product_id/styles" returns the styles at the specific product id\n\n"/products/:product_id/related" returns related product ids at the specific product id');
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
      res.send(response.rows[0]);
    })
    .catch((err) => {
      console.log(err);
    });
});

// Specific products Style
app.get('/products/:product_id/styles', (req, res) => {
  styles.getStyles(req.params.product_id)
    .then((response) => {
      console.log('Styles Recieved');
      res.send(response.rows[0]);
    })
    .catch((err) => {
      console.log(err);
    });
});

// Specific products related product ids
app.get('/products/:product_id/related', (req, res) => {
  related.getRelated(req.params.product_id)
    .then((response) => {
      var related = [];
      for (var i = 0; i < response.rows.length; i++) {
        related.push(response.rows[i].related_product_id);
      }
      res.send(related);
    })
    .catch((err) => {
      console.log(err);
    });
  // res.send('Related');
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

/*
  app.get('/loaderio-c90af57952b107908dae5806ba5ce5cc', (req, res) => {
  res.send('loaderio-c90af57952b107908dae5806ba5ce5cc');
});

 */