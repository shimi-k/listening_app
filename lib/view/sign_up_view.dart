import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/component/lgoin_text.dart';
import 'package:listening_app/component/text_button_transition.dart';
import 'package:listening_app/component/text_form.dart';
import 'package:listening_app/view_model/common/toast.dart';
import 'package:listening_app/view_model/sign_up_view_model.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(signUpViewModelProvider);
    final inputMail = ref.watch(inputCreateUserMail);
    final inputPassword = ref.watch(inputCreateUserPassword);

    Future<bool> singUp() async {
      if (inputMail.text.isEmpty || inputPassword.text.isEmpty) {
        showToast(msg: 'email or password not entered');
        return false;
      }
      bool isUserExists = await authNotifier.signupUserWithFirebase(
        inputMail.text,
        inputPassword.text,
      );
      return isUserExists;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ情報登録画面'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CompLoginViewText(text: 'メールアドレス'),
              SizedBox(
                height: 50,
                child: CompTextForm(textController: inputMail),
              ),
              const CompLoginViewText(text: 'パスワード'),
              SizedBox(
                height: 50,
                child: CompTextForm(textController: inputPassword),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: authNotifier.isLoading
                    ? const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : SizedBox(
                        height: 50,
                        width: 300,
                        child: CompTextButtonTransition(
                            text: '新規登録',
                            textColor: Colors.black,
                            backgroundColor: Colors.amber,
                            onPressed: () {
                              singUp().then((value) {
                                if (value) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/home',
                                  );
                                }
                              });
                            }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
