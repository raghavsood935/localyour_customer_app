enum ItemConditionTypes {
  NotSet,
  Usable,
  Good,
  Excellent,
  New
}

extension ParseToString on ItemConditionTypes {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

enum MediaTypes {
  Image,
  Video,
  Audio,
  Other,
}