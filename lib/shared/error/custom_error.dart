import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_error.freezed.dart';

@freezed
class CustomError with _$CustomError {
  const factory CustomError.unexpected({
    @Default('Unexpected Error') String message,
  }) = _UnexpectedError;
}
