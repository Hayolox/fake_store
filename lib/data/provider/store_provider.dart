import 'package:fake_store_app/constant/api.dart';
import 'package:fake_store_app/data/model/detail_store_model.dart';
import 'package:fake_store_app/data/model/home_store_model.dart';

class StoreProvider {
  final API _api = API();

  Future<List<dynamic>> getDataHomeStore() async {
    final response = await _api.dio.get('products');
    return response.data;
  }

  Future<Map<String, dynamic>> getDetailDataStore(int i) async {
    final response = await _api.dio.get('products/$i');
    print(response.data);
    return response.data;
  }
}
