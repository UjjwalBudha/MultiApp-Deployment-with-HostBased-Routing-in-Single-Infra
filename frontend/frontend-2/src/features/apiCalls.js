import axios from 'axios';
import { API_URL_BUDHA } from '../config';

// Directly use the budha.sandbox.adex.ltd configuration
const baseURL = API_URL_BUDHA;
const hostHeader = 'budha.sandbox.adex.ltd';

const axiosInstance = axios.create({
  baseURL: baseURL,
  headers: {
    'Host': hostHeader
  }
});

export const getProducts = async () => {
  try {
    const res = await axiosInstance.get('/products01');
    return res.data;
  } catch (err) {
    console.log(err);
    return err;
  }
};

export const addProduct = async (product) => {
  try {
    const res = await axiosInstance.post('/products01/', product);
    alert('Product added');
    return res.data;
  } catch (err) {
    console.log(err);
    return { error: err };
  }
};

export const updateProduct = async (product, productId) => {
  try {
    const res = await axiosInstance.put('/products01/' + productId, product);
    return res.data;
  } catch (err) {
    return {
      error: err,
    };
  }
};

export const deleteProduct = async (productId, productThumbnail) => {
  try {
    const res = await axiosInstance.delete('/products01/' + productId);
    return res.data;
  } catch (err) {
    return { error: err };
  }
};

export const getProductById = async (id) => {
  try {
    const res = await axiosInstance.get('/products01/' + id);
    return res.data;
  } catch (err) {
    return { error: err.message };
  }
};

export const uploadProductThumbnail = async (formData) => {
  try {
    const res = await axiosInstance.post('/thumbnailUpload/', formData);
    return res.data;
  } catch (err) {
    console.log(err);
    return { error: err.message };
  }
};

