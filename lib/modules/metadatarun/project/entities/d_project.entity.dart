import 'package:d2_remote/core/annotations/index.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/shared/entities/identifiable.entity.dart';

@AnnotationReflectable
@Entity(tableName: 'dProject', apiResourceName: 'projects')
class DProject extends IdentifiableEntity {
  @OneToMany(table: DActivity)
  List<DActivity>? activities;

  DProject(
      {required String uid,
      int? id,
      String? created,
      String? lastUpdated,
      required String? name,
      required String? shortName,
      String? code,
      String? displayName,
      this.activities,
      required dirty})
      : super(
            id: id,
            uid: uid,
            name: name,
            shortName: shortName,
            displayName: displayName,
            code: code,
            created: created,
            lastUpdated: lastUpdated,
            dirty: dirty);

  factory DProject.fromJson(Map<String, dynamic> json) {
    return DProject(
        id: json['id'],
        uid: json['uid'],
        name: json['name'],
        created: json['createdDate'],
        lastUpdated: json['lastModifiedDate'],
        shortName: json['shortName'],
        code: json['code'],
        displayName: json['displayName'],
        activities: List<dynamic>.from(json['activities'] ?? [])
            .map((activity) => DActivity.fromJson(
                {...activity, 'project': json['id'], 'dirty': false}))
            .toList(),
        dirty: json['dirty']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdated'] = this.lastUpdated;
    data['uid'] = this.uid;
    data['id'] = this.id;
    data['createdDate'] = this.created;
    data['lastModifiedDate'] = this.lastUpdated;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['code'] = this.code;
    data['displayName'] = this.displayName;
    data['activities'] = this.activities;
    data['dirty'] = this.dirty;
    return data;
  }
}
