import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  static Future<void> exportSchedule(String jsonData) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/my_schedule.lesson');
    await file.writeAsString(jsonData);
    await Share.shareXFiles([XFile(file.path)], text: 'Мое расписание');
  }

  static Future<String?> importSchedule() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['lesson']);
    if (result != null) return await File(result.files.single.path!).readAsString();
    return null;
  }
}