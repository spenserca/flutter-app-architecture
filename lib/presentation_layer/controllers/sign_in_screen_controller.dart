import 'dart:async';

import 'package:flutter_app_architecture/data_layer/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_screen_controller.g.dart';

@riverpod
class SignInScreenController extends _$SignInScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> signInAnonymously() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    // AsyncValue.guard is a handy alternative to try/catch. For more info, read this:
    // https://codewithandrea.com/tips/async-value-guard-try-catch/
    state = await AsyncValue.guard(authRepository.signInAnonymously);
  }
}