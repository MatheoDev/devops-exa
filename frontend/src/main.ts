import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import instance, { AxiosKey } from './conf/axios'

const app = createApp(App)

app.provide(AxiosKey, instance)
app.use(createPinia())
app.use(router)

app.mount('#app')
