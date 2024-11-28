part of 'user_cubit.dart';

enum AppState { initital, loading, loaded, error }

class UserState extends Equatable {
  final AppState appState;
  final String? errorMessage;
  final num? availableBalance;
  const UserState(
      {this.errorMessage, this.availableBalance, required this.appState});

  static UserState initial() => const UserState(
      appState: AppState.initital, availableBalance: 0, errorMessage: null);

  @override
  List<Object?> get props => [appState, availableBalance, errorMessage];

  UserState copyWith({
    AppState? appState,
    num? availableBalance,
    String? errorMessage,
  }) {
    return UserState(
      appState: appState ?? this.appState,
      availableBalance: availableBalance ?? this.availableBalance,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
