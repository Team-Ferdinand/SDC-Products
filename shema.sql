DROP TABLE IF EXISTS "products" CASCADE;

CREATE TABLE "products" (
  "id" SERIAL NOT NULL,
  "name" VARCHAR(99) DEFAULT NULL,
  "slogan" VARCHAR(999) DEFAULT NULL,
  "description" VARCHAR(999) DEFAULT NULL,
  "category" VARCHAR(99) DEFAULT NULL,
  "default_price" INTEGER DEFAULT NULL,
  PRIMARY KEY ("id")
);

COPY products(id, name, slogan, description, category, default_price)
FROM '/Users/matchewxd/work/capstone/SDC-Products/hardData/product.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE IF EXISTS "features";

CREATE TABLE "features" (
  "id" SERIAL NOT NULL,
  "id_products" INTEGER DEFAULT NULL,
  "features" VARCHAR(99) DEFAULT NULL,
  "value" VARCHAR(99) DEFAULT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY("id_products")
    REFERENCES products("id")
);

CREATE INDEX idx_features_id
ON features(id_products);

COPY features(id, id_products, features, value)
FROM '/Users/matchewxd/work/capstone/SDC-Products/hardData/features.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE IF EXISTS "styles" CASCADE;

CREATE TABLE "styles" (
  "id" SERIAL NOT NULL,
  "id_products" INTEGER DEFAULT NULL,
  "name" VARCHAR(99) DEFAULT NULL,
  "sale_price" VARCHAR(33) DEFAULT NULL,
  "original_price" INTEGER DEFAULT NULL,
  "default_style" BIT DEFAULT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY("id_products")
  REFERENCES products("id")
);

CREATE INDEX idx_styles_id
ON styles(id_products);

COPY styles(id, id_products, name, sale_price, original_price, default_style)
FROM '/Users/matchewxd/work/capstone/SDC-Products/hardData/styles.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE IF EXISTS "photos";

CREATE TABLE "photos" (
  "id" SERIAL NOT NULL,
  "styleid" INTEGER DEFAULT NULL,
  "url" VARCHAR(999) DEFAULT NULL,
  "thumbnail_url" VARCHAR(999) NULL DEFAULT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY("styleid")
  REFERENCES styles("id")
);

CREATE INDEX idx_photos_id
ON photos(styleid);

COPY photos(id, styleId, url, thumbnail_url)
FROM '/Users/matchewxd/work/capstone/SDC-Products/hardData/photos.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE IF EXISTS "skus";

CREATE TABLE "skus" (
  "id" SERIAL NOT NULL,
  "styleid" INTEGER DEFAULT NULL,
  "size" VARCHAR(33) DEFAULT NULL,
  "quantity" INTEGER DEFAULT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY("styleid")
  REFERENCES styles("id")
);

CREATE INDEX idx_skus_id
ON skus(styleid);

COPY skus(id, styleId, size, quantity)
FROM '/Users/matchewxd/work/capstone/SDC-Products/hardData/skus.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE IF EXISTS "related";

CREATE TABLE "related" (
  "id" SERIAL NOT NULL,
  "current_product_id" INTEGER DEFAULT Null,
  "related_product_id" INTEGER DEFAULT NULL,
  PRIMARY KEY ("id"),
  FOREIGN KEY("current_product_id")
  REFERENCES products("id")
);

CREATE INDEX idx_related_id
ON related(current_product_id);

COPY related(id, current_product_id, related_product_id)
FROM '/Users/matchewxd/work/capstone/SDC-Products/hardData/related.csv'
DELIMITER ','
CSV HEADER;


/* Test Files*/
/*
CREATE TABLE "photos" (
  "id" SERIAL NOT NULL,
  "styleid" INTEGER DEFAULT NULL,
  "url" VARCHAR(999) DEFAULT NULL,
  "thumbnail_url" VARCHAR CHECK (length(thumbnail_url) > 500 ->> 'null' = thumbnail_url) DEFAULT NULL,
  PRIMARY KEY ("id")
);
*/
/*
COPY photos(id, styleId, url, thumbnail_url)
FROM '/Users/matchewxd/work/capstone/SDC-Products/hardData/photos.csv'
DELIMITER ','
CSV HEADER;
*/