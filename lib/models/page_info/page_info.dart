import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';

@JsonSerializable()
class PageInfo {
  final int totalResults;
  final int resultsPerPage;

  const PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> data) =>
      _$PageInfoFromJson(data);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}
