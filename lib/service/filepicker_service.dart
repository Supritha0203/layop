import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilepickerService {
  Future<File?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc','png','jpeg'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      return null ;
    }
  }

}
