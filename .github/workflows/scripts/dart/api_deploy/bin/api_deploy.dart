import 'package:api_deploy/api_deploy.dart';
import 'package:api_validate/api_validate.dart';

Future<void> main(List<String> arguments) async {
  await apiValidate();
  print('💙💙 Validation completed successfully!! 💙💙');
  await apiDeploy();
  print('💙💙 Api deploy completed successfully!! 💙💙');
}
