import 'package:eriell/screens/authorization/presentation/bloc/login_bloc.dart';
import 'package:eriell/utils/links.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hive.init((await getApplicationDocumentsDirectory()).path);
  // Hive.registerAdapter(AllOrdersAdapter());
  // Wakelock.enable();
  //  await Hive.openBox<OrdersHive>(CourierBoxName);
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ls<LoginBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
