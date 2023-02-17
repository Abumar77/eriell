import '../../../../utils/links.dart';
import '../../../authorization/presentation/view/authentication_screen.dart'
    as authScreen;

class SplashPage extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () async {
      context.router.replaceNamed(authScreen.AuthenticationScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Logo(),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
