import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'package:path_provider/path_provider.dart';

import 'dart:math';

import 'models/ImageType.dart';
import 'models/ImageUploadModel.dart';
import 'models/ServiceRequest.dart';

import 'package:cool_stepper/cool_stepper.dart';

import 'package:random_string/random_string.dart';

import 'package:percent_indicator/percent_indicator.dart';

class Inspection extends StatefulWidget {

  ServiceRequest serviceRequest;

  Inspection({required this.serviceRequest});

  ServiceRequest get getserviceRequest {
    return serviceRequest;
  }

  set setName(ServiceRequest serviceRequest) {
    serviceRequest = serviceRequest;
  }

  @override
  State<Inspection> createState() => _InspectionState(serviceRequest: serviceRequest);
}

class _InspectionState extends State<Inspection> {

  File? addressImageFile;
  File? elevationImageFile;

  List<ImageUploadModel> inspectionImages = <ImageUploadModel>[];
  late Future<File> _imageFile;

  final _formKey = GlobalKey<FormState>();

  ServiceRequest serviceRequest;
  _InspectionState({required this.serviceRequest});

  String? selectedRole = 'Writer';
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Address Identifier',
        subtitle: 'Capture photos of the Address confirming the correct location.',
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              addressImageFile != null
              ? Image.file(addressImageFile!, scale: 5,)
              : Image.asset('assets/images/illustrationhousenumber.png'),
              _buildTextField(
                labelText: 'Description',
                controller: _nameCtrl,
              ),
              Card(
                child: IconButton(
                  icon: Icon(Icons.add_a_photo_sharp),
                  tooltip: 'Click to take picture',
                  onPressed: () {
                    getImageFromCamera(ImageType.Address);
                    setState(() {
                      // TO DO
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Overview of all Elevations',
        subtitle: 'Take full view of each structure (for sliding photos every 20ft).',
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              elevationImageFile != null
                  ? Image.file(elevationImageFile!, scale: 5,)
                  : Image.asset('assets/images/illustrationhouse.png'),
              _buildTextField(
                labelText: 'Description',
                controller: _nameCtrl,
              ),
              Card(
                child: IconButton(
                  icon: Icon(Icons.add_a_photo_sharp),
                  tooltip: 'Click to take picture',
                  onPressed: () {
                    getImageFromCamera(ImageType.Elevations);
                    setState(() {
                      // TO DO
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Submit Inspection',
        subtitle: 'Click Finish to submit the Inspection',
        content: Container(
          child: Row(
            children: <Widget>[
              /*Padding(
                padding: EdgeInsets.all(15.0),
                  child: LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: 0.9,
                    animateFromLastPercent: true,
                    center: Text("90.0%"),
                    isRTL: true,
                    barRadius: Radius.elliptical(5, 15),
                    progressColor: Colors.greenAccent,
                    maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
                  )
              ),*/
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        uploadImages();
        print('Steps completed!');
      },
      steps: steps,
      config: CoolStepperConfig(
        backText: 'PREV',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Inspection'),
      ),
      body: Container(
        child: stepper,
      ),
    );
  }

  Widget _buildTextField({
    String? labelText,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }

  void getImageFromCamera(ImageType imageType) async {

    XFile? cameraImage =
    await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 1080,
        maxWidth: 1080
    );

    if (cameraImage == null) return;

    ImageUploadModel newImage = new ImageUploadModel();
    newImage.imageType = imageType;
    newImage.imageId = 1;
    newImage.imageFileName = imageType.toString().split('.').last + '_'+ randomAlpha(5);
    newImage.imagePath = cameraImage.path;

    inspectionImages.add(newImage);

    setState(() {
      if (imageType == ImageType.Address) addressImageFile = File(cameraImage.path);
      if (imageType == ImageType.Elevations) elevationImageFile = File(cameraImage.path);
    });
  }

  void uploadImages() async {

    for (var img in inspectionImages){
      print('image 2 upload : ${img.imagePath}');
      File f = File(img.imagePath);
      await f.writeAsBytes(f.readAsBytesSync());

      try {
        final UploadFileResult result = await Amplify.Storage.uploadFile(
            local: f,
            key: img.imageFileName,
            onProgress: (progress) {
              print("Fraction completed: " + progress.getFractionCompleted().toString());
            }
        );
        print('Successfully uploaded file: ${result.key}');
      } on StorageException catch (e) {
        print('Error uploading file: $e');
      }

    }



  }
}