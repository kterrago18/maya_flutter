// part of 'firestore_cubit.dart';

// enum AppState { initital, loading, loaded, error }

// class FirestoreState extends Equatable {
//   final FirebaseFirestore firestore;
//   final AppState appState;

//   FirestoreState({
//     required this.appState,
//   }) : firestore = FirebaseFirestore.instance;

//   static FirestoreState initial() =>
//       FirestoreState(appState: AppState.initital);

//   @override
//   List<Object> get props => [appState];

//   FirestoreState copyWith({
//     AppState? appState,
//   }) {
//     return FirestoreState(
//       appState: appState ?? this.appState,
//     );
//   }
// }
