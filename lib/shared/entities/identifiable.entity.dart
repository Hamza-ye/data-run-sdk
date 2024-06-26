import 'package:d2_remote/core/annotations/index.dart';
import 'package:d2_remote/shared/entities/base.entity.dart';

@AnnotationReflectable
class IdentifiableEntity extends BaseEntity {
  @Column(nullable: true)
  String? name;

  @Column(nullable: true)
  final String? displayName;

  @Column(nullable: true)
  final String? shortName;

  @Column(nullable: true)
  final String? code;

  IdentifiableEntity({
    String? uid,
    int? id,
    required bool dirty,
    this.name,
    this.displayName,
    this.shortName,
    String? lastUpdated,
    String? created,
    this.code,
  }) : super(id: id, uid: uid, dirty: dirty, created: created, lastUpdated: lastUpdated);
}
