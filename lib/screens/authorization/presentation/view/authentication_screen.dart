import 'package:eriell/utils/core/custom_button.dart';
import 'package:eriell/utils/core/enums.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../utils/core/custom_loader.dart';
import '../../../../utils/core/styles.dart';
import '../../../../utils/links.dart';
import '../bloc/login_bloc.dart';
import '../../../mainscreen/presentation/view/main_screen.dart' as mainScreen;

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static const routeName = '/auth-screen';
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _loginKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _loginForm()),
    );
  }

  Widget _loginForm() {
    return MultiBlocListener(
      listeners: [
        // BlocListener<LoginBloc, LoginState>(
        //   listenWhen: (old, current) => old.status != current.status,
        //   listener: (context, state) {
        //     final formStatus = state.status;
        //     if (state.status == Statuses.error &&
        //         state.username.isNotEmpty &&
        //         state.password.isNotEmpty) {
        //       // if (state.errorMessage?.contains("TimeoutException") ?? false) {
        //       //   _showSnackBar(context, LocalizationKeys.timeOutException.tr());
        //       // } else {
        //       //   _showSnackBar(
        //       //       context, LocalizationKeys.incorrectCredentials.tr());
        //       // }
        //     }
        //   },
        // ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == Statuses.error) {
              _showSnackBar(context, state.errorMessage ?? '');
            } else if (state.status == Statuses.success) {
              context.router.replaceNamed(mainScreen.MainScreen.routeName);
            }
          },
        ),
      ],
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 64,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                _usernameField(),
                _passwordField(),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    // var maskFormatter = MaskTextInputFormatter(
    //     mask: '+### (##) ###-##-##',
    //     filter: {"#": RegExp(r'[0-9]')},
    //     type: MaskAutoCompletionType.lazy);
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

              // (state.username.isNotEmpty && !isDigit(state.username[1])) ||
              //         state.username.isEmpty
              //     ? []
              //     : [
              //         MaskedInputFormatter('000 00 000 00 00'),
              //       ],
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

  Widget _passwordField() {
    final inputDecoration = returnTextDecoration(
        icon: const Icon(Icons.security),
        title: "Пароль",
        icon2: _obscureText
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.remove_red_eye_outlined),
        function: _toggle);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              TextFormField(
                obscureText: _obscureText,
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

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomElevatedButton(
          padding: const EdgeInsets.only(top: 32),
          onPressed: state.status == Statuses.loading
              ? null
              : () {
                  if (_formKey.currentState!.validate()) {
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

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
