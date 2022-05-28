import 'dart:io';

import 'package:path/path.dart' as path;

const filenameArgumentErrorMsg = "wrong file name";

String findNextFileName(String directory,
    {String? filename, bool? continueCounting}) {
  String? tmpFileName = filename;
  if (filename == null) {
    var directoryTree = directory.split('/');
    if (directoryTree.isNotEmpty) {
      tmpFileName = directoryTree.removeLast();
    }
    directory = directoryTree.join('/');
  }

  if (tmpFileName == null ||
      tmpFileName.isEmpty ||
      !tmpFileName.contains(".")) {
    throw ArgumentError(filenameArgumentErrorMsg, filename);
  }

  // final parsedfileName = parse(tmpFileName);
  String name = path.basenameWithoutExtension(tmpFileName);
  String ext = path.extension(tmpFileName);
  int i = 1;

  if (continueCounting == true) {
    final int lastOpenBracketPos = name.lastIndexOf("(");
    if (lastOpenBracketPos != -1) {
      final int lastCloseBracketPos = name.lastIndexOf(")");
      if (lastCloseBracketPos > lastOpenBracketPos &&
          lastCloseBracketPos == name.length - 1) {
        String bracketsWithText =
            name.substring(lastOpenBracketPos, lastCloseBracketPos + 1);
        final match = RegExp(r'\(\d+\)').stringMatch(bracketsWithText);
        if (match is String && match.length >= 3) {
          i = (int.tryParse(bracketsWithText.substring(
                      1, bracketsWithText.length - 1)) ??
                  0) +
              1;
          name = name.substring(0, lastOpenBracketPos - 1);
        }
      }
    }
  }

  String currentFileName = tmpFileName;
  String nextPathName = path.normalize(path.join(directory, currentFileName));
  while (File(nextPathName).existsSync()) {
    currentFileName = '$name ($i)$ext';
    nextPathName = path.normalize(path.join(directory, currentFileName));
    i++;
  }

  return currentFileName;
}
