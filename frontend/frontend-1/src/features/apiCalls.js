import axios from 'axios';
import { API_URL_UJWAL, API_URL_BUDHA } from '../config';

// Determine the base URL and endpoint based on the current hostname
const getBaseConfig = () => {
  const hostname = window.location.hostname;
  let config;
  if (hostname === 'ujwal.sandbox.adex.ltd') {
    config = { baseURL: API_URL_UJWAL, endpoint: '/products', hostHeader: 'ujwal.sandbox.adex.ltd' };
  } else if (hostname === 'budha.sandbox.adex.ltd') {
    config = { baseURL: API_URL_BUDHA, endpoint: '/products01', hostHeader: 'budha.sandbox.adex.ltd' };
  } else {
    config = { baseURL: API_URL_UJWAL, endpoint: '/products', hostHeader: 'ujwal.sandbox.adex.ltd' }; // Default to one of the APIs
  }
  console.log('Host Header:', config.hostHeader); // Print the host header to the console
  return config;
};

// Get base URL and endpoint for the current request
const { baseURL, endpoint, hostHeader } = getBaseConfig();

const axiosInstance = axios.create({
  baseURL: baseURL,
  headers: {
    'Host': hostHeader
  }
});

export const getProducts = async () => {
  try {
    const res = await axiosInstance.get(`${endpoint}`);
    return res.data;
  } catch (err) {
    console.log(err);
    return err;
  }
};

export const addProduct = async (product) => {
  try {
    const res = await axiosInstance.post(`${endpoint}/`, product);
    alert('Product added');
    return res.data;
  } catch (err) {
    console.log(err);
    return { error: err };
  }
};

export const updateProduct = async (product, productId) => {
  try {
    const res = await axiosInstance.put(`${endpoint}/` + productId, product);
    return res.data;
  } catch (err) {
    return {
      error: err,
    };
  }
};

export const deleteProduct = async (productId, productThumbnail) => {
  try {
    const res = await axiosInstance.delete(`${endpoint}/` + productId);
    return res.data;
  } catch (err) {
    return { error: err };
  }
};

export const getProductById = async (id) => {
  try {
    const res = await axiosInstance.get(`${endpoint}/` + id);
    return res.data;
  } catch (err) {
    return { error: err.message };
  }
};

export const uploadProductThumbnail = async (formData) => {
  try {
    const res = await axiosInstance.post(`${baseURL}/thumbnailUpload/`, formData);
    return res.data;
  } catch (err) {
    console.log(err);
    return { error: err.message };
  }
};

// Specific functions for /products01 endpoint
export const getProducts01 = async () => {
  try {
    const res = await axiosInstance.get(`${endpoint}`);
    return res.data;
  } catch (err) {
    console.log(err);
    return err;
  }
};

export const addProduct01 = async (product) => {
  try {
    const res = await axiosInstance.post(`${endpoint}/`, product);
    alert('Product added');
    return res.data;
  } catch (err) {
    console.log(err);
    return { error: err };
  }
};

export const updateProduct01 = async (product, productId) => {
  try {
    const res = await axiosInstance.put(`${endpoint}/` + productId, product);
    return res.data;
  } catch (err) {
    return {
      error: err,
    };
  }
};

export const deleteProduct01 = async (productId, productThumbnail) => {
  try {
    const res = await axiosInstance.delete(`${endpoint}/` + productId);
    return res.data;
  } catch (err) {
    return { error: err };
  }
};

export const getProductById01 = async (id) => {
  try {
    const res = await axiosInstance.get(`${endpoint}/` + id);
    return res.data;
  } catch (err) {
    return { error: err.message };
  }
};

export const uploadProductThumbnail01 = async (formData) => {
  try {
    const res = await axiosInstance.post(`${baseURL}/thumbnailUpload01/`, formData);
    return res.data;
  } catch (err) {
    console.log(err);
    return { error: err.message };
  }
};

