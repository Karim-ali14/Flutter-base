import 'dart:convert';
import 'dart:io';
import '../../../../core/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Utils/Extintions.dart';
import 'circle_image.dart';
import 'svg_icons.dart';

class CircleImgPicker extends StatefulWidget {
  final String? initialImg;
  final double? size;
  final String? placeHolder;
  final Function(String, String) onResult;
  CircleImgPicker(
      {Key? key,
      this.size,
      required this.onResult,
      this.initialImg,
      this.placeHolder})
      : super(key: key);

  @override
  State<CircleImgPicker> createState() => _CircleImgPickerState();
}

class _CircleImgPickerState extends State<CircleImgPicker> {
  final ImagePicker _picker = ImagePicker();
  String? imgPath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (widget.size ?? 50) + 10,
      height: (widget.size ?? 50) + 10,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: widget.size ?? 50,
            height: widget.size ?? 50,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: imgPath != null
                ? Image.file(
                    File(imgPath ?? ""),
                    fit: BoxFit.cover,
                  )
                : (widget.initialImg != null
                    ? CircleImage(
                        placeHolder: widget.placeHolder,
                        initialImg: widget.initialImg)
                    : Image.asset(widget.placeHolder??"",
                        fit: BoxFit.cover)),
          ),
          Positioned(
              right: -2,
              bottom: -2,
              child: IconButton(
                onPressed: () async {
                  context.showSelectionActionSheet(imagePickOptions, onSelect,
                      header: "Add Image");
                },
                icon: SVGIcons.itemsIcon(),
              ))
        ],
      ),
    );
  }

  void onSelect(int pos) async {
    if (pos == 0) {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera, imageQuality: 10);
      if (image != null) {
        setState(() => imgPath = image.path);
        image.readAsBytes().then((value) {
          widget.onResult.call(image.path, base64Encode(value));
        });
      }
    } else if (pos == 1) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
      if (image != null) {
        setState(() => imgPath = image.path);
        image.readAsBytes().then((value) {
          widget.onResult.call(image.path, base64Encode(value));
        });
      }
    }
  }
}
