import 'dart:io';

import 'package:made_in_flutter_belgium_data/made_in_flutter_belgium_data.dart';
import 'package:path/path.dart';

enum CompanyImageType {
  logoWebp('logo.webp'),
  logoSvg('logo.svg');

  final String fileName;

  const CompanyImageType(this.fileName);
}

Future<void> validateCompanyImages(Company company, String workingDirPath, Directory itemDir) async {
  if (company.images != null) {
    throw ArgumentError(
      '${company.name} has configured images.\n\n'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/companies',
    );
  }
  company.images = await _getImages(workingDirPath, itemDir, company);
}

Future<CompanyImages> _getImages(
  String workingDirPath,
  Directory itemDir,
  Company company,
) async {
  String? logoUrl;

  final imagesDir = Directory(join(itemDir.path, 'assets', 'img'));
  if (!imagesDir.existsSync()) {
    throw ArgumentError(
      '${company.name} has no `assets/img` directory added.\n\n'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/companies',
    );
  }
  final dir = Directory(join(workingDirPath, 'api', 'companies', company.name, 'images'));
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }
  for (final imageFile in imagesDir.listSync()) {
    final fileName = basename(imageFile.path);
    if (imageFile is Directory) {
      throw ArgumentError(
        '${company.name} has invalid folder in the image folder ($fileName).\n\n'
        'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/companies',
      );
    } else if (imageFile is File) {
      final imageUrl = 'https://api.madein.flutterbelgium.be/companies/${company.name}/images/$fileName';

      imageFile.copySync(join(dir.path, fileName));
      if (fileName == CompanyImageType.logoSvg.fileName || fileName == CompanyImageType.logoWebp.fileName) {
        logoUrl = imageUrl;
      } else {
        throw ArgumentError(
          '${company.name} has invalid images in the image folder ($fileName).\n\n'
          'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/companies',
        );
      }
    } else {
      throw ArgumentError('${company.name} has invalid file type: accepted, file/directory -> ($imageFile).');
    }
  }
  if (logoUrl == null) {
    throw ArgumentError(
      '${company.name} has no logo.webp or logo.svg file.\n\n'
      'Check the documentation for more information. https://github.com/flutter-belgium/made_in_flutter_belgium_data/tree/main/examples/companies',
    );
  }
  return CompanyImages(
    logoUrl: logoUrl,
  );
}
