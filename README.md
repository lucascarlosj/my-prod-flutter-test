# Teste para vaga dev. Freelancer Flutter - MyProd
Este repositório tem como fim testar os candidatos para vaga dev. Flutter Junior no projeto MyProd.


## Instruções Básicas
1. Faça um fork deste repositório
2. Implemente o layout de forma que fique fiel aos fontes mobile anexos neste teste
3. Atenção com espaçamentos e tamanhos de fonte
4. Qualquer contribuição para melhorar o resultado será bem vinda!
5. O usuário do GitHub utilizado no exemplo pode ser qualquer um de sua escolha
6. Utilizar a versão do Dart Sdk 2.19
7. Ao finalizar, atualize o README.md no seu repositório com as instruções para instalar e executar sua entrega

## Desafio:
1. Carregar os dados de forma dinâmica utilizando a [API do GitHub](https://developer.github.com/v3/)
2. Carregar os repositórios do usuário inicialmente
3. Carregar os favoritos do usuário ao acessar a tab **Starred**
4. Fazer uma busca ao digitar e fazer o submit com "Enter"

## O que esperamos no teste
* Um código Dart organizado com nomes de variáveis e funções auto explicativas em inglês - Clean code
* Qualidade de código
* Organização de componentes e widgets
* Semelhança do design fornecido e front-end desenvolvido

## Seria interessante de ver
* Usar alguma lib para gerenciamento de estado (preferencialmente GetX)

## Stack
* Dart/Flutter

## Material
Todo o layout está hospedado no Zeplin neste link: 
https://scene.zeplin.io/project/5b48f7870acff10844983114

## Envio do teste
1. Suba o repositório no seu Github e envie o link com o assunto: **Teste Dev. Flutter Junior** para Jackson Aguiar [jacksonwellington.sa@gmail.com](mailto:jacksonwellington.sa@gmail.com)

## Para rodar o projeto

Instale em sua máquina o gerenciador de versões do Flutter PURO.DEV ou siga os passos abaixo:

## Demonstração
![Demonstração](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdWpucWZ0ZWQza25rMXphZGxtcW50aXA4cmR1a3ZqbDloMHRhNGs0eiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3yP1dZJpNZtjGroOte/giphy.gif)

## Como executar

Abra seu PowerShell e execute o seguinte comando:

```bash
Invoke-WebRequest -Uri "https://puro.dev/builds/1.3.4/windows-x64/puro.exe" -OutFile "$env:temp\puro.exe"; &"$env:temp\puro.exe" install-puro --promote
```

Após isso, feche seu PowerShell e abra novamente e digite o seguinte comando:

```bash
puro create myprodenv 3.7.0
```

Agora dê um clone neste repositório e dentro da pasta, abra o terminal e digite este comando:
```bash
puro use myprodenv
```
Entre no projeto, vá no arquivo pubspec.yaml e clique em get packages, após isso, rode o projeto normalmente.
