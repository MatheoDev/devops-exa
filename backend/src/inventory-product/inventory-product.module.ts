import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { InventoryProduct } from './inventory-product.entity';

@Module({
  imports: [TypeOrmModule.forFeature([InventoryProduct])],
  exports: [TypeOrmModule]
})
export class InventoryProductModule { }
