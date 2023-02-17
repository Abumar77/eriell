import 'package:flutter/material.dart';

import '../../../../../utils/core/custom_button.dart';
import '../../../../../utils/core/custom_loader.dart';
import '../../../../../utils/core/enums.dart';
import '../../../../../utils/core/styles.dart';
import '../../../../../utils/links.dart';
import '../../bloc/login_bloc.dart';

Widget usernameField() {
  final inputDecoration = returnTextDecoration(
      icon: const Icon(Icons.phone), title: "Login / Phone Number");
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            // key: _loginKey,
            decoration: inputDecoration,
            validator: (value) =>
                state.isValidUsername ? null : "Некорректные данные",
            onChanged: (value) {
              print(value);
              context.read<LoginBloc>().add(
                    LoginUsernameChanged(
                      username: value
                          .replaceAll("+", "")
                          .replaceAll(" ", "")
                          .replaceAll("(", "")
                          .replaceAll(")", "")
                          .replaceAll("-", ""),
                    ),
                  );
            }),
      );
    },
  );
}

Widget loginButton(dynamic formKey) {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return CustomElevatedButton(
        padding: const EdgeInsets.only(top: 32),
        onPressed: state.status == Statuses.loading
            ? null
            : () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmit());
                }
              },
        child: state.status == Statuses.loading
            ? const CustomLoader(
                height: 24,
                width: 24,
              )
            : const Text(
                'Отправить',
                style: kBodyWhiteStyle16,
              ),
      );
    },
  );
}

Widget regButton(dynamic formKey) {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return CustomElevatedButton(
        padding: const EdgeInsets.only(top: 32),
        onPressed: state.status == Statuses.loading
            ? null
            : () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(RegisterSubmit());
                }
              },
        child: state.status == Statuses.loading
            ? const CustomLoader(
                height: 24,
                width: 24,
              )
            : const Text(
                'Зарегестрироваться',
                style: kBodyWhiteStyle16,
              ),
      );
    },
  );
}

Widget passwordField(bool obscureText, Function toggle) {
  final inputDecoration = returnTextDecoration(
      icon: const Icon(Icons.security),
      title: "Пароль",
      icon2: obscureText
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.remove_red_eye_outlined),
      function: toggle);
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            TextFormField(
              obscureText: obscureText,
              decoration: inputDecoration,
              validator: (value) =>
                  state.isValidPassword ? null : "Неправильный формат пароля",
              onChanged: (value) => context.read<LoginBloc>().add(
                    LoginPasswordChanged(password: value),
                  ),
            ),
          ],
        ),
      );
    },
  );
}
