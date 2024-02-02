import { InventoryProduct } from "src/inventory-product/inventory-product.entity";
import { Inventory } from "src/inventory/inventory.entity";
import { Column, Entity, ManyToMany, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity('product')
export class Product {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  price: number;

  @OneToMany(() => InventoryProduct, inventoryProduct => inventoryProduct.product)
  inventoryProducts: InventoryProduct[];
}