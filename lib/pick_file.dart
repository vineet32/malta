import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:image_picker/image_picker.dart';

class PickFile {
  Future<File> getImage() async {
    final _picker = ImagePicker();
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<Map> getImageFromBrowser() async {
    final completer = new Completer<List<String>>();
    List<html.File> files;
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..multiple = false
      ..accept = 'image/*';
    input.onChange.listen((e) async {
      files = input.files;

      Iterable<Future<String>> resultsFutures = files.map((file) {
        final reader = new html.FileReader();
        reader.readAsDataUrl(files[0]);
        reader.onError.listen((error) => completer.completeError(error));
        return reader.onLoad.first.then((_) => reader.result as String);
      });

      final results = await Future.wait(resultsFutures);
      completer.complete(results);
    });

    input.click();
    final List<String> images = await completer.future;

    int removeString = images[0].indexOf(',');
    var body = images[0];
    // String imageType = files[0].type.substring(input.accept.length - 1);
    String encodedStr = body.substring(removeString + 1, body.length);
    Uint8List _imgDecoded = base64Decode(encodedStr);
    // input.remove();

    return {
      "image": _imgDecoded,
      "name": files[0].name,
    };
  }
}
