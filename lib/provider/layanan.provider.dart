import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:smartlink/helper/dio.api.helper.dart';
import 'package:smartlink/model/failed.model.dart';
import 'package:smartlink/model/layanan.dart';

class LayananProvider {
  ApiBaseHelper api = ApiBaseHelper();

  Future<dynamic> getService({String search, int limit, int offset}) async {
    final url = '/layanan';
    print('$search');
    final jwt = JWT(
      {"q": search ?? '', "limit": limit ?? 10, "offset": offset ?? 0},
    );
    final data = {'jwt': jwt.sign(SecretKey('adaidelangsungjalan'))};

    try {
      final response = await api.postHTTP(url, data);
      if (response.data is List) {
        List data = response.data;
        List<Layanan> listLayanan =
            data.map((e) => Layanan.fromJson(e)).toList();
        print('List<ServiceModel>');
        return listLayanan;
      }

      if (response.data is FailedModel) {
        FailedModel failedModel = FailedModel.fromJson(response.data);
        print('failedModel');

        return failedModel.msg.toString();
      }
      return 'failed response';
    } catch (e) {
      print(e.toString());
    }
  }
}
