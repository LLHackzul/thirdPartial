import 'package:flutter/material.dart';
import '../utils/database.dart';
import '../utils/validator.dart';

class EditConferenceForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode speakerFocusNode;
  final FocusNode areaFocusNode;
  final FocusNode dateFocusNode;
  final String currentTitle;
  final String currentSpeaker;
  final String currentArea;
  final String currentDate;
  final String documentId;
  EditConferenceForm(
      {required this.titleFocusNode,
      required this.speakerFocusNode,
      required this.areaFocusNode,
      required this.dateFocusNode,
      required this.currentTitle,
      required this.currentSpeaker,
      required this.currentArea,
      required this.currentDate,
      required this.documentId,
      Key? key})
      : super(key: key);

  @override
  _EditConferenceFormState createState() => _EditConferenceFormState();
}

class _EditConferenceFormState extends State<EditConferenceForm> {
  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _speakerController = TextEditingController();
  late TextEditingController _areaController = TextEditingController();
  late TextEditingController _dateController = TextEditingController();
  bool _isProcessing = false;
  @override
  void initState() {
    _titleController = TextEditingController(text: widget.currentTitle);
   _speakerController = TextEditingController(text: widget.currentSpeaker);
   _areaController = TextEditingController(text: widget.currentArea);
   _dateController = TextEditingController(text: widget.currentDate);
    super.initState();
  }

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
                      await Database.updateConference(
                        title: _titleController.text,
                        speaker: _speakerController.text,
                        area: _areaController.text,
                        date: _dateController.text,
                        docId: widget.documentId
                      );

                      setState(() {
                        _isProcessing = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Actualizar'),
                  ),
                ),
        ],
      ),
    );
  }
}
