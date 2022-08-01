enum DateTypeEnum {
  gregorian(true),
  hijri(false);

  final bool type;
  const DateTypeEnum(this.type);
}
