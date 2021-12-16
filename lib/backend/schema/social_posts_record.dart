import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'social_posts_record.g.dart';

abstract class SocialPostsRecord
    implements Built<SocialPostsRecord, SocialPostsRecordBuilder> {
  static Serializer<SocialPostsRecord> get serializer =>
      _$socialPostsRecordSerializer;

  @nullable
  DateTime get postCreated;

  @nullable
  String get postImage;

  @nullable
  String get postVideo;

  @nullable
  String get postDescription;

  @nullable
  DocumentReference get postUser;

  @nullable
  String get postDisplayName;

  @nullable
  String get postUserImage;

  @nullable
  BuiltList<DocumentReference> get likes;

  @nullable
  @BuiltValueField(wireName: 'num_likes')
  int get numLikes;

  @nullable
  @BuiltValueField(wireName: 'num_comments')
  int get numComments;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SocialPostsRecordBuilder builder) => builder
    ..postImage = ''
    ..postVideo = ''
    ..postDescription = ''
    ..postDisplayName = ''
    ..postUserImage = ''
    ..likes = ListBuilder()
    ..numLikes = 0
    ..numComments = 0
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('socialPosts');

  static Stream<SocialPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SocialPostsRecord._();
  factory SocialPostsRecord([void Function(SocialPostsRecordBuilder) updates]) =
      _$SocialPostsRecord;

  static SocialPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSocialPostsRecordData({
  DateTime postCreated,
  String postImage,
  String postVideo,
  String postDescription,
  DocumentReference postUser,
  String postDisplayName,
  String postUserImage,
  int numLikes,
  int numComments,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        SocialPostsRecord.serializer,
        SocialPostsRecord((s) => s
          ..postCreated = postCreated
          ..postImage = postImage
          ..postVideo = postVideo
          ..postDescription = postDescription
          ..postUser = postUser
          ..postDisplayName = postDisplayName
          ..postUserImage = postUserImage
          ..likes = null
          ..numLikes = numLikes
          ..numComments = numComments
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
