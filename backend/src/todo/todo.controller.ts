import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { TodoService } from './todo.service';
import { TodoDto } from './dtos/todo.dto';
import { UpdateTodoDto } from './dtos/update-todo';

@Controller('todos')
export class TodoController {
  constructor(private readonly service: TodoService) {}

  @Get()
  async findAll(): Promise<TodoDto[]> {
    return await this.service.findAll();
  }

  @Get(':id')
  async findById(@Param('id') id: string): Promise<TodoDto> {
    return await this.service.findById(id);
  }

  @Post()
  async create(@Body() data: TodoDto): Promise<TodoDto> {
    return await this.service.create(data);
  }

  @Put(':id')
  async update(
    @Param('id') id: string,
    @Body() data: UpdateTodoDto,
  ): Promise<UpdateTodoDto> {
    return await this.service.update(id, data);
  }

  @Delete(':id')
  async delete(@Param('id') id: string): Promise<void> {
    return await this.service.delete(id);
  }
}
