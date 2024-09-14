import 'package:get/get.dart';

import '../modules/add_user/bindings/add_user_binding.dart';
import '../modules/add_user/views/add_user_view.dart';
import '../modules/edit_user/bindings/edit_user_binding.dart';
import '../modules/edit_user/views/edit_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/singup/bindings/singup_binding.dart';
import '../modules/singup/views/singup_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SINGUP,
      page: () => SingupView(),
      binding: SingupBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_USER,
      page: () => const EditUserView(),
      binding: EditUserBinding(),
    ),
  ];
}
