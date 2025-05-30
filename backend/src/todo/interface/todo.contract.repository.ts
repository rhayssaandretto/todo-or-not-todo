export default interface IContractRepository<T> {
  findAll(): Promise<T[]>;

  findById(id: string): Promise<T | null>;

  create(data: T): Promise<T>;

  update(id: string, data: Partial<T>): Promise<T | null>;

  delete(id: string): Promise<void>;
}
