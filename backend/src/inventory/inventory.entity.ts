import { InventoryProduct } from "src/inventory-product/inventory-product.entity";
import { Product } from "src/product/product.entity";
import { Column, Entity, JoinTable, ManyToMany, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Inventory {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  createdAt: Date;

  @Column()
  updatedAt: Date;

  @OneToMany(() => InventoryProduct, inventoryProduct => inventoryProduct.inventory)
  inventoryProducts: InventoryProduct[];
}