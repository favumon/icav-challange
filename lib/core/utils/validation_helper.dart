import 'package:reactive_forms/reactive_forms.dart';

import '../validation_params.dart';

Map<String, String> generateValidationsMessages(
    String fieldName, ValidationParams validationParams,
    {String? matchingFieldName, String? customPatternMessage}) {
  return {
    if (validationParams.isRequired != null && validationParams.isRequired!)
      ValidationMessage.required: 'The $fieldName must not be empty',
    if (validationParams.isEmail != null && validationParams.isEmail!)
      ValidationMessage.email: 'The $fieldName must be valid',
    if (matchingFieldName != null)
      ValidationMessage.mustMatch:
          '$matchingFieldName and $fieldName should match',
    if (validationParams.pattern != null)
      ValidationMessage.pattern: customPatternMessage ?? '',
    if (validationParams.minLength != null)
      ValidationMessage.minLength:
          '$fieldName should be minimum ${validationParams.minLength}',
  };
}

generateValidationsNonString(ValidationParams validationParams) {
  return [
    if (validationParams.isRequired != null && validationParams.isRequired!)
      Validators.required,
    if (validationParams.isEmail != null && validationParams.isEmail!)
      Validators.email,
    if (validationParams.pattern != null)
      Validators.pattern(validationParams.pattern!),
    if (validationParams.minLength != null)
      Validators.minLength(validationParams.minLength!),
    if (validationParams.maxLength != null)
      Validators.minLength(validationParams.maxLength!)
  ];
}
