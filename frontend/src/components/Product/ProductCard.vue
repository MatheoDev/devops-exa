<script setup lang="ts">
import type { Product } from '@/stores/types';
import { defineProps } from 'vue';

const props = defineProps({
  product: {
    type: Object as () => Product,
    required: true,
  },
});

</script>

<template>
  <div class="card">
    <h2>{{ product.name }}</h2>
    <p>{{ product.price }} €</p>
  </div>
</template>

<style scoped>
.card {
  border: 1px solid #ccc;
  padding: 20px;
  margin: 10px;
  width: 200px;
  display: inline-block;
}

h2 {
  margin: 0;
  font-size: 1.5em;
}

p {
  margin: 0;
  font-size: 1.2em;
}
</style>