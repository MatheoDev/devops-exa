import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Inventory } from './inventory.entity';

@Injectable()
export class InventoryService {
  constructor(
    @InjectRepository(Inventory)
    private repo: Repository<Inventory>,
  ) { }

  async findInventory(): Promise<Inventory[]> {
    return await this.repo.find({ relations: ['inventoryProducts', 'inventoryProducts.product'] });
  }
}
