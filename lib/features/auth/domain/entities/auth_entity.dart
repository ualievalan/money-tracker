import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

/// Represents an authenticated user in the Domain layer.
///
/// Intentionally minimal — only the fields the app logic needs,
/// never raw Supabase/Firebase types.
@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String id,
    required String email,
  }) = _AuthEntity;
}
