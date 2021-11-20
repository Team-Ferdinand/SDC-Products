const db = require('../index.js');

module.exports = {
  getStyles: (id) => {
    return db.pool.query(`SELECT id_products, (SELECT json_agg(json_build_object('style_id', styles.id, 'name', styles.name, 'original_price', styles.original_price, 'sale_price', styles.sale_price, 'default', styles.default_style, 'photos',(SELECT json_agg(json_build_object('thumbnail_url', photos.thumbnail_url, 'url', photos.url))photos FROM photos WHERE styleid=styles.id), 'skus', (SELECT json_object_agg(skus.id, json_build_object('quantity', skus.quantity, 'size', skus.size))skus FROM skus WHERE styleid=styles.id)))results FROM styles WHERE id_products=${id}) FROM styles WHERE id_products = ${id}`);
  },
  test: (id) => {
    return db.pool.query(`
      SELECT id_products, (SELECT json_object_agg(
        skus.id, json_build_object(
          'quantity', skus.quantity,
          'size', skus.size
        )
      )skus
    FROM skus WHERE styleid = styles.id) FROM styles WHERE id_products = 37311
      `)
  }
}
//