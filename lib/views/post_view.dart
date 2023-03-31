import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/post_services.dart';
import '../controllers/post_controller.dart';

class Posts extends StatelessWidget {
  PostController PostController_con = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts Page'),
        ),
        body: Obx(() => ListView.builder(
            itemCount: PostController_con.postsList.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Text("${PostController_con.postsList[index].title}"),
                       ],
              );
            }))));
  }
}
