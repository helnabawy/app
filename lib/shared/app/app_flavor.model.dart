import 'package:qcb/shared/app/environments/environment.enum.dart';

class AppFlavor {
  final TargetEnvironment target;
  final ApiVersion version;

  const AppFlavor(this.target, this.version);
}

const testingFlavor = AppFlavor(TargetEnvironment.testing, ApiVersion.V2);
const productionFlavor = AppFlavor(TargetEnvironment.production, ApiVersion.V1);
const stubFlavor = AppFlavor(TargetEnvironment.stub, ApiVersion.V2);
