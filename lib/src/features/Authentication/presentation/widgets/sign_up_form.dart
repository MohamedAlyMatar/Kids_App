import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/datepicker.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? _handness = 'Right';
  bool _hasDLD = false;
  bool _hasHearingLoss = false;
  bool _hasSLI = false;
  bool _hasPervasiveDisorder = false;
  String? _hearingLossSide;
  String? _hearingLossDegree;
  String? _hearingLossType;
  String? _hearingDevice;
  String? _specificLanguageImpairment;
  String? _pervasiveDisorder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 500,
        margin: const EdgeInsets.all(24.0),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Personal Data",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField("Name", "Enter your name", (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              }),
              const SizedBox(height: 16),
              DatePickerWidget(
                label: 'Date of Birth',
                hintText: '',
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                "Handness",
                "Select handness",
                ['Right', 'Left'],
                _handness,
                (String? value) {
                  setState(() {
                    _handness = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildYesNo("Delayed Language Disorder (DLD)", _hasDLD, (value) {
                setState(() {
                  _hasDLD = value;
                });
              }),
              if (_hasDLD) _buildTextField("Cause", "Enter the cause", null),
              const SizedBox(height: 16),
              _buildYesNo("Hearing Loss", _hasHearingLoss, (value) {
                setState(() {
                  _hasHearingLoss = value;
                });
              }),
              if (_hasHearingLoss) ...[
                _buildDropdown("Side", "Select side",
                    ['Unilateral', 'Bilateral'], _hearingLossSide, (value) {
                  setState(() {
                    _hearingLossSide = value;
                  });
                }),
                const SizedBox(height: 16),
                _buildDropdown(
                    "Degree",
                    "Select degree",
                    [
                      'Mild',
                      'Moderate',
                      'Moderately Severe',
                      'Severe',
                      'Profound',
                      'Dead Ear'
                    ],
                    _hearingLossDegree, (value) {
                  setState(() {
                    _hearingLossDegree = value;
                  });
                }),
                const SizedBox(height: 16),
                _buildDropdown(
                    "Type",
                    "Select type",
                    [
                      'Conductive',
                      'Sensoneural',
                      'Auditory Neuropathy',
                      'Mixed'
                    ],
                    _hearingLossType, (value) {
                  setState(() {
                    _hearingLossType = value;
                  });
                }),
                const SizedBox(height: 16),
                _buildDropdown(
                    "Hearing Device",
                    "Select device",
                    ['Hearing Aid', 'Cochlear Implant', 'Others'],
                    _hearingDevice, (value) {
                  setState(() {
                    _hearingDevice = value;
                  });
                }),
              ],
              const SizedBox(height: 16),
              _buildYesNo("Specific Language Impairment (SLI)", _hasSLI,
                  (value) {
                setState(() {
                  _hasSLI = value;
                });
              }),
              if (_hasSLI)
                _buildDropdown(
                    "SLI Type",
                    "Select SLI Type",
                    ['Dyslexia', 'Dysgraphia', 'Dyscalculia'],
                    _specificLanguageImpairment, (value) {
                  setState(() {
                    _specificLanguageImpairment = value;
                  });
                }),
              const SizedBox(height: 16),
              _buildYesNo("Pervasive Disorder", _hasPervasiveDisorder, (value) {
                setState(() {
                  _hasPervasiveDisorder = value;
                });
              }),
              if (_hasPervasiveDisorder)
                _buildDropdown(
                    "Pervasive Disorder Type",
                    "Select Pervasive Disorder",
                    ['ADHD', 'Autism', 'Others'],
                    _pervasiveDisorder, (value) {
                  setState(() {
                    _pervasiveDisorder = value;
                  });
                }),
              const SizedBox(height: 16),
              _buildTextField("Other", "Enter other disorders (if any)", null),
              const SizedBox(height: 16),
              _buildTextField(
                  "Reference Physician", "Enter physician's name", null),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Sign Up/Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build TextFormField
  Widget _buildTextField(
      String label, String hint, String? Function(String?)? validator) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: AppColors.textFieldColor,
        filled: true,
      ),
      validator: validator,
    );
  }

  // Helper to build Dropdown
  Widget _buildDropdown(String label, String hint, List<String> options,
      String? selectedValue, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: AppColors.textFieldColor,
        filled: true,
      ),
      value: selectedValue,
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  // Helper to build Yes/No toggle
  Widget _buildYesNo(String label, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        const Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
