import 'package:d2_remote/core/annotations/index.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/shared/entities/identifiable.entity.dart';

@AnnotationReflectable
@Entity(tableName: 'dTeam', apiResourceName: 'teams')
class DTeam extends IdentifiableEntity {
  @ManyToOne(table: DActivity, joinColumnName: 'activity')
  dynamic activity;

  @Column(type: ColumnType.BOOLEAN)
  bool inactive;

  @Column(nullable: true)
  bool? synced;

  @Column(nullable: true)
  final String? mobile;

  DTeam(
      {required String uid,
      int? id,
      String? created,
      String? lastUpdated,
      required String name,
      String? shortName,
      String? code,
      String? displayName,
      this.mobile,
      this.activity,
      required this.inactive,
      this.synced,
      required dirty})
      : super(
            uid: uid,
            id: id,
            name: name,
            shortName: shortName,
            displayName: displayName,
            code: code,
            created: created,
            lastUpdated: lastUpdated,
            dirty: dirty);

  factory DTeam.fromJson(Map<String, dynamic> json) {
    return DTeam(
        id: json['id'],
        uid: json['uid'],
        name: json['name'],
        created: json['createdDate'],
        lastUpdated: json['lastModifiedDate'],
        shortName: json['shortName'],
        code: json['code'],
        displayName: json['displayName'],
        activity: json['activity'],
        mobile: json['mobile'],
        inactive: json['inactive'] ?? false,
        synced: json['synced'],
        dirty: json['dirty']);
  }

  factory DTeam.fromApi(Map<String, dynamic> jsonData) {
    return DTeam(
        id: jsonData['id'],
        uid: jsonData['uid'],
        name: jsonData['name'],
        created: jsonData['created'],
        shortName: jsonData['shortName'],
        code: jsonData['code'],
        displayName: jsonData['displayName'],
        activity: jsonData['activity'],
        inactive: jsonData['inactive'] ?? false,
        mobile: jsonData['mobile'],
        dirty: jsonData['dirty'] ?? false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdated'] = this.lastUpdated;
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['createdDate'] = this.created;
    data['lastModifiedDate'] = this.lastUpdated;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['code'] = this.code;
    data['displayName'] = this.displayName;
    data['activity'] = this.activity;
    data['inactive'] = this.inactive;
    data['mobile'] = this.mobile;
    data['synced'] = this.synced;
    data['dirty'] = this.dirty;
    return data;
  }
}
