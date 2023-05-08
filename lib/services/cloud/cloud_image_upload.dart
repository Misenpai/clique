import 'dart:io';
import 'package:clique/services/cloud/cloud_current_user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadImage extends StatefulWidget {
  final String chatRoomId;

  const UploadImage({super.key, required this.chatRoomId});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  late File _image;
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    Future<void> _uploadImage() async {
      final storage = FirebaseStorage.instance;
      final ref = storage.ref().child(widget.chatRoomId).child(_image.path);
      final uploadTask = ref.putFile(_image);

      setState(() {
        _isUploading = true;
      });
      try {
        final snapshot = await uploadTask.whenComplete(() {});
        final downloadUrl = await snapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('chatroom')
            .doc(widget.chatRoomId)
            .collection('chats')
            .doc(_image.path)
            .set({
          'sendby': getUserName(),
          'message': '',
          'type': 'img',
          'time': FieldValue.serverTimestamp(),
          'imageUrl': downloadUrl,
        });
      } catch (error) {
        ref.delete();
      }
        
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
