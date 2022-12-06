# Gerenciamento de Estados no Flutter
Aplicação feita em Flutter implementando diversas abordagens para gerenciamento de estados. 
Entre eles, setState, Provider, BLoC,... (incluir conforme for implementando)
As implementações foram separadas na estrutura do aplicativo por rotas.

Os dados são requisitados de uma api pública que serve números randômicos. O objetivo é ter chamadas regulares atualizando o valor na tela. Utilizando **Time.periodic**
```
Timer.periodic(const Duration(seconds: 2), getValue());
```

## Abordagens
### setState
[Implementação](https://github.com/crispim1411/state_management/tree/master/lib/setState)
A lógica do elemento encontra total ou parcialmente dentro da implementação da interface. 
