import { AxiosKey } from "@/conf/axios";
import { injectStrict } from "@/utils/injectTyped";
import { defineStore } from "pinia";
import type { Product } from "./types";
import { ref } from "vue";

export const useProductStore = defineStore('product', () => {
  const axios = injectStrict(AxiosKey)

  const products = ref<Product[]>([])

  const fetchProducts = async () => {
    const response = await axios.get('/product')
    products.value = response.data

    console.log(products.value)
  }

  return {
    products,
    fetchProducts
  }
})