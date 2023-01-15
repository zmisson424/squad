import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/api/repositories/auth_repository.dart';
import 'package:squad/views/app/app.dart';
import 'package:squad/views/home/home.dart';
import 'package:squad/theme/theme.dart';
import 'package:squad/views/login/view/login_view.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authRepository: _authRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
      theme: squadTheme(),
      darkTheme: squadTheme(isDarkMode: true),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                _navigator.pushAndRemoveUntil(
                    HomeView.route(), (route) => false);
                break;
              case AuthStatus.unauthenticated:
                _navigator.pushAndRemoveUntil(
                    LoginView.route(), (route) => false);
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => HomeView.route(), // TODO: Add Splash,
    );
  }
}
