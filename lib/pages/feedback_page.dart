
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:intl/intl.dart';

// class SaccoFeedbackPage extends StatefulWidget {
//   const SaccoFeedbackPage({super.key});

//   @override
//   State<SaccoFeedbackPage> createState() => _SaccoFeedbackPageState();
// }

// class _SaccoFeedbackPageState extends State<SaccoFeedbackPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _subjectController = TextEditingController();
//   final _messageController = TextEditingController();
//   final _memberIdController = TextEditingController();
//   FeedbackCategory _selectedCategory = FeedbackCategory.general;
//   bool _isSubmitting = false;
//   final List<PlatformFile> _attachments = [];

//   @override
//   void dispose() {
//     _subjectController.dispose();
//     _messageController.dispose();
//     _memberIdController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickFiles() async {
//     try {
//       final result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png', 'jpeg'],
//       );

//       if (result != null) {
//         setState(() {
//           _attachments.addAll(result.files);
//         });
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('File picker error: ${e.toString()}')),
//         );
//       }
//     }
//   }

//   Future<void> _submitFeedback() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _isSubmitting = true);

//     try {
//       // 1. Prepare feedback data
//       final feedbackData = {
//         'memberId': _memberIdController.text,
//         'category': _selectedCategory.toString().split('.').last,
//         'subject': _subjectController.text,
//         'message': _messageController.text,
//         'attachments': _attachments.map((file) => file.name).toList(),
//         'status': 'pending',
//         'createdAt': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
//       };

//       // 2. Simulate backend submission (replace with your actual API call)
//       await _simulateBackendSubmission(feedbackData);

//       if (!mounted) return;
      
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Feedback submitted successfully!')),
//       );
//       _clearForm();
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${e.toString()}')),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isSubmitting = false);
//       }
//     }
//   }

//   Future<void> _simulateBackendSubmission(Map<String, dynamic> data) async {
//     // Simulate network delay
//     await Future.delayed(const Duration(seconds: 2));
//     debugPrint('Feedback data would be sent to backend: $data');
//   }

//   void _clearForm() {
//     _subjectController.clear();
//     _messageController.clear();
//     setState(() {
//       _selectedCategory = FeedbackCategory.general;
//       _attachments.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'SACCO Feedback',
//           style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(),
//               const SizedBox(height: 24),
//               _buildMemberIdField(),
//               const SizedBox(height: 16),
//               _buildCategoryDropdown(),
//               const SizedBox(height: 16),
//               _buildSubjectField(),
//               const SizedBox(height: 16),
//               _buildMessageField(),
//               const SizedBox(height: 16),
//               _buildAttachmentSection(),
//               const SizedBox(height: 32),
//               _buildSubmitButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Contact SACCO Administration',
//           style: GoogleFonts.poppins(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           'Please share your feedback, questions, or concerns with our administration team.',
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMemberIdField() {
//     return TextFormField(
//       controller: _memberIdController,
//       decoration: const InputDecoration(
//         labelText: 'SACCO Member ID',
//         prefixIcon: Icon(Icons.badge_outlined),
//         border: OutlineInputBorder(),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your member ID';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildCategoryDropdown() {
//     return DropdownButtonFormField<FeedbackCategory>(
//       value: _selectedCategory,
//       decoration: const InputDecoration(
//         labelText: 'Feedback Category',
//         prefixIcon: Icon(Icons.category_outlined),
//         border: OutlineInputBorder(),
//       ),
//       items: FeedbackCategory.values.map((category) {
//         return DropdownMenuItem(
//           value: category,
//           child: Text(category.toString().split('.').last.capitalize()),
//         );
//       }).toList(),
//       onChanged: (value) {
//         if (value != null) {
//           setState(() => _selectedCategory = value);
//         }
//       },
//     );
//   }

//   Widget _buildSubjectField() {
//     return TextFormField(
//       controller: _subjectController,
//       decoration: const InputDecoration(
//         labelText: 'Subject',
//         prefixIcon: Icon(Icons.title_outlined),
//         border: OutlineInputBorder(),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter a subject';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildMessageField() {
//     return TextFormField(
//       controller: _messageController,
//       decoration: const InputDecoration(
//         labelText: 'Your Message',
//         alignLabelWithHint: true,
//         prefixIcon: Icon(Icons.message_outlined),
//         border: OutlineInputBorder(),
//       ),
//       maxLines: 5,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your message';
//         }
//         if (value.length < 15) {
//           return 'Please provide more details (at least 15 characters)';
//         }
//         return null;
//       },
//     );
//   }

//   Widget _buildAttachmentSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         OutlinedButton.icon(
//           icon: const Icon(Icons.attach_file),
//           label: const Text('Add Supporting Documents (Optional)'),
//           onPressed: _pickFiles,
//         ),
//         if (_attachments.isNotEmpty) ...[
//           const SizedBox(height: 16),
//           Text(
//             'Selected files:',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[700],
//             ),
//           ),
//           ..._attachments.map((file) => ListTile(
//             leading: const Icon(Icons.insert_drive_file),
//             title: Text(
//               file.name,
//               overflow: TextOverflow.ellipsis,
//             ),
//             trailing: IconButton(
//               icon: const Icon(Icons.close),
//               onPressed: () => setState(() => _attachments.remove(file)),
//             ),
//           )),
//         ],
//       ],
//     );
//   }

//   Widget _buildSubmitButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: _isSubmitting ? null : _submitFeedback,
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: _isSubmitting
//             ? const SizedBox(
//                 height: 20,
//                 width: 20,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   color: Colors.white,
//                 ),
//               )
//             : Text(
//                 'SUBMIT FEEDBACK',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//       ),
//     );
//   }
// }

// enum FeedbackCategory {
//   general,
//   account,
//   loan,
//   shares,
//   complaint,
//   suggestion
// }

// extension StringExtensions on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

enum FeedbackCategory {
  general,
  account,
  loan,
  shares,
  complaint,
  suggestion
}

class SaccoFeedbackPage extends StatefulWidget {
  const SaccoFeedbackPage({super.key});

  @override
  State<SaccoFeedbackPage> createState() => _SaccoFeedbackPageState();
}

class _SaccoFeedbackPageState extends State<SaccoFeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final _memberIdController = TextEditingController();
  FeedbackCategory _selectedCategory = FeedbackCategory.general;
  bool _isSubmitting = false;
  final List<PlatformFile> _attachments = [];

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    _memberIdController.dispose();
    super.dispose();
  }

  Future<void> _pickFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png', 'jpeg'],
      );

      if (result != null) {
        setState(() => _attachments.addAll(result.files));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting files: $e')),
      );
    }
  }

  Future<void> _submitFeedback() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Feedback submitted successfully!')),
      );
      _clearForm();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting feedback: $e')),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  void _clearForm() {
    _subjectController.clear();
    _messageController.clear();
    setState(() {
      _selectedCategory = FeedbackCategory.general;
      _attachments.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Provide Feedback',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We value your feedback',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please share your thoughts, questions or concerns with us',
                style: GoogleFonts.poppins(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _memberIdController,
                decoration: const InputDecoration(
                  labelText: 'Member ID',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your member ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<FeedbackCategory>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                items: FeedbackCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(_formatCategoryName(category)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedCategory = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Your Message',
                  prefixIcon: Icon(Icons.message),
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  if (value.length < 20) {
                    return 'Please provide more details (at least 20 characters)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Attachments (optional)',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                icon: const Icon(Icons.attach_file),
                label: const Text('Add Files'),
                onPressed: _pickFiles,
              ),
              if (_attachments.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _attachments.map((file) => Chip(
                    label: Text(file.name),
                    deleteIcon: const Icon(Icons.close, size: 18),
                    onDeleted: () => setState(() => _attachments.remove(file)),
                  )).toList(),
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitFeedback,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isSubmitting
                      ? const CircularProgressIndicator()
                      : Text(
                          'SUBMIT FEEDBACK',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCategoryName(FeedbackCategory category) {
    switch (category) {
      case FeedbackCategory.general:
        return 'General Inquiry';
      case FeedbackCategory.account:
        return 'Account Issue';
      case FeedbackCategory.loan:
        return 'Loan Service';
      case FeedbackCategory.shares:
        return 'Shares & Dividends';
      case FeedbackCategory.complaint:
        return 'Complaint';
      case FeedbackCategory.suggestion:
        return 'Suggestion';
    }
  }
}