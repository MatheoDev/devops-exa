import axios, { type AxiosInstance } from 'axios'
import type { InjectionKey } from 'vue'

const instance: AxiosInstance = axios.create({
  baseURL: 'http://localhost:3001',
  timeout: 5000,
  headers: {
    'Content-Type': 'application/json'
  }
})

// global conf
export const AxiosKey: InjectionKey<AxiosInstance> = Symbol('http')
// instance conf
export default instance