import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';

class SearchController extends GetxController {
  final FireDataProvider fireDataProvider = Get.find<FireDataProvider>();
  final AuthDataProvider auth = Get.find<AuthDataProvider>();
}
