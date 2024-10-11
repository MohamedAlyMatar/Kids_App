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
  bool? _hasDLD = false;
  bool? _hasHearingLoss = false;
  bool? _hasSLI = false;
  bool? _hasPervasiveDisorder = false;
  bool? _hasOther = false;
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
              const Text(
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
              const DatePickerWidget(
                label: 'Date of Birth',
                hintText: '',
              ),
              const SizedBox(height: 16),
              _buildToggle(
                "Handness",
                _handness,
                (String? value) {
                  setState(() {
                    _handness = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildYesNoToggle(
                "Delayed Language Disorder (DLD)",
                _hasDLD,
                (bool? value) {
                  setState(() {
                    _hasDLD = value;
                  });
                },
              ),
              if (_hasDLD!) ...[
                const Text(
                  "Please select the causes of DLD: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                _buildYesNoToggle(
                  "Hearing Loss",
                  _hasHearingLoss,
                  (bool? value) {
                    setState(() {
                      _hasHearingLoss = value;
                    });
                  },
                ),
                _buildYesNoToggle(
                  "Persevasive Disorder",
                  _hasPervasiveDisorder,
                  (bool? value) {
                    setState(() {
                      _hasPervasiveDisorder = value;
                    });
                  },
                ),
                _buildYesNoToggle(
                  "Specific Language Impairment (SLI)",
                  _hasSLI,
                  (bool? value) {
                    setState(() {
                      _hasSLI = value;
                    });
                  },
                ),
                _buildYesNoToggle(
                  "Other",
                  _hasOther,
                  (bool? value) {
                    setState(() {
                      _hasOther = value;
                    });
                  },
                ),
              ],
              const SizedBox(height: 16),
              if (_hasHearingLoss!) ...[
                const Text(
                  "Hearing Loss: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
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
              if (_hasSLI!) ...[
                const SizedBox(height: 16),
                const Text(
                  "Specific Language Impairment: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                _buildDropdown(
                    "SLI Type",
                    "Select SLI Type",
                    ['Dyslexia', 'Dysgraphia', 'Dyscalculia'],
                    _specificLanguageImpairment, (value) {
                  setState(() {
                    _specificLanguageImpairment = value;
                  });
                }),
              ],
              if (_hasPervasiveDisorder!) ...[
                const SizedBox(height: 16),
                const Text(
                  "Pervasive Disorder: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                _buildDropdown(
                    "Pervasive Disorder Type",
                    "Select Pervasive Disorder",
                    ['ADHD', 'Autism', 'Others'],
                    _pervasiveDisorder, (value) {
                  setState(() {
                    _pervasiveDisorder = value;
                  });
                }),
              ],
              if (_hasOther!) ...[
                const SizedBox(height: 16),
                const Text(
                  "Write other causes: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                    "Other", "Enter other disorders (if any)", null),
              ],
              const SizedBox(height: 16),
              const Text(
                "Reference your Physician",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              _buildTextField("Physician name", "Enter physician's name", null),
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

// Helper to build Right/Left checkbox toggle for Handness
  Widget _buildToggle(
      String label, String? selectedValue, Function(String?) onChanged) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        const Spacer(),
        Row(
          children: [
            Checkbox(
              value: selectedValue == 'Right',
              onChanged: (bool? value) {
                onChanged(value == true ? 'Right' : null);
              },
            ),
            const Text("Right"),
            const SizedBox(width: 20), // Add space between options
            Checkbox(
              value: selectedValue == 'Left',
              onChanged: (bool? value) {
                onChanged(value == true ? 'Left' : null);
              },
            ),
            Text("Left"),
          ],
        ),
      ],
    );
  }
}

Widget _buildYesNoToggle(
    String label, bool? selectedValue, Function(bool?) onChanged) {
  return Row(
    children: [
      Text(label, style: TextStyle(fontSize: 16)),
      const Spacer(),
      Row(
        children: [
          Checkbox(
            value: selectedValue == true,
            onChanged: (bool? value) {
              onChanged(value == true ? true : false);
            },
          ),
          const Text("Yes"),
          const SizedBox(width: 20),
          Checkbox(
            value: selectedValue == false,
            onChanged: (bool? value) {
              onChanged(value == true ? false : true);
            },
          ),
          const Text("No"),
        ],
      ),
    ],
  );
}
