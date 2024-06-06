import 'package:d2_remote/core/annotations/index.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:d2_remote/modules/metadatarun/village_location/entities/d_organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadatarun/warehouse/entities/warehouse.entity.dart';
import 'package:d2_remote/shared/entities/identifiable.entity.dart';

@AnnotationReflectable
@Entity(tableName: 'dAssignment', apiResourceName: 'assignments')
class DAssignment extends IdentifiableEntity {
  @ManyToOne(table: DActivity, joinColumnName: 'activity')
  dynamic activity;

  @ManyToOne(table: DTeam, joinColumnName: 'team')
  dynamic team;

  @ManyToOne(table: DOrganisationUnit, joinColumnName: 'organisationUnit')
  dynamic organisationUnit;

  @ManyToOne(table: Warehouse, joinColumnName: 'warehouse')
  dynamic warehouse;

  @Column(type: ColumnType.BOOLEAN)
  bool activated;

  @Column(nullable: true)
  String? startDate;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? status;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? targetSource;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? startPeriod;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? period;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? periodType;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? gov;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? district;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? subdistrict;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? village;

  @Column(type: ColumnType.TEXT, nullable: true)
  String? subvillage;

  DAssignment(
      {required String uid,
      required String id,
      String? created,
      String? lastUpdated,
      String? name,
      String? code,
      this.activated = true,
      this.warehouse,
      this.activity,
      this.organisationUnit,
      this.team,
      this.startDate,
      this.status,
      this.startPeriod,
      this.period,
      this.periodType,
      this.gov,
      this.district,
      this.subdistrict,
      this.village,
      this.subvillage,
      required dirty})
      : super(
            id: id,
            uid: uid,
            name: name,
            code: code,
            created: created,
            lastUpdated: lastUpdated,
            dirty: dirty);

  factory DAssignment.fromJson(Map<String, dynamic> json) {
    // final team = json['team'] is int ? json['team'] : json['team']['id'];
    // final activity = json['activity'] is int ? json['activity'] : json['activity']['id'];
    // // final organisationUnit = json['organisationUnit'] is int ? json['organisationUnit'] : json['organisationUnit']['id'];
    // final warehouse = json['warehouse'] is int ? json['warehouse'] : json['warehouse']['id'];

    return DAssignment(
        id: json['id'].toString(),
        uid: json['uid'],
        name: json['name'] ??
            '${json['subvillage'] != null ? json['subvillage'] : json['village']}',
        activated: json['activated'] ?? true,
        created: json['createdDate'],
        lastUpdated: json['lastModifiedDate'],
        code: json['code'],
        activity: json['activity'] is String
            ? json['activity']
            : json['activity']['uid'],
        organisationUnit: json['organisationUnit'] is String
            ? json['organisationUnit']
            : json['organisationUnit']['uid'],
        warehouse: json['warehouse'] is String
            ? json['warehouse']
            : json['warehouse']['uid'],
        team: json['team'] is String ? json['team'] : json['team']['uid'],

        //warehouse,
        startDate: json['startDate'],
        status: json['status'],
        startPeriod: json['startPeriod'],
        period: json['period'],
        periodType: json['periodType'],
        gov: json['gov'],
        district: json['district'],
        subdistrict: json['subdistrict'],
        village: json['village'],
        subvillage: json['subvillage'],
        dirty: json['dirty']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['activated'] = this.activated;
    data['createdDate'] = this.created;
    data['lastModifiedDate'] = this.lastUpdated;
    data['shortName'] = this.shortName;
    data['code'] = this.code;
    data['displayName'] = this.displayName;
    data['activity'] = this.activity;
    data['organisationUnit'] = this.organisationUnit;
    data['team'] = this.team;
    data['warehouse'] = this.warehouse;
    data['startDate'] = this.startDate;
    data['status'] = this.status;
    data['startPeriod'] = this.startPeriod;
    data['period'] = this.period;
    data['periodType'] = this.periodType;
    data['gov'] = this.gov;
    data['district'] = this.district;
    data['subdistrict'] = this.subdistrict;
    data['village'] = this.village;
    data['subvillage'] = this.subvillage;
    data['dirty'] = this.dirty;
    return data;
  }
}
