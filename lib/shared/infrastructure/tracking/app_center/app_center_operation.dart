enum OperationType {
  Verification('Verification'),
  Inquire('Inquire'),
  Procedural('Procedural'),
  ApiIntegration('ApiIntegrations'),
  Tracing('Tracing');

  final String type;
  const OperationType(this.type);
}
