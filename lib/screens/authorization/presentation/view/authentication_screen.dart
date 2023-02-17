import '../../../../utils/links.dart';

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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == Statuses.authenticated) {
          context.router.replaceNamed(MainScreen.routeName);
        } else if (state.status == Statuses.error) {
          _showSnackBar(context, "Ошибка такого пользователя не существует");
        }
      },
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
                usernameField(),
                passwordField(_obscureText, _toggle),
                loginButton(_formKey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Нет аккаунта ?"),
                    TextButton(
                      child: Text(
                        "Зарегистрироваться",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () => context.router
                          .pushNamed(RegistrationScreen.routeName),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
