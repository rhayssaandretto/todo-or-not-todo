import { Injectable } from '@nestjs/common';
import Adapter from 'src/common/adapter/adapter';
import { CreateTodoDto } from './dtos/create-todo.dto';
import { UpdateTodoDto } from './dtos/update-todo';
import { Todo } from './schema/todo.schema';

@Injectable()
export default class TodoAdapter
  implements Adapter<Todo, CreateTodoDto, UpdateTodoDto>
{
  public updateToEntity(dto: UpdateTodoDto): Todo {
    return {
      title: dto.title,
      description: dto.description,
      completed: dto.completed,
    } as Todo;
  }

  public createToEntity(dto: CreateTodoDto): Todo {
    return {
      title: dto.title,
      description: dto.description,
      completed: dto.completed,
    } as Todo;
  }
}
