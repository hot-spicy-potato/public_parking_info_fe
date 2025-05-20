import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_time.freezed.dart';
part 'local_time.g.dart';

@freezed
class LocalTime with _$LocalTime {
  factory LocalTime({
    required int hour,
    required int minute,
    required int second,
    required int nano,
  }) = _LocalTime;

  factory LocalTime.fromJson(Map<String, dynamic> json) =>
      _$LocalTimeFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
