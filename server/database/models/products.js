const db = require('../index.js');

module.exports = {
  getProducts: () => {
    return db.pool.query('SELECT * FROM products limit 5');
  },
  getProduct: (id) => {
    // var features =
    // return db.pool.query(`SELECT * FROM features WHERE id_products = ${id}`);
    // Promise.all([features])
    //   .then((response) => {
    //     console.log('Features: ', response);
    //   })
    //   .catch((err) => {
    //     console.log(err);
    //   });
    // console.log('Features: ', features);
    // return product = db.pool.query(`SELECT * FROM products WHERE id = ${id}`);
    return db.pool.query(`SELECT products.id, products.name, products.slogan, products.description, products.category, products.default_price, (SELECT json_agg(json_build_object('features', features.features, 'value', features.value))features FROM features WHERE features.id_products=products.id) FROM products GROUP BY 1 LIMIT 3`);
  }
}
