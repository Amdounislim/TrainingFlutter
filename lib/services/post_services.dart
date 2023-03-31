import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../network/dio_client.dart';

class PostServices {

  DioClient dioClient = Get.find();
  Future<Response> getPosts(String url) async {
   
    try {
      var response = await dioClient.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}