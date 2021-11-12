import 'package:flutter/material.dart';
import '../widgets/add_conference_form.dart';
class AddConferenceScreen extends StatefulWidget {
  const AddConferenceScreen({Key? key}) : super(key: key);

  @override
  _AddConferenceScreenState createState() => _AddConferenceScreenState();
}

class _AddConferenceScreenState extends State<AddConferenceScreen> {
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
            title: Center(child: Text('Añadir'),),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AddConferenceForm(
                titleFocusNode: _titleFocusNode, 
                speakerFocusNode: _speakerFocusNode, 
                areaFocusNode: _areaFocusNode, 
                dateFocusNode: _dateFocusNode),
            ),
          ),
        ));
  }
}
