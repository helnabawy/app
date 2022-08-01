enum TargetEnvironment {
  testing,
  production,
  stub,
}

enum ApiVersion {
  V1,
  V2,
}

enum OsTypeEnum {
  IOS('1'),
  Android('2');

  final String value;
  const OsTypeEnum(this.value);
}
