import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sahayatha/src/model/notes_model.dart';
import 'package:sahayatha/src/screens/pdf_screen.dart';

class NoteDetailsPage extends StatelessWidget {
  final Note note;

  const NoteDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Name', note.name),
            _buildDetailRow('DOB', note.dob),
            _buildDetailRow('WhatsApp', note.whatsapp),
            _buildDetailRow('Guardian', note.guardian),
            _buildDetailRow('State', note.state),
            _buildDetailRow('Aadhar', note.aadhar),
            _buildDetailRow('Past Assistive', note.pastAssistive),
            _buildDetailRow('Limit', note.limit),
            _buildDetailRow('Family', note.family),
            _buildDetailRow('Disability Story', note.disabilityStory),
            _buildDetailRow('Disability Percentage', note.disabilityPercentage),
            _buildDetailRow('Usage', note.usage),
            _buildDetailRow('Pay', note.pay),
            _buildDetailRow('Address', note.address),
            if (note.imagePath != null)
              Image.file(
                File(note.imagePath!),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            if (note.pdfPaths != null && note.pdfPaths!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'PDFs:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: note.pdfPaths!.map((pdfPath) {
                      return IconButton(
                        icon: const Icon(
                          Icons.picture_as_pdf,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfViewerPage(
                                pdfPath: pdfPath,
                                name: note.name,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '$title: $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
