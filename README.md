This project was generated using [Nx](https://nx.dev).

Getting Started
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

Lab: Write your first Flutter app
Cookbook: Useful Flutter samples
**Lab:** Write your first Flutter app
**Cookbook:** Useful Flutter samples
For help getting started with Flutter, view our online documentation, which offers tutorials, samples, guidance on mobile development, and a full API reference.

CodeBase Setup:
### CodeBase Setup:

1)Install yarn 
1) `yarn install`

2)To use NX-Console install the Nx Console VSCode Plugin from Marketplace
2) To use `NX-Console` install the **Nx Console VSCode Plugin from Marketplace**

To create application or library/module in Nx workspace
Please refer (https://www.npmjs.com/package/@nxrocks/nx-flutter#compatibility-with-nx)

## Adding capabilities to your workspace

Nx supports many plugins which add capabilities for developing different types of applications and different tools.

These capabilities include generating applications, libraries, etc as well as the devtools to test, and build projects as well.

Below are our core plugins:

- [React](https://reactjs.org)
  - `npm install --save-dev @nrwl/react`
- Web (no framework frontends)
  - `npm install --save-dev @nrwl/web`
- [Angular](https://angular.io)
  - `npm install --save-dev @nrwl/angular`
- [Nest](https://nestjs.com)
  - `npm install --save-dev @nrwl/nest`
- [Express](https://expressjs.com)
  - `npm install --save-dev @nrwl/express`
- [Node](https://nodejs.org)
  - `npm install --save-dev @nrwl/node`

There are also many [community plugins](https://nx.dev/community) you could add.

## Generate an application

Run `nx g @nrwl/react:app my-app` to generate an application.

> You can use any of the plugins above to generate applications as well.
When using Nx, you can create multiple applications and libraries in the same workspace.

## Generate a library

Run `nx g @nrwl/react:lib my-lib` to generate a library.

> You can also use any of the plugins above to generate libraries as well.
Libraries are shareable across libraries and applications. They can be imported from `@flutter-base-app/mylib`.
Run `nx g @nxrocks/nx-flutter:create <app-folder>` to generate an application.

## Development server
You will be prompted for entering the most commonly customized generation options (like application's `package`, `description`, `template`, etc).

Run `nx serve my-app` for a dev server. Navigate to http://localhost:4200/. The app will automatically reload if you change any of the source files.
To skip the interactive prompt, or if you want to customize all non-prompted options, you can pass them along directly when running the command, as such:

## Code scaffolding
`nx g @nxrocks/nx-flutter:create <app-folder> --optionName1 optionValue1 ... --optionNameN optionValueN`

Run `nx g @nrwl/react:component my-component --project=my-app` to generate a new component.

## Build
## Plugin Usage

Run `nx build my-app` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.
Once your app is generated, you can now use **buidlers** to manage it.

## Running unit tests
Here the list of available builders<sup>1</sup>:

Run `nx test my-app` to execute the unit tests via [Jest](https://jestjs.io).
| Builder        | Arguments        | Description                                |
| -------------- | ---------------- | ------------------------------------------ |
| `analyze`      | _see `flutter help analyze`_    | Analyze the project's Dart code |
| `assemble`     | _see `flutter help assemble`_   | Assemble and build Flutter resources |
| `attach`       | _see `flutter help attach`_     | Attach to a running app |
| `buildAar`     | _see `flutter help build aar`_  | Build a repository containing an AAR and a POM file |
| `buildApk`     | _see `flutter help build apk`_  | Build an Android APK file from your app |
| `buildAppbundle` | _see `flutter help build appbundle`_ | Build an Android App Bundle file from your app |
| `buildBundle`  | _see `flutter help build bundle`_ | Build the Flutter assets directory from your app |
| `buildIos`     | _see `flutter help build ios`_  | Build an iOS application bundle (Mac OS X host only) |
| `buildIosframework` | _see `flutter help build ios-framework`_ | Produces a .framework directory for a Flutter module and its plugins for integration into existing, plain Xcode projects |
| `buildIpa`     | _see `flutter help build ipa`_  | Build an iOS archive bundle (Mac OS X host only) |
| `clean`        | _see `flutter help clean`_      | Delete the `build/` and `dart_tool/` directories |
| `drive`        | _see `flutter help drive`_      | Run integration tests for the project on an attached device or emulator |
| `format`       | _see `flutter help format`_     | Format one or more Dart files |
| `gen-l10n`     | _see `flutter help gen-l10n`_   | Generate localizations for the current project |
| `install`      | _see `flutter help install`_    | Install a Flutter app on an attached device |
| `run`          | _see `flutter help run`_        | Run your Flutter app on an attached device |
| `screenshot`   | _see `flutter help screenshot`_ | Take a screenshot from a connected device |
| `symbolize`    | _see `flutter help symbolize`_  | Symbolize a stack trace from an AOT-compiled Flutter app |
| `test`         | _see `flutter help test`_       | Run Flutter unit tests for the current project |

Run `nx affected:test` to execute the unit tests affected by a change.
<sup>1</sup> : *Actual builders in your `workspace.json` will depend on the type of `flutter` project (`template`), target `platforms` that you choose to generate.*

## Running end-to-end tests
Each builder is based on an original project-level `flutter` command. The name is just **camelcased** to match builders' naming conventions.
Besides, the arguments accepted by each builder, are the same as the original `flutter` command they are based upon, encapsulated
under a generic `--args='...'` option.

Run `ng e2e my-app` to execute the end-to-end tests via [Cypress](https://www.cypress.io).
For example:

Run `nx affected:e2e` to execute the end-to-end tests affected by a change.
```
$ flutter gen-l10n --header "/// my header"
## Understand your workspace
becomes 👉🏾
Run `nx dep-graph` to see a diagram of the dependencies of your projects.
$ nx genL10n your-flutterapp --args='--header="/// my header"'
```

## Further help
> Note that the original `flutter` command name (`gen-l10n`) has been camelcased for creating its `nx-flutter` equivalent (`genL10n`)
Visit the [Nx Documentation](https://nx.dev) to learn more.
> Note that the arguments of the original `flutter` command are wrapped under `--args='...'` option in  the `nx-flutter` equivalent
