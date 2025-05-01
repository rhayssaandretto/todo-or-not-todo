import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Todo } from 'src/todo/schema/todo.schema';

@Injectable()
export class TodoRepository {
  constructor(@InjectModel('Todo') private readonly todoModel: Model<Todo>) {}
}
