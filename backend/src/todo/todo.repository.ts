import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Todo } from 'src/todo/schema/todo.schema';
import IContractRepository from './interface/todo.contract.repository';

@Injectable()
export class TodoRepository implements IContractRepository<Todo> {
  constructor(@InjectModel('Todo') private readonly model: Model<Todo>) {}

  async findAll(): Promise<Todo[]> {
    return await this.model.find().exec();
  }

  async findById(id: string): Promise<Todo | null> {
    return await this.model.findById(id).exec();
  }

  async create(data: Todo): Promise<void> {
    const newTodo = new this.model(data);
    await newTodo.save();
  }

  async update(id: string, data: Partial<Todo>): Promise<Todo | null> {
    return await this.model.findByIdAndUpdate(id, data, {
      new: true,
    });
  }

  async delete(id: string): Promise<void> {
    await this.model.findByIdAndDelete(id);
  }
}
