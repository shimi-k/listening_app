import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listening_app/component/lgoin_text.dart';
import 'package:listening_app/component/text_form.dart';
import 'package:listening_app/component/text_icon_button_transition.dart';
import 'package:listening_app/component/toggle_buttons.dart';
import 'package:listening_app/view_model/login_view_model.dart';

import '../component/text_button_transition.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider);
    final inputMail = ref.watch(inputLoginMail);
    final inputPassword = ref.watch(inputLoginPassword);
    final isPasswordHidden = ref.watch(isHidden);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CompLoginViewText(
                  text: 'LOG IN',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                const CompLoginViewText(text: '必要なログイン情報をご入力ください。'),
                const SizedBox(
                  height: 30,
                ),
                const CompToggleButton(),
                const SizedBox(
                  height: 20,
                ),
                const CompLoginViewText(text: 'メールアドレス'),
                SizedBox(
                  height: 50,
                  child: CompTextForm(
                    textController: inputMail,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CompLoginViewText(text: 'パスワード'),
                SizedBox(
                  height: 50,
                  child: CompTextForm(
                    textController: inputPassword,
                    isObScureText: isPasswordHidden,
                  ),
                ),
                Row(
                  children: [
                    // CompCheckBox(),
                    Checkbox(
                        value: isPasswordHidden,
                        onChanged: (value) {
                          ref.read(isHidden.notifier).state = !isPasswordHidden;
                        }),
                    const CompLoginViewText(
                      text: 'パスワードを非表示にする',
                      fontSize: 12,
                    )
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: CompTextButtonTransition(
                            nextPageName: '/createUserPage',
                            text: 'ログイン',
                            backgroundColor: Colors.amber[800],
                            textColor: Colors.white,
                            onPressed: () {
                              authNotifier.loginUserWithFirebase(
                                inputMail.text,
                                inputPassword.text,
                              );
                              Navigator.pushNamed(context, '/createUserPage');
                            }),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Divider()),
                      Expanded(
                          flex: 0, child: CompLoginViewText(text: '   OR   ')),
                      Expanded(flex: 3, child: Divider()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: CompTextIconButtonTransition(
                          text: '新規登録',
                          icon: const Icon(Icons.account_box_sharp),
                          nextPageName: '',
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          onPressed: () => authNotifier.signupUserWithFirebase(
                            inputMail.text,
                            inputPassword.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
