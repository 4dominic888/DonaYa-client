import 'package:dona_ya/core/authentication/abstractions/repositories/authentication_repository.dart';
import 'package:dona_ya/core/authentication/login/bloc/login_bloc.dart';
import 'package:dona_ya/core/authentication/login/login_view.dart';
import 'package:dona_ya/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationRoutes {
  AuthenticationRoutes._();

  static RouterPage login = RouterPage(
    name: 'login',
    path: '/login',
    view: BlocProvider(create: (context) => LoginBloc(
      authenticationRepository: context.read<AuthRepository>(),
    ), child: LoginView())
  );
}
