# Code Hero APP

O principal objetivo deste app é realizar chamadas na API da Marvel para obter os hérois, com paginação, e para obter por meio do nome do herói.

App desenvolvido em Flutter e visando implementar, de forma bem simples, boas práticas de programação.

Separação de Widgets complextos em componentes, abstração das chamadas da API, utilização de arquivo `.env` para manter em segurança as chaves de API.

## Vamos começar

Para iniciar esse app, você precisa clonar este código por meio do `git clone`, após isso, rodar o comando `flutter pub get` para obter as dependências necessárias para execução do mesmo.

É de extrema importância que você crie na raiz de seu projeto, após clonar, um arquivo `.env` seguindo a estrutura abaixo:

`{
    "API_KEY": "SUA_MARVEL_API_KEY",
    "HASH": "SUA_MARVEL_HASH"
}
`

Feito isso, basta rodar o projeto pelo comando abaixo:

`flutter run — dart-define-from-file=.env`

Caso utilize o F5 para rodar o projeto, atualize o seu arquivo launch.json com a seguinte propriedade:
`"toolArgs": [
                "--dart-define-from-file",
                ".env"
            ]
`

## Criar APK

Para criar o *apk* deste app, rode o comando abaixo:

`flutter build apk --release --dart-define-from-file=.env`

## Screenshots

Algumas recursos para começar, se este for o seu primeiro projeto Flutter:

- [Escreva seu primeiro aplicativo Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Amostras úteis do Flutter](https://docs.flutter.dev/cookbook)

Para obter ajuda para começar o desenvolvimento com o Flutter, consulte a
[documentação online](https://docs.flutter.dev/),  que oferece tutoriais,
amostras, orientações sobre desenvolvimento móvel e uma referência completa da API.
