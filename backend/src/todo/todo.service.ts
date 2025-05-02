import { Injectable, NotFoundException } from '@nestjs/common';
import { TodoRepository } from './todo.repository';
import { TodoDto } from './dtos/todo.dto';
import TodoAdapter from './todo.adapter';
import { Todo } from './schema/todo.schema';
import { UpdateTodoDto } from './dtos/update-todo';

@Injectable()
export class TodoService {
  constructor(
    private readonly repository: TodoRepository,
    private readonly adapter: TodoAdapter,
  ) {}

  async findAll(): Promise<Todo[]> {
    return await this.repository.findAll();
  }

  async findById(id: string): Promise<Todo> {
    if (!id) {
      throw new NotFoundException('ID is required');
    }

    const todo = await this.repository.findById(id);

    if (!todo) {
      throw new NotFoundException(
        `No task found with the provided ID: "${id}".`,
      );
    }

    return todo;
  }

  async create(data: TodoDto): Promise<Todo> {
    const todos: Todo = this.adapter.createToEntity(data);
    return await this.repository.create(todos);
  }

  async update(id: string, data: UpdateTodoDto): Promise<UpdateTodoDto> {
    await this.findById(id);

    const todo: Todo = this.adapter.updateToEntity(data);

    const updated = await this.repository.update(id, todo);

    if (!updated) {
      throw new NotFoundException(
        `No task found with the provided ID: "${id}".`,
      );
    }

    return this.adapter.entityToDto(updated);
  }

  async delete(id: string): Promise<void> {
    await this.repository.delete(id);
  }
}
