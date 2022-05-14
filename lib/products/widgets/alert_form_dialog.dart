import 'package:flutter/material.dart';

class AlertFormDialog extends StatelessWidget {
  const AlertFormDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width - 16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[100]
        ),
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
             AlertForm(onCorrectSubmit: (data) {
               // todo: implement work with data
               return data;
             },),
             const SizedBox(height: 30),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 TextButton(
                     onPressed: (){
                       Navigator.pop(context);
                     },
                     child: const Text("No")
                 ),
                 TextButton(
                     onPressed: (){
                       Navigator.pop(context);
                     },
                     child: const Text("Yes")
                 )
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
  final void Function(dynamic) onCorrectSubmit;

  const AlertForm({Key? key, required this.onCorrectSubmit}) : super(key: key);

  @override
  State<AlertForm> createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  widget.onCorrectSubmit();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
