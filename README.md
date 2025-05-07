# Todo or Not Todo

## Descrição
**Todo or Not Todo** é uma aplicação web de lista de tarefas (to-do list) desenvolvida para demonstrar habilidades técnicas em desenvolvimento front-end e back-end. A aplicação permite que os usuários criem, editem, marquem como concluídas e excluam tarefas, com uma interface fluida e intuitiva. O projeto foi construído com foco em boas práticas de programação, arquitetura modular e usabilidade, destacando-se pela utilização do **Flutter** para o front-end web.

Este repositório foi criado como parte de um desafio técnico para uma entrevista, evidenciando competências em **Flutter**, **Dart**, **Node.js**, **TypeScript**, e integração com banco de dados.

## Funcionalidades
- **Adicionar Tarefas**: Crie novas tarefas com título e descrição.
- **Editar Tarefas**: Atualize o conteúdo das tarefas existentes.
- **Marcar como Concluída**: Alterne o status de uma tarefa entre pendente e concluída.
- **Excluir Tarefas**: Remova tarefas da lista.
- **Persistência de Dados**: As tarefas são salvas em um banco de dados para garantir que não sejam perdidas.
- **Interface Responsiva**: Design adaptável para navegadores web em dispositivos móveis e desktop.

## Tecnologias Utilizadas
- **Front-end**:
  - Flutter (para desenvolvimento web)
  - Dart
  - HTTP (para chamadas à API)
- **Back-end**:
  - Node.js com Express
  - TypeScript
  - Mongoose (para integração com banco de dados)
- **Banco de Dados**:
  - MongoDB
- **Outras Ferramentas**:
  - Flutter CLI (para build e desenvolvimento front-end)
  - ESLint e Prettier (para padronização de código no back-end)
  - Git (controle de versão)

## Arquitetura do Front-end
O front-end foi desenvolvido com **Flutter** e **Dart**, utilizando uma arquitetura **MVVM (Model-View-ViewModel)** combinada com uma estrutura modular para garantir escalabilidade, manutenibilidade e testabilidade. A escolha do MVVM foi motivada pela separação clara de responsabilidades, facilitando a gestão do estado e a reutilização de código.

### Detalhes da Arquitetura
- **Model**:
  - Representa os dados e a lógica de negócio do front-end.
  - Inclui classes como `Task`, que definem a estrutura das tarefas (ex.: título, status).
  - Interage com a API do back-end por meio de serviços HTTP, encapsulando a comunicação com o servidor.
- **View**:
  - Composta por widgets do Flutter, responsáveis pela interface do usuário.
  - As views são stateless sempre que possível, delegando a lógica de estado ao ViewModel.
  - Organizadas em módulos para facilitar a navegação e a reutilização.
- **ViewModel**:
  - Atua como intermediário entre o Model e a View, gerenciando o estado e a lógica de apresentação.
  - Utiliza o padrão Provider para gerenciamento de estado, permitindo atualizações reativas na UI sem acoplamento.
  - Exemplo: O `TaskViewModel` gerencia a lista de tarefas, lidando com operações como adicionar, editar e excluir, e notifica a View  - View quando os dados são atualizados.
- **Modularização**:
  - O código é organizado em módulos (ex.: `features/tasks`, `core/services`, `ui/widgets`), cada um com responsabilidades específicas.
  - Essa estrutura permite isolar funcionalidades, facilitando a adição de novas features e a manutenção do projeto.
  - Bibliotecas como `http` e `provider` são usadas para comunicação com a API e gerenciamento de estado, respectivamente.

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
   cd client
   flutter pub get
   ```

3. **Instale as dependências do back-end**:
   ```bash
   cd ../server
   npm install
   ```

4. **Configure o banco de dados**:
   - Crie um arquivo `.env` na pasta `server` com base no `.env.example`:
     ```env
     DATABASE_URL="file:./dev.db"
     ```

5. **Inicie o back-end**:
   ```bash
   npm run dev
   ```
   O servidor será executado em `http://localhost:3000`.

6. **Inicie o front-end**:
   Em outro terminal, na pasta `client`:
   ```bash
   flutter run -d chrome
   ```
   A aplicação estará disponível em `http://localhost:4200` (ou outra porta indicada pelo Flutter).

### Scripts Disponíveis
- **Front-end** (`client`):
  - `flutter run -d chrome`: Inicia a aplicação no navegador.
  - `flutter build web`: Gera a build de produção.
  - `flutter analyze`: Executa o Dart Analyzer para verificar o código.
- **Back-end** (`server`):
  - `npm run dev`: Inicia o servidor com nodemon.
  - `npm run build`: Compila o TypeScript para JavaScript.


## Decisões Técnicas
- **Flutter para Web**: Escolhido por sua capacidade de criar interfaces ricas e performáticas, com a possibilidade de reaproveitar o código para outras plataformas no futuro.
- **MVVM**: Adotado para separar a lógica de apresentação dos dados e da interface, promovendo testabilidade e escalabilidade.
- **TypeScript (back-end)**: Utilizado para garantir tipagem segura e reduzir erros em tempo de execução.
- **Mongoose**: Escolhido pela facilidade de integração com bancos de dados relacionais e pela geração automática de tipos.
- **Estrutura Modular**: Tanto o front-end quanto o back-end seguem uma organização modular para facilitar a manutenção e a adição de novas funcionalidades.
