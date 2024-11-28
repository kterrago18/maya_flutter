# maya_flutter

A Flutter project for Maya Flutter. The data read here is dynamic and it is stored in Firebase. I used it to make the data shown here feel real rather than using a fake API.

## Setup Instructions

#### 1. Clone the repository:

```bash
  git clone https://github.com/kterrago18/maya_flutter.git
```

#### 2. Open the project using IDE such as VSCode or Android Studio
Make you have installed Flutter SDK on your machine.

#### 3. Install dependencies

```bash
  flutter pub get
```
#### 4. Run the project

```bash
flutter run lib/main.dart
```

## Flutter version and Dependencies
#### Flutter version

```bash
  Flutter (Channel stable, 3.24.5, on macOS 14.6.1 23G93 darwin-arm64, locale en-PH)
```

#### Dependencies
```bash
  # For storing and reading dynamic data in cloud
  cloud_firestore: ^5.5.0

  # Helps simplify the process of value equality for objects
  equatable: ^2.0.7

  # firebase core package
  firebase_core: ^3.8.0

  # State management and bloc pattern
  flutter_bloc: ^8.1.6

  # Formatting currency
  intl: null

  # Formating date and time
  timeago: ^3.7.0
```

## Run Unit testing

#### 1. Install dependencies
```bash
  flutter pub get
```
#### 2. Run build runner dev depedency

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
#### 3. Run unit test files

```bash
flutter test test/unit_tests/user_cubit_test.dart
flutter test test/unit_tests/wallet_balance_cubit_test.dart
```

## Screens

This app consist 3 screens:

- Home
- Send Money
- Transactions

## Screenshots

![App Screenshot](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExY29zbmw5ZW9reTRtcWpwM3RnNHhnZmdoa3F4bTZ4aHhjcGpsY21tMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/KGwZFP9EXBnyeSSFK9/giphy.gif)


## Folder Structure

Here's a detailed folder structure for a Flutter project utilizing the BLoC (Business Logic Component) pattern:

    lib/
    ├── core/
    │   └── utils/
    │   └── configs/
    ├── data/
    │   ├── models/
    │   └── repositories/
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── usecases/
    └── presentation/
    |   ├── blocs/
    |   ├── cubit/
    |   └── screens/
    └── app.dart
    └── main.dart


## Developer

- Kenneth Terrago
- [github.com/kterrago18](https://github.com/kterrago18)
- terrago.kenneth.c@gmail.com

