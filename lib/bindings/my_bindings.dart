import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../network/dio_client.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(DioClient(Dio()));
  }
}