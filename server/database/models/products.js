const db = require('../index.js');

module.exports = {
  getProducts: (req) => {
    var page = req.query.page - 1 || 0;
    var count = req.query.count || 5;
    var start = page * count;

    return db.pool.query(`SELECT * FROM products WHERE id > ${start} limit ${count}`);
  },

  getProduct: (id) => {
    return db.pool.query(`SELECT products.id, products.name, products.slogan, products.description, products.category, products.default_price, (SELECT json_agg(json_build_object('features', features.features, 'value', features.value))features FROM features WHERE features.id_products=products.id) FROM products WHERE products.id = ${id} GROUP BY 1 `);
  }
}



{
  "id_products": 3,
    "results": [
      {
        "style_id": 11,
        "name": "Black",
        "original_price": 40,
        "sale_price": "null",
        "default": "1",
        "photos": [{}, {}],
        "skus": {
              {},
      {}
            }
          },
{
  "style_id": 11,
    "name": "Black",
      "original_price": 40,
        "sale_price": "null",
          "default": "1",
            "photos": [{}, {}],
              "skus": {
    { },
    { }
  }
}

  ]
}