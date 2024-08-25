import 'package:equatable/equatable.dart' show EquatableMixin;
import 'package:flutter/foundation.dart' show immutable;
import 'package:form_fields/form_fields.dart';
import 'package:formz/formz.dart' show FormzInput;

/// {@template name}
/// Form input for a name. It extends [FormzInput] and uses
/// [UsernameValidationError] for its validation errors.
/// {@endtemplate}
@immutable
class Username extends FormzInput<String, UsernameValidationError>
    with EquatableMixin, FormzValidationMixin {
  /// {@macro name.pure}
  const Username.pure([super.value = '']) : super.pure();

  /// {@macro name.dirty}
  const Username.dirty(super.value) : super.dirty();

  static final _nameRegex = RegExp(r'^[a-zA-Z0-9_.]{3,16}$');

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    if (!_nameRegex.hasMatch(value)) return UsernameValidationError.invalid;
    return null;
  }

  @override
  Map<UsernameValidationError?, String?> get validationErrorMessage => {
        UsernameValidationError.empty: "Maydon to'ldirilishi kerak",
        UsernameValidationError.invalid:
            // ignore: lines_longer_than_80_chars
            "Foydalanuvchi ismi 3-16 uzunlikda bo'lishi kerak. Ismda harflar, raqamlar, nuqtalar va pastki chiziqlar ishlatilishi mumkin",
        null: null,
      };

  @override
  List<Object?> get props => [value, pure];
}

/// Validation errors for [Username]. It can be empty or invalid.
enum UsernameValidationError {
  /// Empty name.
  empty,

  /// Invalid name.
  invalid,
}
