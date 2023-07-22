import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.notes,
  });
  final NoteModel notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotesView(notes: notes);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(notes.color),
        ),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                    title: Text(
                      notes.title,
                      style: const TextStyle(color: Colors.black, fontSize: 26),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        notes.subTitle,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        notes.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.black,
                        size: 24,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 16),
                  child: Text(
                    notes.date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
