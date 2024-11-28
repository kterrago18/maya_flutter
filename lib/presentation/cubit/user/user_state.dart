part of 'user_cubit.dart';

enum AppState { initital, loading, loaded, error }

class UserState extends Equatable {
  final AppState appState;
  final num? availableBalance;
  const UserState({this.availableBalance, required this.appState});

  static UserState initial() =>
      const UserState(appState: AppState.initital, availableBalance: 0);

  @override
  List<Object?> get props => [appState, availableBalance];

  UserState copyWith({
    AppState? appState,
    num? availableBalance,
  }) {
    return UserState(
      appState: appState ?? this.appState,
      availableBalance: availableBalance ?? this.availableBalance,
    );
  }
}
