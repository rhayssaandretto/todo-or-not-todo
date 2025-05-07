# Todo or Not Todo (๑•̀ㅂ•́)و✍

## Descrição
**Todo or Not Todo** é uma aplicação web de lista de tarefas (to-do list) desenvolvida para teste técnico. A aplicação permite que os usuários criem, editem, marquem como concluídas e excluam tarefas, com uma interface fluida e intuitiva. O projeto foi construído com foco em boas práticas de programação, arquitetura modular e usabilidade, destacando-se pela utilização do **Flutter** para o front-end web.

## Funcionalidades
- **Adicionar Tarefas**: Crie novas tarefas com título e descrição.
- **Editar Tarefas**: Atualize o conteúdo das tarefas existentes.
- **Marcar como Concluída**: Alterne o status de uma tarefa entre pendente e concluída.
- **Excluir Tarefas**: Remova tarefas da lista.
- **Persistência de Dados**: As tarefas são salvas em um banco de dados para garantir que não sejam perdidas.
- **Interface Responsiva**: Design adaptável para navegadores web em dispositivos móveis e desktop.

## Tecnologias Utilizadas

### Front-End (Flutter)
| Pacote                        | Versão         |
| ----------------------------- | -------------- |
| `dart`                        | >=3.4.4 <4.0.0 |
| `flutter`                     | sdk: flutter   |
| `flutter_bloc`                | ^9.1.1         |
| `get_it`                      | ^8.0.3         |
| `go_router`                   | ^15.1.1        |
| `dio`                         | ^5.8.0+1       |
| `curl_logger_dio_interceptor` | ^1.0.0         |
| `google_fonts`                | ^6.2.1         |

### Back-End (NestJS + TypeScript)
| Pacote                     | Versão  |
| -------------------------- | ------- |
| `@nestjs/core`             | ^11.0.1 |
| `@nestjs/platform-express` | ^11.0.1 |
| `@nestjs/config`           | ^4.0.2  |
| `@nestjs/mongoose`         | ^11.0.3 |
| `mongoose`                 | ^8.14.1 |
| `class-validator`          | ^0.14.1 |
| `class-transformer`        | ^0.5.1  |
| `reflect-metadata`         | ^0.2.2  |
| `rxjs`                     | ^7.8.1  |
| `typescript`               | ^5.7.3  |
| `ts-node`                  | ^10.9.2 |
| `@nestjs/cli`              | ^11.0.0 |

## Arquitetura do Front-end
O front-end foi desenvolvido com **Flutter** e **Dart**, utilizando uma arquitetura **MVVM (Model-View-ViewModel)** combinada com uma estrutura modular para garantir escalabilidade, manutenibilidade e testabilidade. A escolha do MVVM foi motivada pela separação clara de responsabilidades, facilitando a gestão do estado e a reutilização de código.

## Como Executar o Projeto

### Pré-requisitos
- Flutter SDK (versão 3.10 ou superior)
- Dart
- Node.js (versão 16 ou superior)
- npm ou yarn
- Git
- MongoDB

### Passos para Instalação
1. **Clone o repositório**:
   ```bash
   git clone https://github.com/rhayssaandretto/todo-or-not-todo.git
   cd todo-or-not-todo
   ```

2. **Instale as dependências do front-end**:
   ```bash
   cd .\frontend\
   flutter pub get
   ```

3. **Instale as dependências do back-end**:
   ```bash
   cd .\backend\
   npm install
   ```

4. **Configure o banco de dados**:
   - Crie um arquivo `.env` na pasta `backend` com base no `.env.example`:
     ```env
     DATABASE_URL=mongodb://localhost:27017/todo
     ```

5. **Inicie o back-end**:
   ```bash
   npm run dev
   ```
   O servidor será executado em `http://localhost:3000`.

6. **Inicie o front-end**:
   Em outro terminal, na pasta `frontend`:
   ```bash
   flutter run -d chrome
   ```
   A aplicação estará disponível em `http://localhost:4200` (ou outra porta indicada pelo Flutter).

### Scripts Disponíveis
- **Front-end** (`frontend`):
  - `flutter run -d chrome`: Inicia a aplicação no navegador.
  - `flutter build web`: Gera a build de produção.
  - `flutter analyze`: Executa o Dart Analyzer para verificar o código.
- **Back-end** (`backend`):
  - `npm run dev`: Inicia o servidor com nodemon.
  - `npm run build`: Compila o TypeScript para JavaScript.

