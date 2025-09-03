import 'package:dona_ya/core/authentication/login/login_view.dart';
import 'package:dona_ya/router.dart';

class AuthenticationRoutes {
  AuthenticationRoutes._();

  static const RouterPage login = RouterPage(name: 'login', path: '/login', view: LoginView());
}