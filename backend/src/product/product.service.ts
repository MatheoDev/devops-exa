import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Product } from './product.entity';

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(Product)
    private repo: Repository<Product>,
  ) { }

  async findProducts(): Promise<Product[]> {
    return await this.repo.find();
  }

  async create(product: Product): Promise<Product> {
    return await this.repo.save(product);
  }

  async update(product: Product): Promise<Product> {
    return await this.repo.save(product);
  }

  async delete(id: number): Promise<void> {
    await this.repo.delete(id);
  }
}
