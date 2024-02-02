import { Module } from '@nestjs/common'
import { InventoryModule } from './inventory.module';
import { InventoryService } from './inventory.service';
import { InventoryController } from './inventory.controller';

@Module({
  imports: [InventoryModule],
  providers: [InventoryService],
  controllers: [InventoryController]
})
export class InventoryHttpModule { }
