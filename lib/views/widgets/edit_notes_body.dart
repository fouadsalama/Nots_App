import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'package:note_app/views/widgets/edit_color_list_view.dart';

class EditNotesBody extends StatelessWidget {
  const EditNotesBody({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NoteAppBar(
          onPressed: () {
            note.title =
                BlocProvider.of<NotesCubit>(context).title ?? note.title;
            note.subTitle =
                BlocProvider.of<NotesCubit>(context).subTitle ?? note.subTitle;
            note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
          titleAppBar: 'Edit Notes',
          icon: Icons.check,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            children: [
              CustomTextField(
                onChange: (value) {
                  BlocProvider.of<NotesCubit>(context).title = value;
                },
                title: note.title,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                onChange: (value) {
                  BlocProvider.of<NotesCubit>(context).subTitle = value;
                },
                title: note.subTitle,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              EditColorsListView(
                notes: note,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
