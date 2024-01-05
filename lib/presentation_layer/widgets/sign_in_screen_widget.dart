import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/presentation_layer/controllers/sign_in_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(signInScreenControllerProvider, (previous, state) {
      state.showSnackbarOnError(context);
    });

    final AsyncValue<void> state = ref.watch(signInScreenControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          // conditionally show a CircularProgressIndicator if the state is "loading"
          onPressed: state.isLoading
              ? null
              // otherwise, get the notifier and sign in
              : () => ref
                  .read(signInScreenControllerProvider.notifier)
                  .signInAnonymously(),
          // conditionally show a CircularProgressIndicator if the state is "loading"
          child: state.isLoading
              ? const CircularProgressIndicator()
              : const Text('Sign in anonymously'),
        ),
      ),
    );
  }
}

extension AsyncValueUI on AsyncValue {
  void showSnackbarOnError(BuildContext context) {
    if (!isLoading && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }
}