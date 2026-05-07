import '../../../../core/domain/enums/favorite_type.dart';

class FavoriteItem {
  const FavoriteItem({
    required this.id,
    required this.type,
    required this.referenceId,
    required this.title,
    this.subtitle,
    this.imageUrl,
    required this.createdAt,
  });

  final String id;
  final FavoriteType type;
  final String referenceId;
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final DateTime createdAt;

  String get identityKey => '${type.name}:$referenceId';

  FavoriteItem copyWith({DateTime? createdAt}) {
    return FavoriteItem(
      id: id,
      type: type,
      referenceId: referenceId,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
