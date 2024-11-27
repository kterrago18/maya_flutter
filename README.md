# maya_flutter

A new Flutter project for Maya Flutter.

## Flutter Project Building

Run build.sh file on terminal

```bash
  ./build.sh
```

## Folder Structure

Here's a detailed folder structure for a Flutter project utilizing the BLoC (Business Logic Component) pattern:

    lib/
      |- bloc/
      |    |- counter/
      |    |     |- counter_bloc.dart
      |    |     |- counter_event.dart
      |    |     |- counter_state.dart
      |
      |- data/
      |    |- models/
      |    |     |- user.dart
      |    |
      |    |- repositories/
      |    |     |- user_repository.dart
      |    |
      |    |- usecases/
      |    |     |- get_user_usecase.dart
      |
      |- screens/
      |     |- home_screen.dart
      |     |- login_screen.dart
      |
      |- services/
      |      |- api_service.dart
      |
      |- utils/
      |     |- validators.dart
      |
      |- widgets/
      |     |- custom_button.dart
      |
      |- main.dart
