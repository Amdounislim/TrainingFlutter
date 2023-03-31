import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/posts_model.dart';
import '../network/dio_exception.dart';
import '../routes/app_routes.dart';
import '../services/post_services.dart';

class PostController extends GetxController {
  var isLoading = false;
  void onInit() {
    getPostsList();
    super.onInit();
  }

  late final RxList<Post> postsList = <Post>[].obs;
  Future<void> getPostsList() async {
    try {
      final response = await PostServices()
          .getPosts('https://jsonplaceholder.typicode.com/posts');

      final postsListData = response.data as List<dynamic>;

      // print(postsListData);
      // var leg = postsListData.map((e) => e).toList();

      // print(leg);

      postsList.assignAll(
        postsListData.map((e) => Post.fromJson(e)).toList(),
      );
      print("postsListggggggggggg $postsList");
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (errorMessage == 'Unauthorized') {
        Get.offNamed(AppRoutes.home);
      }
      throw errorMessage;
    }
  }
}
