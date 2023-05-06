import 'package:made_in_flutter_belgium_data/src/model/data/company/company.dart';
import 'package:made_in_flutter_belgium_data/src/model/data/company/minimized_company.dart';

extension CompanyExtension on Company {
  MinimizedCompany toMinimizedCompany() => MinimizedCompany(
        name: name,
        logoUrl: images!.logoUrl,
        useLogoInsteadOfTextTitle: useLogoInsteadOfTextTitle,
      );
}
