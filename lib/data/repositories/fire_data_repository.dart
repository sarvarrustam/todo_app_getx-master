import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/data/models/base_model.dart';

class FireDataRepository extends GetxService {
  late final FireDataProvider? _dataProvider;
  FireDataRepository() {
    _dataProvider = Get.find<FireDataProvider>();
    log('Firestore Repo Inited');
  }

  Future<bool> createDataCollectionRepo<T extends BaseModel>(
      {required T? data,
      required String? collectionName,
      required String? id}) async {
    try {
      final dataPro = await _dataProvider!.createDataCollection<T>(
          data: data, collectionName: collectionName, id: id);
      return dataPro;
    } catch (e, s) {
      log('Firebase Exception');
      log(e.toString());
      log(s.toString());
    }

    return false;
  }
}
