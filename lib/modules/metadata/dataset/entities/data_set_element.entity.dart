import 'package:d2_remote/core/annotations/index.dart';
import 'package:d2_remote/modules/metadata/dataset/entities/data_set.entity.dart';
import 'package:d2_remote/modules/metadata/dataset/entities/data_set_element_option.entity.dart';
import 'package:d2_remote/shared/entities/identifiable.entity.dart';

@AnnotationReflectable
@Entity(tableName: 'datasetelement', apiResourceName: 'dataSetElements')
class DataSetElement extends IdentifiableEntity {
  @Column()
  String dataElementId;

  @ManyToOne(table: DataSet, joinColumnName: 'dataSet')
  dynamic dataSet;

  @OneToMany(table: DataSetElementOption)
  List<DataSetElementOption>? options;

  DataSetElement(
      {required String id,
      required String name,
      required bool dirty,
      required this.dataElementId,
      this.dataSet,
      this.options})
      : super(uid: id, name: name, dirty: dirty);

  factory DataSetElement.fromJson(Map<String, dynamic> json) {
    return DataSetElement(
      id: json['id'],
      name: json['name'],
      dirty: json['dirty'],
      dataSet: json['dataSet'],
      dataElementId: json['dataElementId'],
      options: List<dynamic>.from(
              json['options'] ?? json['optionSet']?['options'] ?? [])
          .map((option) => DataSetElementOption.fromJson({
                ...option,
                'id': '${option['id']}_${json['id']}}',
                'dataSetElement': json['id'],
                'dirty': false
              }))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.id;
    data['name'] = this.name;
    data['dirty'] = this.dirty;
    data['dataSet'] = this.dataSet;
    data['dataElementId'] = this.dataElementId;
    data['options'] = this.options;
    return data;
  }
}
