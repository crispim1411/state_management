# Gerenciamento de Estados no Flutter
Aplicação feita em Flutter implementando diversas abordagens para gerenciamento de estados. 
Entre eles, setState, Provider, BLoC,... (incluir conforme for implementando)
As implementações foram separadas na estrutura do aplicativo por rotas.

Os dados são requisitados de uma api pública que serve números randômicos. O objetivo é ter chamadas regulares atualizando o valor na tela. Utilizando **Time.periodic**
```
Timer.periodic(const Duration(seconds: 2), (_) => getValue());
```

## Abordagens
### setState ([Implementação](https://github.com/crispim1411/state_management/tree/master/lib/setState))

A lógica do elemento encontra total ou parcialmente dentro da implementação da interface. A classe precisa herdar de StatefulWidget para guardar e modificar o estado.

```dart 
String screenValue = 'loading...';
...
Text(screenValue);
...
setState(() {
  screenValue = value;
});
```

### Provider ([Implementação](https://github.com/crispim1411/state_management/tree/master/lib/provider))

A lógica do elemento é separada da classe da tela, esta apenas tendo acesso aos eventos de notificação do Provider. O valor dentro do provedor permanece mesmo após trocar de rota.

```dart
_timer = Timer.periodic(
  const Duration(seconds: 2), 
  (_) => context.read<ApiProvider>().getValue()
);
...
Text(context.watch<ApiProvider>().screenValue)
```

É necessário também injetar o provider no contexto da aplicação conforme o trecho abaixo.

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ApiProvider(),
      child: const MyApp()
    )
  );
}
```
