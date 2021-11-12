import 'package:flutter/material.dart';
import '../utils/database.dart';
import '../widgets/edit_conference_form.dart';

class EditConferenceScreen extends StatefulWidget {
  final String currentTitle;
  final String currentSpeaker;
  final String currentArea;
  final String currentDate;
  final String documentId;
  EditConferenceScreen(
      {required this.currentTitle,
      required this.currentSpeaker,
      required this.currentArea,
      required this.currentDate,
      required this.documentId,
      Key? key})
      : super(key: key);

  @override
  _EditConferenceScreenState createState() => _EditConferenceScreenState();
}

class _EditConferenceScreenState extends State<EditConferenceScreen> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _speakerFocusNode = FocusNode();
  final FocusNode _areaFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _titleFocusNode.unfocus();
          _speakerFocusNode.unfocus();
          _areaFocusNode.unfocus();
          _dateFocusNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Editar'),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    await Database.deleteConference(docId: widget.documentId);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: EditConferenceForm(
                titleFocusNode: _titleFocusNode,
                speakerFocusNode: _speakerFocusNode,
                areaFocusNode: _areaFocusNode,
                dateFocusNode: _dateFocusNode,
                currentTitle: widget.currentTitle,
                currentSpeaker: widget.currentSpeaker,
                currentArea: widget.currentArea,
                currentDate: widget.currentDate,
                documentId: widget.documentId,
              ),
            ),
          ),
        ));
  }
}
