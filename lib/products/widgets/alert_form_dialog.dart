import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DialogTextField extends Equatable {
  final String key;
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller = TextEditingController();
  String value;
  bool readOnly;

  DialogTextField({
    required this.key,
    required this.hintText,
    required this.validator,
    this.readOnly = false,
    this.value = "",
  });

  @override
  // todo: impl
  List<Object> get props => [validator, key, controller, hintText];
}

class AlertFormDialog extends StatelessWidget {
  // StatelessWidget because don`t need rebuild on change [isValid]
  final List<DialogTextField> textFields;
  bool isValid = false;

  AlertFormDialog({Key? key, required this.textFields}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width - 16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey[100]),
        padding: const EdgeInsets.fromLTRB(16, 16, 24, 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Product creation",
            ),
            const SizedBox(height: 30),
            AlertForm(
              textFields: textFields,
              onValidate: (isValid) {
                this.isValid = isValid;
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      if (isValid) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Submit"))
              ],
            )
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}

class AlertForm extends StatefulWidget {
  final void Function(bool) onValidate;
  final List<DialogTextField> textFields;

  const AlertForm({
    Key? key,
    required this.onValidate,
    required this.textFields,
  }) : super(key: key);

  @override
  State<AlertForm> createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _barCodeReadonly = false;

  @override
  Widget build(BuildContext context) {
    void onChanged() {
      final bool isValid = formKey.currentState!.validate();
      widget.onValidate(isValid);
      if (isValid) {
        formKey.currentState!.save();
      }
    }

    final DialogTextField? barFormField =
        widget.textFields.firstWhere((textField) => textField.key == "barCode");
    if (barFormField != null) {
      barFormField.controller.addListener(() {
        WidgetsBinding.instance?.addPostFrameCallback((_) => onChanged());
      });
    }

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...widget.textFields.map((textField) => AlertFormField(
                formKey: formKey,
                hintText: textField.hintText,
                onChanged: (string) {
                  onChanged();
                },
                onSaved: (value) {
                  textField.value = value ?? "";
                },
                textEditingController: textField.controller,
                readOnly: textField.readOnly,
                validator: textField.validator,
              )),
          if (barFormField != null)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Text("auto bar code"),
              value: _barCodeReadonly,
              onChanged: (bool? value) {
                if (value != null && value) {
                  // todo: should be unique checked
                  barFormField.controller.text =
                      "${Random().nextInt(899999999) + 100000000}";
                }
                setState(() {
                  _barCodeReadonly = value ?? false;
                });
              },
            ),
        ],
      ),
    );
  }
}

class AlertFormField extends StatelessWidget {
  final void Function(String?) onSaved;
  final void Function(String?) onChanged;
  final String? Function(String?) validator;
  final GlobalKey<FormState> formKey;
  final String hintText;
  final bool readOnly;
  final TextEditingController textEditingController;

  const AlertFormField({
    Key? key,
    required this.hintText,
    required this.onSaved,
    required this.onChanged,
    required this.validator,
    required this.formKey,
    required this.readOnly,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
