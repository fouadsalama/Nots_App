import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

import 'widgets/edit_notes_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.notes});
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: EditNotesBody(note: notes)),
      ),
    );
  }
}
