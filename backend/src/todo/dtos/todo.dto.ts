import { IsBoolean, IsNotEmpty, IsString } from 'class-validator';

export class TodoDto {
  @IsString()
  @IsNotEmpty()
  title: string;

  @IsString()
  description?: string;

  @IsBoolean()
  @IsNotEmpty()
  isCompleted: boolean;
}
