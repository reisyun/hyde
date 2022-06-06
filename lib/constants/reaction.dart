class Reaction {
  static const String surprise = 'surprise';

  static const String sad = 'sad';

  static const String bored = 'bored';

  static const String serenity = 'serenity';

  static const String joy = 'joy';

  static String name(String reaction) {
    switch (reaction) {
      case Reaction.surprise:
        return '놀람';
      case Reaction.sad:
        return '슬픔';
      case Reaction.bored:
        return '따분';
      case Reaction.serenity:
        return '평온';
      case Reaction.joy:
        return '행복';
      default:
        return '상태없음';
    }
  }
}
