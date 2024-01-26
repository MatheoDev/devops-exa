import { Module } from '@nestjs/common'
import { ProductModule } from './product.module'
import { ProductService } from './product.service'
import { ProductController } from './product.controller'

@Module({
  imports: [ProductModule],
  providers: [ProductService],
  controllers: [ProductController]
})
export class ProductHttpModule { }
