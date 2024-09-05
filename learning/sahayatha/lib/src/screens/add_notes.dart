// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';
import 'package:sahayatha/src/model/notes_model.dart';
import 'package:sahayatha/src/provider/notes_provider.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _guardianController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _pastAssistiveController =TextEditingController();
  final TextEditingController _limitController = TextEditingController();
  final TextEditingController _familyController = TextEditingController();
  final TextEditingController _disabilityStoryController =TextEditingController();
  final TextEditingController _disabilityPercentageController =TextEditingController();
  final TextEditingController _usageController = TextEditingController();
  final TextEditingController _payController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  List<File>? _selectedPdfs = [];
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      File selectedImage = File(pickedFile.path);

      // Resize the image to 200x200 pixels
      selectedImage = await _resizeImage(selectedImage, 200, 200);

      setState(() {
        _selectedImage = selectedImage;
      });
    }
  }

  Future<File> _resizeImage(
      File originalImage, int targetWidth, int targetHeight) async {
    // Decode the image
    var originalBytes = await originalImage.readAsBytes();
    img.Image? decodedImage =
        img.decodeImage(Uint8List.fromList(originalBytes));

    // Resize the image
    img.Image resizedImage =
        img.copyResize(decodedImage!, width: targetWidth, height: targetHeight);

    // Save the resized image to a new file
    File resizedFile = File('${originalImage.path}_resized.png');
    await resizedFile.writeAsBytes(img.encodePng(resizedImage));

    return resizedFile;
  }

Future<void> _pickPdf() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true, // Allow multiple files to be picked
      );
      if (result != null) {
        List<File> files = [];
        for (String? path in result.paths) {
          if (path != null) {
            files.add(File(path));
          }
        }
        setState(() {
          _selectedPdfs = files;
        });
      }
    } catch (e) {
      print('Error picking PDF: $e');
    }
  }






 void _saveNote() {
    final newNote = Note(
      name: _nameController.text,
      dob: _dobController.text,
      whatsapp: _whatsappController.text,
      guardian: _guardianController.text,
      state: _stateController.text,
      aadhar: _aadharController.text,
      pastAssistive: _pastAssistiveController.text,
      limit: _limitController.text,
      family: _familyController.text,
      disabilityStory: _disabilityStoryController.text,
      disabilityPercentage: _disabilityPercentageController.text,
      usage: _usageController.text,
      pay: _payController.text,
      address: _addressController.text,
      imagePath: _selectedImage?.path,
      pdfPaths: _selectedPdfs?.map((file) => file.path).toList(),
    );

    Provider.of<NoteProvider>(context, listen: false).addNote(newNote);

    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _dobController,
              decoration: InputDecoration(
                hintText: "DOB",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _whatsappController,
              decoration: InputDecoration(
                hintText: "WhatsApp No",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _guardianController,
              decoration: InputDecoration(
                hintText: "Guardian",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _stateController,
              decoration: InputDecoration(
                hintText: "State/District",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _aadharController,
              decoration: InputDecoration(
                hintText: "Aadhar No",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _pastAssistiveController,
              decoration: InputDecoration(
                hintText: "Past Assistive device / no of years",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _limitController,
              decoration: InputDecoration(
                hintText: "Limits",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _familyController,
              decoration: InputDecoration(
                hintText: "Family Details",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _disabilityStoryController,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Disability Story",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _disabilityPercentageController,
              decoration: InputDecoration(
                hintText: "Disability percentage",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _usageController,
              decoration: InputDecoration(
                hintText: "Usage purpose of commode",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _payController,
              decoration: InputDecoration(
                hintText: "Willing to pay",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: "Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: _pickPdf,
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text('Pick PDF'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Choose Option"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GestureDetector(
                                  child: const Text("Take a picture"),
                                  onTap: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),
                                GestureDetector(
                                  child: const Text("Select from gallery"),
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Pick Image'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                image: _selectedImage != null
                    ? DecorationImage(
                        image: FileImage(_selectedImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: _selectedImage == null
                  ? const Center(child: Text('No Image Selected'))
                  : null,
            ),
            const SizedBox(height: 20),
            if (_selectedPdfs != null && _selectedPdfs!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _selectedPdfs!.map((pdf) {
                  return Text(
                    'Selected PDF: ${pdf.path.split('/').last}',
                    style: const TextStyle(fontSize: 16),
                  );
                }).toList(),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Add Details'),
            ),
          ],
        ),
      ),
    );
  }
}
