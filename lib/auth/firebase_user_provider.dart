import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OvertrackerFirebaseUser {
  OvertrackerFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

OvertrackerFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OvertrackerFirebaseUser> overtrackerFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<OvertrackerFirebaseUser>(
        (user) => currentUser = OvertrackerFirebaseUser(user));
