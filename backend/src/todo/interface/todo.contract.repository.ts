export default interface IContractRepository<T> {
  findAll(): Promise<T[]>;

  findById(id: string): Promise<T | null>;

  create(body: T): Promise<void>;

  update(id: string, body: Partial<T>): Promise<T | null>;

  delete(id: string): Promise<void>;
}
