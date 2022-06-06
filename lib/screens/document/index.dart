import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyde/constants/reaction.dart';
import 'package:hyde/models/media.dart';

import 'package:hyde/widgets/templates/document_template.dart';

import 'package:hyde/screens/document/comment.dart';
import 'package:hyde/screens/document/media_details.dart';
import 'package:hyde/screens/document/reaction_details.dart';

class DocumentScreen extends StatelessWidget {
  // Fetch content from the json file
  Future<List<dynamic>> _readJson(String source) async {
    String response = await rootBundle.loadString(source);
    List<dynamic> data = await json.decode(response);

    return data;
  }

  Future<dynamic> _getMediaData(String? mediaId) async {
    var data = await _readJson('assets/data/media.json');
    var media = data.firstWhere((i) => i['id'] == mediaId);

    return media;
  }

  @override
  Widget build(BuildContext context) {
    final String? documentId = Get.parameters['id'];
    const Widget renderSpace = SizedBox(height: 12);

    return FutureBuilder(
      future: _getMediaData(documentId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // data를 아직 받아 오지 못했을 때
        if (snapshot.hasData == false) {
          return const Center(child: CircularProgressIndicator());
        }
        // error가 발생했을 때
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final media = Media(
          id: snapshot.data['id'],
          title: snapshot.data['title'],
          type: snapshot.data['type'],
          status: MediaStatus.values.byName(snapshot.data['status']),
          keywords: List<String>.from(snapshot.data['genres']),
          bannerImage: snapshot.data['bannerImage'],
          synopsis: snapshot.data['synopsis'],
        );

        return DocumentTemplate(
          media: media,
          contents: const [
            ReactionDetailsSection([
              ReacionDetailsItem(name: Reaction.joy, votes: 8888),
              ReacionDetailsItem(name: Reaction.serenity, votes: 3720),
              ReacionDetailsItem(name: Reaction.surprise, votes: 411),
            ]),
            renderSpace,
            CommentSection([
              CommentItem('VeC', '남자도 보고 빠진다는 남주의 매력'),
              CommentItem('아이린', '로맨스만이 아니더라도 우정에 관해서 뭉클하게 잘 잡아내는 거 너무 좋다'),
            ]),
            renderSpace,
            MediaDetailsSection([
              MediaDetailsItem('제작사', 'Clover Works'),
              MediaDetailsItem('방영일', '2021년 1분기'),
              MediaDetailsItem('감독', '이시하마 마사시'),
              MediaDetailsItem('원작', 'Hero'),
            ]),
          ],
        );
      },
    );
  }
}
