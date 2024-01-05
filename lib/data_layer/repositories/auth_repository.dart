import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain_layer/app_user.dart';

abstract class AuthRepository {
  /// returns null if the user is not signed in
  AppUser? get currentUser;

  /// useful to watch auth state changes in realtime
  Stream<AppUser?> authStateChanges();

  Future<void> signOut();

  Future<void> signInAnonymously();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // This should be overridden in main file
  // TODO: read this https://codewithandrea.com/articles/flutter-repository-pattern/#abstract-or-concrete-classes
  return FakeAuthRepository();
});

class FakeAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentUser
  AppUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }
}
