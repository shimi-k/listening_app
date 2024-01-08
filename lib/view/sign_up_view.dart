import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/component/lgoin_text.dart';
import 'package:listening_app/component/text_button_transition.dart';
import 'package:listening_app/component/text_form.dart';
import 'package:listening_app/view_model/sign_up_view_model.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(signUpViewModelProvider);
    final inputName = ref.watch(inputCreateUserName);
    final inputMail = ref.watch(inputCreateUserMail);
    final inputPassword = ref.watch(inputCreateUserPassword);

    void singUp() {
      authNotifier.signupUserWithFirebase(
        inputName.text,
        inputMail.text,
        inputPassword.text,
      );
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
              const CompLoginViewText(
                text: '名前',
              ),
              CompTextForm(textController: inputName),
              const CompLoginViewText(text: 'メールアドレス'),
              CompTextForm(textController: inputMail),
              const CompLoginViewText(text: 'パスワード'),
              CompTextForm(textController: inputPassword),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: CompTextButtonTransition(
                      text: '新規登録',
                      textColor: Colors.black,
                      backgroundColor: Colors.amber,
                      onPressed: singUp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
