import { Controller, Get } from '@nestjs/common';
import { TodoService } from './todo.service';

@Controller()
export class TodoController {
  constructor(private readonly service: TodoService) {}

  @Get()
  getHello(): string {
    return this.service.getHello();
  }
}
