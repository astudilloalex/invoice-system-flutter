import 'package:go_router/go_router.dart';
import 'package:invoice_system/ui/pages/sign-in/sign_in_page.dart';
import 'package:invoice_system/ui/routes/route_names.dart';

class RoutePages {
  const RoutePages._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.signIn,
    routes: [
      GoRoute(
        path: RouteNames.signIn,
        builder: (context, state) => const SignInPage(),
      ),
    ],
  );
}
