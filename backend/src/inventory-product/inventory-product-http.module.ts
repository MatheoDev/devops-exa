import { Module } from '@nestjs/common'
import { InventoryProductModule } from './inventory-product.module';
import { InventoryProductService } from './inventory-product.service';
import { InventoryProductController } from './inventory-product.controller';

@Module({
  imports: [InventoryProductModule],
  providers: [InventoryProductService],
  controllers: [InventoryProductController]
})
export class InventoryProductHttpModule { }
