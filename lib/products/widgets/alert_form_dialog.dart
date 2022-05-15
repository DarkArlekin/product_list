import 'dart:math';

import 'package:flutter/material.dart';

class AlertFormDialog extends StatelessWidget {
  final Map<String, String> inputData = {};

  AlertFormDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width - 16,
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
              onCorrectSubmit: (key, value) {
                print("$key: $value");
                inputData[key] = value;
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
                      print(inputData);
                      if (inputData["barCode"] != null &&
                          inputData["title"] != null) {
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
  final void Function(String, String) onCorrectSubmit;

  const AlertForm({Key? key, required this.onCorrectSubmit}) : super(key: key);

  @override
  State<AlertForm> createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController barCodeController = TextEditingController();
  bool _barCodeReadonly = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AlertFormField(
            textEditingController: TextEditingController(),
            formKey: formKey,
            onSaved: (value) {
              widget.onCorrectSubmit("title", value ?? "");
            },
            hintText: 'Product Title',
          ),
          AlertFormField(
            textEditingController: barCodeController,
            formKey: formKey,
            onSaved: (value) {
              widget.onCorrectSubmit("barCode", value ?? "");
            },
            readOnly: _barCodeReadonly,
            hintText: 'Product Bar Code',
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Text("auto bar code"),
            value: _barCodeReadonly,
            onChanged: (bool? value) {
              if (value != null && value) {
                barCodeController.text =
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
  final GlobalKey<FormState> formKey;
  final String hintText;
  final bool readOnly;
  final TextEditingController textEditingController;

  const AlertFormField({
    Key? key,
    required this.hintText,
    required this.onSaved,
    required this.formKey,
    this.readOnly = false,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onChanged() {
      formKey.currentState!.validate();
      formKey.currentState!.save();
    }
    textEditingController.addListener(() {
      // bad code
      WidgetsBinding.instance
          ?.addPostFrameCallback((_) => onChanged());
    });

    return TextFormField(
      readOnly: readOnly,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onSaved: onSaved,
      onChanged: (value) {
        onChanged();
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
