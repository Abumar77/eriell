import '../../../../utils/links.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const routeName = '/reg-screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () =>
              context.router.pushNamed(AuthenticationScreen.routeName),
        ),
        title: Text("Registration screen"),
      ),
      body: SafeArea(child: _regForm()),
    );
  }

  Widget _regForm() {
    return Form(
      key: _formKey,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == Statuses.registered) {
            context.router.pushNamed(AuthenticationScreen.routeName);
          }
        },
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
                regButton(_formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
