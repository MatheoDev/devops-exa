<script setup lang="ts">
import ProductCard from '@/components/Product/ProductCard.vue';
import { useProductStore } from '@/stores/product';
import { onMounted } from 'vue';

const productStore = useProductStore()

onMounted(() => {
  productStore.fetchProducts()
})
</script>

<template>
  <main>
    <div class="listProduct">
      <div v-for="product in productStore.products" :key="product.id">
        <ProductCard :product="product" />
      </div>
    </div>
  </main>
</template>

<style scoped>
main {
  display: flex;
  justify-content: center;
}

.listProduct {
  width: 80vw;
  display: flex;
  flex-wrap: wrap;
  justify-content: start;
}
</style>
