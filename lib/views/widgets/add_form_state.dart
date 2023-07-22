import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/colors_list_view.dart';
import 'package:note_app/views/widgets/custom_bottom.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class AddFormState extends StatefulWidget {
  const AddFormState({
    super.key,
  });

  @override
  State<AddFormState> createState() => _AddFormStateState();
}

String? title, subTitle;

GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _AddFormStateState extends State<AddFormState> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              BlocProvider.of<NotesCubit>(context).title = value;
            },
            title: 'Title',
          ),
          const SizedBox(height: 20),
          CustomTextField(
            onSaved: (value) {
              BlocProvider.of<NotesCubit>(context).subTitle = value;
            },
            title: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          const ColorsListView(),
          const SizedBox(height: 16),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomBottom(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatCurrentDate =
                        DateFormat('dd-MM-yyyy').format(currentDate);
                    var noteModel = NoteModel(
                      title:
                          BlocProvider.of<NotesCubit>(context).title ?? title!,
                      subTitle: BlocProvider.of<NotesCubit>(context).subTitle ??
                          subTitle!,
                      date: formatCurrentDate.toString(),
                      color: Colors.blue.value,
                    );

                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
