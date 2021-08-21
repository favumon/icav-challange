class ValidationParams {
  final bool? isRequired;
  final int? minLength;
  final int? maxLength;
  final bool? isEmail;
  final String? pattern;
  final bool? isEqual;

  ValidationParams(
      {this.minLength,
      this.maxLength,
      this.isEmail,
      this.pattern,
      this.isEqual,
      this.isRequired});
}
