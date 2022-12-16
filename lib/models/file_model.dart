import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable()
class FileModel{
  String? src;
  String? name;

  FileModel({
   this.name,
   this.src
});

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);
  Map<String, dynamic> toJson() => _$FileModelToJson(this);

}