import { IsBoolean, IsNotEmpty, IsString } from 'class-validator';

export class TodoDto {
  @IsString()
  @IsNotEmpty()
  title: string;

  @IsBoolean()
  isCompleted: boolean;
}
