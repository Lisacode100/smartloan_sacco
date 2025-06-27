import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterSaccoPage extends StatefulWidget {
  const RegisterSaccoPage({super.key});

  @override
  State<RegisterSaccoPage> createState() => _RegisterSaccoPageState();
}

class _RegisterSaccoPageState extends State<RegisterSaccoPage> {
  final _formKey = GlobalKey<FormState>();
  final _saccoNameController = TextEditingController();
  final _registrarNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _membersController = TextEditingController();

  DateTime? _selectedDate;

  // Date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2020),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _saccoNameController.dispose();
    _registrarNameController.dispose();
    _phoneController.dispose();
    _membersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register SACCO'),
        backgroundColor: const Color(0xFF007C91),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_saccoNameController, 'SACCO Name'),
              const SizedBox(height: 12),
              _buildTextField(_registrarNameController, "Registrar's Name"),
              const SizedBox(height: 12),
              _buildTextField(_phoneController, 'Phone Number',
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 12),

              // Date Established Picker
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Date Established'),
                subtitle: Text(
                  _selectedDate != null
                      ? DateFormat.yMMMMd().format(_selectedDate!)
                      : 'Pick a date',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _pickDate(context),
                ),
              ),
              const SizedBox(height: 12),

              _buildTextField(_membersController, 'Estimated Number of Members',
                  keyboardType: TextInputType.number),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _selectedDate != null) {
                    // You can send data to backend here
                    print('SACCO: ${_saccoNameController.text}');
                    print('Registrar: ${_registrarNameController.text}');
                    print('Phone: ${_phoneController.text}');
                    print('Date: $_selectedDate');
                    print('Members: ${_membersController.text}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("SACCO Registered!")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007C91),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Register SACCO",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) =>
      value == null || value.isEmpty ? 'Please enter $label' : null,
    );
  }
}
