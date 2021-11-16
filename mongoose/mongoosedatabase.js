import mongoose from 'mongoose';

const { Schema } = mongoose;

const dataSchema = new Schema({
  id: {
    type: Number,
    unique: true
  },
  name: String,
  slogan: String,
  description: String,
  category: String,
  default_price: Number,
  created_at: String,
  updated_at: String
  features: [{
    feature: String,
    value: String
  }],
  styles: {
    style_id: {
      type: Number,
      unique: true
    },
    name: String,
    original_price: Number,
    sale_price: Number,
    default: Boolean,
    photos: [{
      thumbnail_url: String,
      url: String
    }],
    skus: {
      quantity: Number,
      size: String
    },
    related: Number
  }
});

/**
 * /products
 * /products/:product_id
 * /products/:product_id/styles
 * /products/:product_id/related
 */