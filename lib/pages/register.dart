import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RegisterSaccoPage extends StatefulWidget {
  const RegisterSaccoPage({super.key});

  @override
  State<RegisterSaccoPage> createState() => _RegisterSaccoPageState();
}

class _RegisterSaccoPageState extends State<RegisterSaccoPage> {
  final _log = Logger('RegisterSaccoPage');
  final _formKey = GlobalKey<FormState>();
  final _registrarNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'Member';

  bool _isRegistering = false;
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _registrarNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _registerSacco() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please fill all required fields."),
          ),
        );
      }
      return;
    }

    setState(() {
      _isRegistering = true;
    });

    // Simulate a network call
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        _isRegistering = false;
      });

      _log.info(
          'Successfully registered User: ${_registrarNameController.text} as $_selectedRole');

      // Simulate sending a verification code and navigate, passing the role
      const verificationCode = '123456'; // Mock code
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/verification',
        (route) => false,
        arguments: {
          'code': verificationCode,
          'role': _selectedRole,
        },
      );
    });
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              _buildTextField(_registrarNameController, "Full Names"),
              const SizedBox(height: 12),
              _buildTextField(
                _phoneController,
                'Phone Number',
                keyboardType: TextInputType.phone,
                helperText: 'e.g., 0712345678',
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'PIN Password',
                  border: const OutlineInputBorder(),
                  helperText: 'PIN must be atleast 4 characters',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),
                ),
                obscureText: _isPasswordObscured,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a PIN password';
                  }
                  if (value.length < 4) {
                    return 'PIN Password must be at least 4 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: const InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                ),
                items: <String>['Member', 'Admin']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRole = newValue!;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isRegistering ? null : _registerSacco,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007C91),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Semantics(
                  label: _isRegistering
                      ? "Registering, please wait"
                      : "Register SACCO",
                  child: _isRegistering
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          "Register SACCO",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text, String? helperText}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        helperText: helperText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) =>
      value == null || value.isEmpty ? 'Please enter $label' : null,
    );
  }
}
