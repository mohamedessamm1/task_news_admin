import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_manager_state.dart';

class HomeManagerCubit extends Cubit<HomeManagerState> {
  HomeManagerCubit() : super(HomeManagerInitial());
  static HomeManagerCubit get(context) => BlocProvider.of(context);
  List newsList = [];

  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController shortSummary = TextEditingController();
  Uint8List? bytesFromPicker;
  Uint8List? editNewsbytesFromPicker;
  String? ImageNameToSupabase;
  String? editNewsImageNameToSupabase;
  var imageFile;
  var editNewsimageFile;
  bool isActive = false;
  int? selectedValue;

  Future getDataFromDatabase() async {
    emit(GetDataFromDataBaseLoadingState());
    final supabaseClient = Supabase.instance.client;

  await  supabaseClient.from('news').select().then((value) {
      newsList = value;
      print(newsList);
    });
    emit(GetDataFromDataBaseState());
  }

  Future<void> editNewspickImage() async {
    editNewsbytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    emit(ProfileimgSuccess());
  }
  Future<void> editNewsuploadImageBytes(Uint8List imageBytes) async {
    final supabaseClient = Supabase.instance.client;

    try {
      final bucket = supabaseClient.storage.from('news');
      final filePath =
          'images/${DateTime.now().millisecondsSinceEpoch}.jpg'; // Change the extension as needed

      editNewsimageFile = await bucket.uploadBinary(filePath, imageBytes).then(
            (value) {
          editNewsImageNameToSupabase = Supabase.instance.client.storage
              .from('news/')
              .getPublicUrl(filePath)
              .toString();
          print(editNewsImageNameToSupabase);
        },
      );
      emit(ImageSuccessUploadState());
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> pickImage() async {
    bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    uploadImageBytes(bytesFromPicker!);
    emit(ProfileimgSuccess());
  }

  Future<void> uploadImageBytes(Uint8List imageBytes) async {
    final supabaseClient = Supabase.instance.client;

    try {
      // Define the storage bucket and file path (you can modify the path)
      final bucket = supabaseClient.storage.from('news');
      final filePath =
          'images/${DateTime.now().millisecondsSinceEpoch}.jpg'; // Change the extension as needed

      imageFile = await bucket.uploadBinary(filePath, imageBytes).then(
        (value) {
          ImageNameToSupabase = Supabase.instance.client.storage
              .from('news/')
              .getPublicUrl(filePath)
              .toString();
          print(ImageNameToSupabase);
        },
      );
      emit(ImageSuccessUploadState());
    } catch (e) {
      print("Error: $e");
    }
  }

  radioChange(value){
    selectedValue = value;
emit(RadioChangeState());
  }


  Future uploadDataBase({
    required BuildContext context,
  }) async {
    Supabase.instance.client.from('news').insert({
      'image': ImageNameToSupabase,
      'title': title.text,
      'details': details.text,
      'active': isActive,
      'short_summary': shortSummary.text,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'تم ارسال البيانات بنجاح',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 10),
          backgroundColor: Colors.green,
        ),
      );
      // 2000ms = 2 seconds
      getDataFromDatabase();
    });
    bytesFromPicker = null;
    ImageNameToSupabase = '';
    emit(DataBaseUploadedState());
  }

  changeSwitch() {
    isActive = !isActive;
    emit(ChangeSwitchSuccessState());
  }



  Future<void> updateData(
      {
        required title,
        required context,
      required shortSummary,
      required details,
      required id
      }) async {
    await Supabase.instance.client
        .from('news')
        .update(
            {'title': title,
              'active':isActive,
              'short_summary': shortSummary, 'details': details})
        .eq('id', id)
        .then(
          (value) async{
           await getDataFromDatabase();
            Navigator.pop(context);
          },

    );

  }

  Future<void> updateImageNews(
      {
        required context,
      required id
      }) async {
    await Supabase.instance.client
        .from('news')
        .update(
            {
              'image': editNewsImageNameToSupabase
            })
        .eq('id', id)
        .then(
          (value) async{
           await getDataFromDatabase();
            Navigator.pop(context);
          },

    );

  }
}
