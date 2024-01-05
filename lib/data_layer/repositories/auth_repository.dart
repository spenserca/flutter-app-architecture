import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain_layer/app_user.dart';

abstract class AuthRepository {
  /// returns null if the user is not signed in
  AppUser? get currentUser;

  /// useful to watch auth state changes in realtime
  Stream<AppUser?> authStateChanges();

// other sign in methods
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // This should be overridden in main file
  // TODO: read this https://codewithandrea.com/articles/flutter-repository-pattern/#abstract-or-concrete-classes
  throw UnimplementedError();
});
