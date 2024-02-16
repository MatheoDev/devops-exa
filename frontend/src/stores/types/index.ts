export type Product = {
  id: number
  name: string
  price: number
}

export type Inventory = {
  id: number
  createdAt: Date
  updatedAt: Date
  inventoryProducts: InventoryProduct[]
}

export type InventoryProduct = {
  quantity: number
  product: Product
}