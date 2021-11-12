import 'package:flutter/material.dart';
import '../utils/database.dart';
import '../utils/validator.dart';

class AddConferenceForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode speakerFocusNode;
  final FocusNode areaFocusNode;
  final FocusNode dateFocusNode;
  const AddConferenceForm(
      {required this.titleFocusNode,
      required this.speakerFocusNode,
      required this.areaFocusNode,
      required this.dateFocusNode,
      Key? key})
      : super(key: key);

  @override
  _AddConferenceFormState createState() => _AddConferenceFormState();
}

class _AddConferenceFormState extends State<AddConferenceForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _speakerController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool _isProcessing = false; 

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            focusNode: widget.titleFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) => Validator.validateField(
              value: value.toString(),
            ),
            decoration: InputDecoration(
              label: Text('Título'),
              border: OutlineInputBorder(),
              hintText: 'Título',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _speakerController,
            focusNode: widget.speakerFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) => Validator.validateField(
              value: value.toString(),
            ),
            decoration: InputDecoration(
              label: Text('Speaker'),
              border: OutlineInputBorder(),
              hintText: 'Speaker',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _areaController,
            focusNode: widget.areaFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) => Validator.validateField(
              value: value.toString(),
            ),
            decoration: InputDecoration(
              label: Text('Area'),
              hintText: 'Area',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _dateController,
            focusNode: widget.dateFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) => Validator.validateField(
              value: value.toString(),
            ),
            decoration: InputDecoration(
              label: Text('Fecha'),
              hintText: 'Fecha',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _isProcessing
              ? Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isProcessing = true;
                      });
                      await Database.addConference(
                        title: _titleController.text,
                        speaker: _speakerController.text,
                        area: _areaController.text,
                        date: _dateController.text,
                      );

                      setState(() {
                        _isProcessing = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Añadir Conferencia'),
                  ),
                ),
        ],
      ),
    );
  }
}
