import { Inventory } from "src/inventory/inventory.entity";
import { Product } from "src/product/product.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryColumn } from "typeorm";

@Entity('inventory_product')
export class InventoryProduct {

  @PrimaryColumn()
  @ManyToOne(() => Inventory, inventory => inventory.inventoryProducts)
  inventory: number;

  @PrimaryColumn()
  @ManyToOne(() => Product, product => product.inventoryProducts)
  product: number;

  @Column()
  quantity: number;

}