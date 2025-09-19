import 'package:dona_ya/core/authentication/abstractions/repositories/auth_service.dart';
import 'package:dona_ya/core/authentication/modules/login/bloc/login_bloc.dart';
import 'package:dona_ya/core/authentication/modules/login/login_view.dart';
import 'package:dona_ya/core/authentication/modules/register/register_view.dart';
import 'package:dona_ya/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationRoutes {
  AuthenticationRoutes._();

  static RouterPage login = RouterPage(
    name: 'login',
    path: '/login',
    view: BlocProvider(create: (context) => LoginBloc(
      authenticationService: context.read<AuthService>(),
    ), child: LoginView())
  );

  static RouterPage register = RouterPage(
    name: 'register',
    path: '/register',
    view: RegisterView()
  );
}
