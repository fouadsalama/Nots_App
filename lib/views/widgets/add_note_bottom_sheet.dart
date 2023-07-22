import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:note_app/views/widgets/add_form_state.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: BlocConsumer<AddNotesCubit, AddNotesState>(
            listener: (context, state) {
              if (state is AddNotesFailure) {}
              if (state is AddNotesSuccess) {
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is AddNotesLoading ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 32,
                      right: 16,
                      left: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const SingleChildScrollView(
                    child: AddFormState(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
