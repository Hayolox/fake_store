import 'package:fake_store_app/constant/api.dart';

class StoreProvider {
  final API _api = API();

  Future<List<dynamic>> getDataHomeStore() async {
    final response = await _api.dio.get('products');
    return response.data;
  }

  Future<Map<String, dynamic>> getDetailDataStore(int i) async {
    final response = await _api.dio.get('products/$i');
    return response.data;
  }
}
