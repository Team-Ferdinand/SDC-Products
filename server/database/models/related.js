const db = require('../index.js');

module.exports = {
  getRelated: (id) => {
    return db.pool.query(`
      SELECT related_product_id
      FROM related
      WHERE current_product_id= ${id}
      `);
  }
}