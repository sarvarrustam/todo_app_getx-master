import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';
import 'package:todo_app_getx/utils/theme/themes.dart';

class ProfileController extends GetxController {
  late final AuthDataProvider _auth;
  late final FireDataProvider _firestore;
  @override
  void onInit() async {
    _auth = Get.find<AuthDataProvider>();
    _firestore = Get.find<FireDataProvider>();
    AppTheme.currentSavedTheme = AppTheme.currentSavedTheme;
    super.onInit();
  }

  signOut() async {
    await _auth.auth.signOut();
    Get.toNamed(AppRouteNames.signUp.route);
    Get.snackbar('auth', 'Signed Out');
  }

  changeTheme(AdaptiveThemeMode mode) {
    AppTheme.currentSavedTheme = mode;
    update();
  }

  AuthDataProvider get authDataProvider => _auth;
  FireDataProvider get fireDataProvider => _firestore;
}
