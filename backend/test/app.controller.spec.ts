import { Test, TestingModule } from '@nestjs/testing';
import { TodoController } from 'src/todo/todo.controller';
import { TodoService } from 'src/todo/todo.service';

describe('AppController', () => {
  let todoController: TodoController;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [TodoController],
      providers: [TodoService],
    }).compile();

    todoController = app.get<TodoController>(TodoController);
  });

  describe('root', () => {
    it('should return "Hello World!"', () => {
      expect(todoController.getHello()).toBe('Hello World!');
    });
  });
});
