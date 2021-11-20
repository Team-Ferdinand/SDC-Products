const { Pool } = require('pg');
const db = require('../../potato/config.js');

const pool = new Pool(db.CONFIG);

pool.connect(() => {
  console.log('Database Connected');
});

module.exports.pool = pool;