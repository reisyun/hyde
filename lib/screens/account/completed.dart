import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hyde/utils/read_json.dart';
import 'package:hyde/models/comment.dart';
import 'package:hyde/controllers/history_controller.dart';

import 'package:hyde/widgets/molecules/field.dart';
import 'package:hyde/widgets/organisms/history_list.dart';
import 'package:hyde/widgets/templates/page_template.dart';
import 'package:intl/intl.dart';

class CompletedScreen extends StatelessWidget {
  Future<List<Comment>> _getCommentData(String? userId) async {
    final data = await readJson('assets/data/comment.json');
    final find = data.where((i) => i['author']['id'] == userId);

    return find.map((c) => Comment.fromJson(c)).toList();
  }

  void _handleNavigateTo(String meidaId) {
    Get.toNamed('/document/$meidaId');
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return FutureBuilder(
        future: _getCommentData('u1'),
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          // data를 아직 받아 오지 못했을 때
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          // error가 발생했을 때
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final comments = snapshot.data!;

          return PageTemplate(
            title: '감상한',
            contents: [
              Field(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: HistoryList(
                  comments
                      .map((item) => HistoryItem(
                            id: item.id,
                            subtitle:
                                DateFormat('M월 d일').format(item.editedAt!),
                            emotion: "joy",
                            title: item.media.title,
                            image: item.media.banner,
                            review: item.content,
                            onPressed: () => _handleNavigateTo(item.media.id),
                          ))
                      .toList(),
                ),
              )
            ],
          );
        });
  }
}
