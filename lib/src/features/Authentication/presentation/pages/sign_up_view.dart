import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_event.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_state.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/datepicker.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/password_field.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is SignUpLoading) {
              // Show loading indicator
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Signing up...'),
                duration: Duration(seconds: 2),
              ));
            } else if (state is SignUpSuccess) {
              // Navigate to home screen on success
              Navigator.pushReplacementNamed(context, Routes.gamesMenu);
            } else if (state is SignUpFailure) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: SingleChildScrollView(
            child: Center(
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
                      const SizedBox(height: 16),
                      MyTextField(
                        label: "Name",
                        hintText: "Enter your name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(SignUpNameChanged(value));
                        },
                      ),
                      const SizedBox(height: 16),
                      MyTextField(
                        label: "Email",
                        hintText: "Enter your email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(SignUpEmailChanged(value));
                        },
                      ),
                      const SizedBox(height: 16),
                      PasswordField(
                        label: "Password",
                        hintText: "Enter your password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(HandnessChanged(value));
                        },
                      ),
                      const SizedBox(height: 16),
                      const DatePickerWidget(
                        label: 'Date of Birth',
                        hintText: '',
                      ),
                      const SizedBox(height: 16),
                      _buildToggle(
                        "Handness",
                        _handness,
                        (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(HandnessChanged(value));
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildYesNoToggle(
                        "Delayed Language Disorder (DLD)",
                        _hasDLD,
                        (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(DLDChanged(value));
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
                          (value) {
                            context
                                .read<AuthenticationBloc>()
                                .add(HearingLossChanged(value));
                          },
                        ),
                        _buildYesNoToggle(
                          "Persevasive Disorder",
                          _hasPervasiveDisorder,
                          (value) {
                            context
                                .read<AuthenticationBloc>()
                                .add(PDChanged(value));
                          },
                        ),
                        _buildYesNoToggle(
                          "Specific Language Impairment (SLI)",
                          _hasSLI,
                          (value) {
                            context
                                .read<AuthenticationBloc>()
                                .add(SLIChanged(value));
                          },
                        ),
                        _buildYesNoToggle(
                          "Other",
                          _hasOther,
                          (value) {
                            context
                                .read<AuthenticationBloc>()
                                .add(OtherChanged(value));
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
                        _buildDropdown(
                          "Side",
                          "Select side",
                          ['Unilateral', 'Bilateral'],
                          _hearingLossSide,
                          (value) {
                            context
                                .read<AuthenticationBloc>()
                                .add(HearingLossSideChanged(value));
                          },
                        ),
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
                          context
                              .read<AuthenticationBloc>()
                              .add(HearingLossDegreeChanged(value));
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
                          context
                              .read<AuthenticationBloc>()
                              .add(HearingLossTypeChanged(value));
                        }),
                        const SizedBox(height: 16),
                        _buildDropdown(
                            "Hearing Device",
                            "Select device",
                            ['Hearing Aid', 'Cochlear Implant', 'Others'],
                            _hearingDevice, (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(HearingLossDeviceChanged(value));
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
                          context
                              .read<AuthenticationBloc>()
                              .add(SLIValueChanged(value));
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
                          context
                              .read<AuthenticationBloc>()
                              .add(PDValueChanged(value));
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
                        MyTextField(
                          label: "Other",
                          hintText: "Enter other disorders (if any)",
                          validator: null,
                          onSaved: (value) {
                            context
                                .read<AuthenticationBloc>()
                                .add(OtherValueChanged(value));
                          },
                        ),
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
                      MyTextField(
                        label: "Physician name",
                        hintText: "Enter physician's name",
                        validator: null,
                        onSaved: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(PhysicianNameChanged(value));
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')),
                            );
                            context
                                .read<AuthenticationBloc>()
                                .add(SignUpSubmitted());
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
            ),
          ),
        ),
      ),
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
