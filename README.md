# 📱 Flutter API Testing Project

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

A robust Flutter application designed to demonstrate API integration, unit testing, and widget testing best practices. This project serves as a reference for implementing clean architecture and testing strategies in Flutter.

## 🚀 Features

- **API Integration**: Seamless data fetching using the `http` package.
- **Unit Testing**: Comprehensive unit tests for business logic.
- **Widget Testing**: UI tests to ensure widget stability.
- **Mocking**: Advanced mocking capabilities using `mockito`.
- **Code Generation**: Automated code generation with `build_runner`.

## 🛠 Prerequisites

Before you begin, ensure you have met the following requirements:

- **Flutter SDK**: Version `>=2.12.0 <3.0.0` installed.
- **Dart SDK**: Included with Flutter.
- **IDE**: VS Code or Android Studio recommended.

## � Instalação do Flutter e FVM

### Instalando o Flutter SDK

#### 🪟 Windows

1. **Baixe o Flutter SDK**:
   - Acesse [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows)
   - Ou baixe manualmente:  [https://docs.flutter.dev/install/manual](https://docs.flutter.dev/install/manual)
   - Baixe o arquivo ZIP do Flutter SDK

2. **Extraia o arquivo**:
   ```bash
   # Extraia para um local adequado, por exemplo:
   C:\tools\flutter
   ```

3. **Adicione ao PATH**:
   - Abra "Editar as variáveis de ambiente do sistema"
   - Adicione `C:\src\flutter\bin` ao PATH

4. **Verifique a instalação**:
   ```bash
   flutter doctor
   ```

#### 🍎 macOS

1. **Usando Homebrew** (recomendado):
   ```bash
   brew install --cask flutter
   ```

2. **Ou baixe manualmente**:
   ```bash
   # Baixe o SDK
   cd ~/development
   curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_stable.zip
   
   # Extraia o arquivo
   unzip flutter_macos_arm64_stable.zip
   
   # Adicione ao PATH (adicione ao ~/.zshrc ou ~/.bash_profile)
   export PATH="$PATH:`pwd`/flutter/bin"
   source ~/.zshrc
   ```

3. **Verifique a instalação**:
   ```bash
   flutter doctor
   ```

#### 🐧 Linux

1. **Baixe e instale**:
   ```bash
   # Instale as dependências
   sudo apt-get update
   sudo apt-get install curl git unzip xz-utils zip libglu1-mesa
   
   # Baixe o Flutter SDK
   cd ~/development
   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_stable.tar.xz
   
   # Extraia o arquivo
   tar xf flutter_linux_stable.tar.xz
   
   # Adicione ao PATH (adicione ao ~/.bashrc ou ~/.zshrc)
   export PATH="$PATH:$HOME/development/flutter/bin"
   source ~/.bashrc
   ```

2. **Verifique a instalação**:
   ```bash
   flutter doctor
   ```

### Instalando o FVM (Flutter Version Management)

O FVM permite gerenciar múltiplas versões do Flutter em um mesmo sistema.

#### Instalação via Dart Pub (Todas as plataformas)

```bash
# Instale o FVM globalmente
dart pub global activate fvm

# Verifique a instalação
fvm --version
```

#### Instalação via Homebrew (macOS e Linux)

```bash
brew tap leoafarias/fvm
brew install fvm
```

#### Instalação via Chocolatey (Windows)

```bash
choco install fvm
```

### Usando o FVM

```bash
# Liste as versões disponíveis do Flutter
fvm releases

# Instale uma versão específica do Flutter
fvm install stable
fvm install 3.10.0

# Use uma versão específica globalmente
fvm global stable

# Use uma versão específica para o projeto atual
fvm use stable

# Execute comandos Flutter com a versão do FVM
fvm flutter --version
fvm flutter pub get
fvm flutter run
```

### Configurando o PATH do FVM

Após instalar o FVM, adicione o seguinte ao seu PATH:

#### Windows
```bash
# Adicione ao PATH do sistema:
C:\Users\<seu-usuario>\fvm\default\bin
```

#### macOS/Linux
```bash
# Adicione ao ~/.zshrc ou ~/.bash_profile:
export PATH="$PATH:$HOME/fvm/default/bin"
source ~/.zshrc
```

## �📥 Installation

Follow these steps to set up the project locally:

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/reinaldorossetti/flutter_tests.git
    cd flutter_tests
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    or 
    fvm flutter pub get
    ```

## 🏃‍♂️ Running the App

To run the application on an emulator or physical device:

```bash
flutter run
```

## 🧪 Testing

Este projeto enfatiza testes como uma prática essencial de desenvolvimento. Flutter oferece um framework robusto de testes que suporta testes unitários, de widgets e de integração.

### 📚 Tipos de Testes no Flutter

#### 1️⃣ Testes Unitários (`test`)
Os **testes unitários** são usados para testar funções, métodos e classes individuais de forma isolada. São rápidos e não dependem de recursos externos como UI ou banco de dados.

**Quando usar:** Para testar lógica de negócio, funções utilitárias, validações, e classes de serviço.

**Exemplo do projeto:**
```dart
// test/maths_util_test.dart - Teste unitário de funções matemáticas
test('check for two number addition', () {
  var a = 10;
  var b = 10;
  var sum = add(a, b);
  expect(sum, 20);
});
```

#### 2️⃣ Testes de Widget (`testWidgets`)
Os **testes de widget** validam a renderização e o comportamento da UI. Eles simulam interações do usuário e verificam se os widgets respondem corretamente. É um teste mais robusto que testes unitários, pois testa a UI em um ambiente real, no entanto somente naquela tela que está sendo testada, diferente dos testes de integração que testam o fluxo completo da aplicação.

**Quando usar:** Para testar componentes de UI, interações de usuário, navegação entre telas, e estados de widgets.

**Exemplo do projeto:**
```dart
// test/login_screen_test.dart - Teste de widget
testWidgets('Should have one login button', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
  
  Finder loginButton = find.byType(ElevatedButton);
  expect(loginButton, findsOneWidget);
});
```

#### 3️⃣ Testes de Integração
Os **testes de integração** verificam o funcionamento do app completo em um ambiente real ou simulado. Eles testam fluxos completos de usuário.

**Quando usar:** Para testar fluxos completos da aplicação, integração entre múltiplas telas, e comportamento real em dispositivos.

**Exemplo do projeto:**
```dart
// integration_test/login_flow_test.dart - Teste de integração
testWidgets('Should show home screen when user enters valid credentials',
    (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
  
  await tester.enterText(find.byKey(const ValueKey("email_id")), "user@example.com");
  await tester.enterText(find.byKey(const ValueKey("password")), "password");
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle(Duration(seconds: 2));
  
  expect(find.byType(Text), findsOneWidget);
});
```

### 🎯 Diferença entre `test` e `testWidgets`

| Aspecto | `test` | `testWidgets` |
|---------|--------|---------------|
| **Propósito** | Testar lógica pura (funções, classes) | Testar widgets e UI |
| **Performance** | Muito rápido | Mais lento (renderiza widgets) |
| **Recursos** | Não precisa de Flutter framework | Requer Flutter Test framework |
| **Parâmetro** | Callback simples | Recebe `WidgetTester` |
| **Uso típico** | Validações, cálculos, APIs | Botões, formulários, navegação |

### 🚀 Comandos de Teste

#### Executar Todos os Testes
```bash
flutter test
```

#### Executar Testes Específicos
```bash
flutter test test/fetch_book_test.dart
```

#### Executar Testes de Integração
```bash
flutter test integration_test/login_flow_test.dart
```

#### Executar com Cobertura de Código
```bash
flutter test --coverage
```

#### Executar em Modo Watch (Observação)
```bash
flutter test --watch
```

### 📂 Testes Disponíveis

#### Testes Unitários
- `test/fetch_book_test.dart`: Testa chamadas de API com mocks do `http.Client`.
- `test/maths_util_test.dart`: Testa funções matemáticas utilitárias.
- `test/validator_test.dart`: Testa lógica de validação de entrada.

#### Testes de Widget
- `test/login_screen_test.dart`: Testa a tela de login, incluindo campos de texto, botões e validações.

#### Testes de Integração
- `integration_test/login_flow_test.dart`: Testa o fluxo completo de login da aplicação.

### 🎭 Gerando Mocks com Mockito

Este projeto usa `mockito` para criar mocks de dependências. Para gerar ou atualizar mocks:

```bash
flutter pub run build_runner build
```

Ou para observar mudanças automaticamente:
```bash
flutter pub run build_runner watch
```

**Exemplo de uso:**
```dart
@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  
  setUp(() {
    mockClient = MockClient();
  });
  
  test('Should return list of books', () async {
    when(mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => http.Response('[...]', 200));
    
    expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
  });
}
```

### ✅ Boas Práticas de Teste

#### 1. **Padrão AAA (Arrange-Act-Assert)**
Organize seus testes em três seções claras:
```dart
test('example test', () {
  // Arrange - Preparar os dados
  var value = 10;
  
  // Act - Executar a ação
  var result = processValue(value);
  
  // Assert - Verificar o resultado
  expect(result, equals(20));
});
```

#### 2. **Nomes Descritivos**
Use nomes de teste que descrevam claramente o comportamento esperado:
```dart
✅ test('Should return error when email is invalid', () { ... });
❌ test('test1', () { ... });
```

#### 3. **Use `group` para Organização**
Agrupe testes relacionados:
```dart
group('Login validation tests', () {
  test('Should accept valid email', () { ... });
  test('Should reject invalid email', () { ... });
});
```

#### 4. **Use `setUp` e `tearDown`**
Inicialize e limpe recursos de forma consistente:
```dart
setUp(() {
  // Configuração antes de cada teste
  mockClient = MockClient();
});

tearDown(() {
  // Limpeza após cada teste
  mockClient.close();
});
```

#### 5. **Teste Casos de Erro**
Não teste apenas o caminho feliz:
```dart
test('Should throw exception when API returns 404', () {
  when(mockClient.get(any)).thenAnswer((_) async => http.Response('Not Found', 404));
  expect(fetchBooks(mockClient), throwsException);
});
```

#### 6. **Use Keys para Widget Testing**
Facilite a localização de widgets em testes:
```dart
TextField(key: ValueKey('email_input'))

// No teste:
find.byKey(ValueKey('email_input'))
```

#### 7. **Cobertura de Código**
Busque alta cobertura, mas foque na qualidade dos testes:
```bash
flutter test --coverage
```

#### 8. **Mantenha Testes Rápidos**
- Testes unitários devem rodar em milissegundos.
- Use mocks em vez de dependências reais.
- Evite delays desnecessários.

#### 9. **Independência entre Testes**
Cada teste deve ser independente e não depender do estado de outros testes.

#### 10. **Continuous Integration**
Configure CI/CD para executar testes automaticamente em cada commit.

## � Keys e Semantics no Flutter

### O que são Keys?

**Keys** são identificadores únicos que o Flutter usa para preservar o estado dos widgets quando a árvore de widgets é reconstruída. Elas são essenciais para testes, pois permitem localizar e interagir com widgets específicos de forma confiável.

### Tipos de Keys

#### 1. **ValueKey**
Usa um valor específico como identificador. Ideal quando você tem um valor único que identifica o widget.

```dart
TextField(
  key: const ValueKey('email_input'),
  decoration: const InputDecoration(hintText: "Enter Email"),
)
```

**Uso no teste:**
```dart
Finder emailField = find.byKey(const ValueKey('email_input'));
await tester.enterText(emailField, 'test@example.com');
```

#### 2. **ObjectKey**
Usa um objeto como identificador. Útil quando você tem objetos de modelo únicos.

```dart
ListTile(
  key: ObjectKey(user),
  title: Text(user.name),
)
```

#### 3. **UniqueKey**
Gera uma chave única toda vez que é criada. Útil para forçar a reconstrução de widgets.

```dart
Container(
  key: UniqueKey(),
  child: MyWidget(),
)
```

#### 4. **GlobalKey**
Permite acessar o estado do widget de qualquer lugar na árvore de widgets. Essencial para formulários.

```dart
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(children: [...]),
)

// Validar o formulário
if (_formKey.currentState?.validate() == true) {
  // Processar dados
}
```

### Quando usar Keys?

✅ **Use Keys quando:**
- Precisa identificar widgets em testes
- Tem uma lista de widgets que podem ser reordenados
- Precisa preservar o estado de um widget durante reconstruções
- Precisa acessar o estado de um widget filho (GlobalKey)
- Está trabalhando com formulários


### Exemplo Prático do Projeto

No arquivo [`login_screen.dart`](file:///d:/github-projects/flutter_tests/lib/login_screen.dart), usamos Keys de forma estratégica:

```dart
// GlobalKey para gerenciar o estado do formulário
final GlobalKey<FormState> _key = GlobalKey<FormState>();

// ValueKey para identificar o título nos testes
Text(
  "Login",
  key: ValueKey("title"),
)

// ValueKey para campos de formulário
TextFormField(
  key: const ValueKey("email_id"),
  decoration: const InputDecoration(hintText: "Enter Email Id"),
)

TextFormField(
  key: const ValueKey("password"),
  decoration: const InputDecoration(hintText: "Enter Password"),
)

// Uso da GlobalKey para validação
if (_key.currentState?.validate() == true) {
  // Formulário válido
}
```

### O que são Semantics?

**Semantics** são widgets que anotam a árvore de widgets com informações descritivas para tecnologias assistivas (leitores de tela) e para melhorar a acessibilidade.

### Por que usar Semantics?

1. **Acessibilidade**: Torna seu app usável para pessoas com deficiências visuais, por padrão o Flutter converte a Label do widget para elementos de acessibilidade "accessibility_id", mas isso não acontece em todos os componentes possuem essa opção.
2. **Testes de Integração**: Facilita a localização de elementos em testes.
3. **SEO Mobile**: Melhora a indexação em mecanismos de busca.
4. **Experiência do Usuário**: Proporciona uma experiência inclusiva.

### Exemplo de uso de Semantics

```dart
// Botão com semântica
Semantics(
  label: 'Botão de login',
  hint: 'Toque para fazer login no aplicativo',
  button: true,
  enabled: true,
  child: ElevatedButton(
    onPressed: _handleLogin,
    child: Text('Login'),
  ),
)

// Imagem com descrição
Semantics(
  label: 'Logo da empresa',
  image: true,
  child: Image.asset('assets/logo.png'),
)

// Campo de texto com semântica
Semantics(
  label: 'Campo de email',
  hint: 'Digite seu endereço de email',
  textField: true,
  child: TextField(
    decoration: InputDecoration(hintText: 'Email'),
  ),
)
```

### Propriedades importantes do Semantics

| Propriedade | Descrição | Exemplo |
|------------|-----------|---------|
| `label` | Descrição do elemento | `'Botão de confirmar'` |
| `hint` | Dica de como usar | `'Toque duas vezes para ativar'` |
| `value` | Valor atual | `'50%'` |
| `button` | Indica que é um botão | `true` |
| `enabled` | Se está habilitado | `true/false` |
| `image` | Indica que é uma imagem | `true` |
| `textField` | Indica que é um campo de texto | `true` |
| `hidden` | Oculta dos leitores de tela | `true` |

### Testando com Semantics

```dart
testWidgets('Should find button by semantic label', (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Semantics(
      label: 'Login button',
      button: true,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Login'),
      ),
    ),
  ));

  // Encontrar por label semântica
  expect(find.bySemanticsLabel('Login button'), findsOneWidget);
});
```

### Boas Práticas com Keys e Semantics

#### Keys:
1. **Seja consistente**: Use o mesmo tipo de Key em contextos similares
2. **Use nomes descritivos**: `ValueKey('login_button')` é melhor que `ValueKey('btn1')`
3. **Evite GlobalKeys em excesso**: Use apenas quando realmente precisar acessar o estado
4. **Keys em listas**: Sempre use Keys em listas dinâmicas que podem ser reordenadas

```dart
ListView.builder(
  itemBuilder: (context, index) {
    return ListTile(
      key: ValueKey(items[index].id), // ✅ Boa prática
      title: Text(items[index].name),
    );
  },
)
```

#### Semantics:
1. **Seja descritivo**: Use labels claros e objetivos
2. **Forneça contexto**: Inclua hints que expliquem a ação esperada
3. **Marque elementos interativos**: Use `button: true` para botões
4. **Teste com TalkBack/VoiceOver**: Verifique como soa nos leitores de tela
5. **Use ExcludeSemantics**: Para remover elementos decorativos da árvore semântica

```dart
ExcludeSemantics(
  child: Image.asset('assets/decorative_background.png'),
)
```

### Ferramentas de Debug

```dart
// Mostrar overlay de semântica durante debug
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  debugPaintLayerBordersEnabled = false;
  debugShowSemanticsDebugger = true; // Ativa overlay de semântica
  runApp(MyApp());
}
```

## �📚 Referências

### Documentação Oficial
- [Flutter Testing Documentation](https://docs.flutter.dev/testing) - Guia oficial de testes do Flutter
- [Dart Testing](https://dart.dev/guides/testing) - Documentação de testes em Dart
- [Flutter Widget Testing](https://docs.flutter.dev/cookbook/testing/widget/introduction) - Introdução aos testes de widget
- [Flutter Integration Testing](https://docs.flutter.dev/testing/integration-tests) - Guia de testes de integração

### Packages e Ferramentas
- [mockito](https://pub.dev/packages/mockito) - Framework de mocking para Dart
- [build_runner](https://pub.dev/packages/build_runner) - Geração de código
- [integration_test](https://pub.dev/packages/integration_test) - Framework de testes de integração
- [flutter_test](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html) - Biblioteca de testes do Flutter

### Tutoriais e Artigos
- [Testing Flutter Apps (Codelab)](https://codelabs.developers.google.com/codelabs/flutter-app-testing) - Tutorial interativo oficial
- [Unit Testing with Mockito](https://flutter.dev/docs/cookbook/testing/unit/mocking) - Como usar Mockito
- [An Introduction to Widget Testing](https://flutter.dev/docs/cookbook/testing/widget/introduction) - Primeiros passos em widget testing
- [Flutter Testing Best Practices](https://blog.flutter.dev/flutter-testing-best-practices-c5f6ca2e8e7d) - Práticas recomendadas

### Vídeos e Cursos
- [Flutter Testing (Official YouTube Playlist)](https://www.youtube.com/playlist?list=PLjxrf2q8roU0Wei-d3XNBLZtYS_76VSeD) - Playlist oficial do Flutter
- [Flutter Widget Testing Tutorial](https://www.youtube.com/watch?v=RDY6UYh-nyg) - Tutorial em vídeo sobre widget testing
- [Testing in Flutter](https://www.udemy.com/topic/flutter/) - Cursos sobre Flutter e testes

### Comunidade
- [Flutter Community on Medium](https://medium.com/flutter-community) - Artigos da comunidade
- [r/FlutterDev](https://www.reddit.com/r/FlutterDev/) - Comunidade no Reddit
- [Flutter Discord](https://discord.gg/flutter) - Chat da comunidade Flutter
- [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter) - Perguntas e respostas

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License.
