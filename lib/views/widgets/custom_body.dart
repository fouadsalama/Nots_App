import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:note_app/views/widgets/custom_app_bar.dart';

import 'nots_list_view.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          NoteAppBar(
            icon: Icons.search,
            titleAppBar: 'Notes',
          ),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
