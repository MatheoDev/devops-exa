import { Body, Controller, Delete, Get, Post } from '@nestjs/common';
import { ProductService } from './product.service';
import { Product } from './product.entity';

@Controller('product')
export class ProductController {
  constructor(private readonly productService: ProductService) { }

  @Get()
  async findProducts() {
    return await this.productService.findProducts();
  }

  @Post('create')
  async createProduct(@Body() product: Product) {
    return await this.productService.create(product);
  }

  @Post('update')
  async updateProduct(@Body() product: Product) {
    return await this.productService.update(product);
  }

  @Delete('')
  async deleteProduct(@Body('id') id: number) {
    return await this.productService.delete(id);
  }
}
