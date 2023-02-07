import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:emotion_detector/helpers/face_detector_painter.dart';
import 'package:emotion_detector/model/face_model.dart';
import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Scan extends StatefulWidget {
  @override
  ScanPage createState() => ScanPage();
}

class ScanPage extends State<Scan> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? customPaint;
  String? _text;

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image
  File? _image;
  String? _path;

  bool isCameraFront = true;
  double transform = 1;

  InputImage? inputImage;
  InputImageRotation? imageRotation;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();

    if (cameras != null) {
      if (isCameraFront) {
        controller = CameraController(cameras![1], ResolutionPreset.max);
        imageRotation =
            InputImageRotationValue.fromRawValue(cameras![1].sensorOrientation);
      } else {
        controller = CameraController(cameras![0], ResolutionPreset.max);
        imageRotation =
            InputImageRotationValue.fromRawValue(cameras![0].sensorOrientation);
      }
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          // Update UI
        });
      });
    } else {
      print("No any camera found");
    }
  }

  // Future<void> processImage(inputImage) async {
  //   faces = await _faceDetect?.processImage(inputImage);

  //   if (faces != null && faces!.isNotEmpty) {
  //     FaceModel? face = faces?.first;
  //     label = detectSmile(face?.smile);
  //   } else {
  //     faceAtMoment = 'normal_face.png';
  //     label = 'Not face detected';
  //   }
  //   _isDetecting = false;
  //   update();
  // }

  String detectSmile(smileProb) {
    if (smileProb > 0.86) {
      // faceAtMoment = 'happy_face.png';
      return 'Big smile with teeth';
    } else if (smileProb > 0.8) {
      // faceAtMoment = 'happy_face.png';
      return 'Big Smile';
    } else if (smileProb > 0.3) {
      // faceAtMoment = 'happy_face.png';
      return 'Smile';
    } else {
      // faceAtMoment = 'sady_face.png';
      return 'Sad';
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    // _canProcess = false;
    // _faceDetector.close();
    super.dispose();
  }

  Future<void> processImage(InputImage inputImage) async {
    // CustomPaint? _customPaint;

    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = "";
    });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      // Live Camera

      // final painter = FaceDetectorPainter(`
      //     faces,
      //     inputImage.inputImageData!.size,
      //     inputImage.inputImageData!.imageRotation);
      // _customPaint = CustomPaint(painter: painter);

    } else {
      // After Take Picture
      // String text = 'Faces found: ${faces.length}';
      // FaceModel? face = faces.first;
      _text = detectSmile(faces.first.smilingProbability);
      // for (final face in faces) {
      //   text += 'face: ${face.boundingBox}';
      // }
      // _text = text;

      // final painter = FaceDetectorPainter(
      //     faces,
      //     inputImage.inputImageData!.size,
      //     inputImage.inputImageData!.imageRotation);

      // customPaint = CustomPaint(painter: painter);

      // TODO: set _customPaint to draw boundingRect on top of image
      // _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future _processPickedFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _image = File(path);
    });
    _path = path;
    inputImage = InputImage.fromFilePath(path);

    // widget.onImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 40,
        title: Row(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      child: Image.asset(
                        'assets/images/up_profile_icon_round.png',
                        width: 28,
                      ),
                    )),
                Text(
                  "Hi, Yusril",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 100,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tingkat stress",
                        style: TextStyle(
                            color: toscaColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      LinearPercentIndicator(
                        width: 113.0,
                        lineHeight: 14.0,
                        animation: true,
                        percent: 0.5,
                        // center: Text("50%"),
                        progressColor: toscaColor,
                        backgroundColor: Colors.white,
                        barRadius: const Radius.circular(25),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 87,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(45))),
        leading: BackButton(
          // color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: lightGreenColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 125, left: 10, right: 10),
                    child: Stack(
                      children: [
                        image == null
                            ? controller == null
                                ? Center(child: Text("Loading Camera..."))
                                : !controller!.value.isInitialized
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : AspectRatio(
                                        aspectRatio: 1 / 0.9,
                                        child: ClipRect(
                                          child: Transform.scale(
                                            scale:
                                                controller!.value.aspectRatio /
                                                    0.9,
                                            child: Center(
                                              child: CameraPreview(controller!),
                                            ),
                                          ),
                                        ),
                                      )
                            : AspectRatio(
                                aspectRatio: 1 / 0.9,
                                child: ClipRect(
                                  child: Transform.scale(
                                    scale: controller!.value.aspectRatio / 0.9,
                                    child: Center(
                                        child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.file(_image!),
                                        if (customPaint != null) customPaint!,
                                      ],
                                    )

                                        // Image.file(
                                        //   File(image!.path),
                                        //   height: 314,
                                        //   width: 314,
                                        // ),
                                        ),
                                  ),
                                ),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            image == null
                                ? IconButton(
                                    icon: Transform.scale(
                                      scaleX: transform,
                                      child: Icon(
                                        Icons.flip_camera_ios,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        isCameraFront = !isCameraFront;
                                        transform = -transform;
                                      });
                                      loadCamera();
                                    })
                                : IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        image = null;
                                        controller = null;
                                        _image = null;
                                      });
                                      loadCamera();
                                    },
                                    icon: Icon(
                                      Icons.repeat,
                                      color: Colors.white,
                                      size: 28,
                                    )),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: Container(
                                  height: 36,
                                  width: 216,
                                  color: orangeColor,
                                  child: Center(
                                    child: Text(
                                      _image == null
                                          ? "Senang"
                                          : _text!.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Transform.scale(
                                  scaleX: transform,
                                  child: Icon(
                                    Icons.flip_camera_ios,
                                    color: Colors.transparent,
                                    size: 28,
                                  ),
                                ),
                                onPressed: () async {})
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Material(
                      elevation: 6.0,
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        onTap: () async {
                          try {
                            if (controller != null) {
                              //check if contrller is not null
                              if (controller!.value.isInitialized) {
                                //check if controller is initialized
                                image = await controller!
                                    .takePicture(); //capture image
                                _processPickedFile(image);
                                processImage(inputImage!);
                                setState(() {
                                  //update UI
                                });
                              }
                            }
                          } catch (e) {
                            print(e); //show error
                          }
                        },
                        child: Image.asset('assets/images/Scan.png'),
                      ),
                    ),
                  ),
                  Container(
                    color: toscaColor,
                    width: 354,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Saran dari ahli:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "Tetaplah melakukan aktivitas seperti biasa, sebarkan suasana positif yang ada pada diri anda kepada orang sekitar, hal itu bisa menambah rasa percaya diri anda dan membuat anda merasa lebih bahagia :)",
                              maxLines: 4,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
