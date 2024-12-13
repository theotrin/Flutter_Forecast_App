# Flutter Forecast App

## Visão Geral
O **Flutter Forecast App** é um aplicativo desenvolvido em Flutter que permite aos usuários consultar previsões meteorológicas de cidades brasileiras. Utilizando a API da HG Brasil, o aplicativo fornece dados como descrição do clima, umidade, velocidade do vento e previsão de temperaturas máximas e mínimas.

## Demostração:
![image](https://github.com/user-attachments/assets/91518443-42f6-439f-b02f-57469ff8dd44)
![image](https://github.com/user-attachments/assets/a8ff07aa-2d7c-496e-8723-19f131141bd8)



## Objetivos do Projeto
- Desenvolver um aplicativo funcional para consulta de previsão do tempo.
- Praticar conceitos de desenvolvimento mobile com Flutter.
- Demonstrar habilidades em consumo de APIs e gerenciamento de estado no Flutter.

## Funcionalidades Principais
1. **Entrada de Dados**:
   - Campo para o nome da cidade.
   - Dropdown para seleção do estado brasileiro.

2. **Consulta de Previsão**:
   - Botão para realizar a consulta na API.
   - Exibição dos dados de previsão meteorológica na tela, incluindo:
     - Nome da cidade.
     - Descrição do clima.
     - Umidade (%).
     - Velocidade do vento.
     - Temperatura máxima e mínima.

3. **Tratamento de Erros**:
   - Tratamento de falhas na conexão ou erros na consulta à API.

## Tecnologias Utilizadas
- **Flutter**: Framework principal para o desenvolvimento do app.
- **Dart**: Linguagem de programação usada no Flutter.
- **API da HG Brasil**: Fonte de dados meteorológicos.
- **Pacote HTTP**: Para realizar requisições à API.

## Estrutura do Código
### Principais Componentes:

1. **Tela Principal**:
   - Arquivo: `wellcome_screen.dart`
   - Responsável por renderizar a interface de entrada e exibição de dados.

2. **Modelo de Dados**:
   - Arquivo: `weather.dart`
   - Define a estrutura do objeto `Weather` com as informações retornadas pela API.

3. **Consulta à API**:
   - Função: `fetchWeather()`
   - Realiza a requisição HTTP e converte o JSON retornado em um objeto `Weather`.

### Estrutura do Projeto:
```
lib/
|-- models/
|   |-- weather.dart
|
|-- screens/
|   |-- wellcome_screen.dart
|
|-- main.dart
```

## Destaques do Código
- **Validação de Entrada**: Verifica se o nome da cidade e o estado foram preenchidos corretamente antes de realizar a consulta.
- **Uso de Widgets Dinâmicos**: O layout da tela principal ajusta-se dinamicamente com base nos dados retornados da API.
- **Boas Práticas**:
  - Modularização do código em pastas como `models` e `screens`.
  - Uso de async/await para manipulação de requisições assíncronas.

## Requisitos para Execução
1. **Configuração do Ambiente Flutter**:
   - Flutter SDK instalado.
   - Editor de texto como Visual Studio Code ou Android Studio.

2. **Dependências**:
   - Certifique-se de instalar as dependências listadas no `pubspec.yaml` com o comando:
     ```
     flutter pub get
     ```

3. **Execução do App**:
   - Execute o comando:
     ```
     flutter run
     ```

## Conclusão
O **Flutter Forecast App** é um projeto que demonstra habilidades em desenvolvimento mobile, desde o consumo de APIs até a criação de uma interface responsiva e intuitiva. Este repositório não apenas exibe conhecimento técnico, mas também reflete boas práticas de desenvolvimento e organização de código.


