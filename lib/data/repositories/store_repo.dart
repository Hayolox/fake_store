import 'package:fake_store_app/data/model/detail_store_model.dart';
import 'package:fake_store_app/data/model/home_store_model.dart';
import 'package:fake_store_app/data/provider/store_provider.dart';

class StoreRepo {
  StoreProvider storeProvider = StoreProvider();

  Future<List<HomeStoreModel>> dataHome() async {
    List<dynamic> resultDataHomeStore = await storeProvider.getDataHomeStore();
    List<HomeStoreModel> dataHomeStoreModel = [];
    for (var element in resultDataHomeStore) {
      dataHomeStoreModel.add(HomeStoreModel.fromJson(element));
    }
    return dataHomeStoreModel;
  }

  Future<DetailStoreModel> dataDetail(int id) async {
    dynamic responseData = await storeProvider.getDetailDataStore(id);
    return DetailStoreModel.fromJson(responseData);
  }
}
