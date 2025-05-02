import { Injectable } from '@nestjs/common';
import Adapter from 'src/common/adapter/adapter';
import { UpdateTodoDto } from './dtos/update-todo';
import { Todo } from './schema/todo.schema';
import { TodoDto } from './dtos/todo.dto';

@Injectable()
export default class TodoAdapter
  implements Adapter<Todo, TodoDto, UpdateTodoDto>
{
  public updateToEntity(dto: UpdateTodoDto): Todo {
    return {
      title: dto.title,
      description: dto.description,
      isCompleted: dto.isCompleted,
    } as Todo;
  }

  public createToEntity(dto: TodoDto): Todo {
    return {
      title: dto.title,
      description: dto.description,
      isCompleted: dto.isCompleted,
    };
  }

  entityToDto(entity: Todo): TodoDto {
    return {
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
    };
  }
}
