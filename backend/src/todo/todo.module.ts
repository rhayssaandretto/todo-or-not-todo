import { Module } from '@nestjs/common';
import { TodoSchema } from './schema/todo.schema';
import TodoAdapter from './todo.adapter';
import { MongooseModule } from '@nestjs/mongoose';
import { TodoController } from './todo.controller';
import { TodoService } from './todo.service';
import { TodoRepository } from './todo.repository';

@Module({
  imports: [MongooseModule.forFeature([{ name: 'Todo', schema: TodoSchema }])],
  controllers: [TodoController],
  providers: [TodoService, TodoRepository, TodoAdapter],
  exports: [],
})
export class TodoModule {}
