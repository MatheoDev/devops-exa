import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { InventoryProduct } from './inventory-product.entity';
import { Repository } from 'typeorm';

@Injectable()
export class InventoryProductService {
  constructor(
    @InjectRepository(InventoryProduct)
    private repo: Repository<InventoryProduct>,
  ) { }
}
