import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufo_aliens_check_app/constants/controllers.dart';
import 'package:ufo_aliens_check_app/screens/home/home_screen.dart';
import 'package:ufo_aliens_check_app/screens/image/image_list_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                const Center(
                  child: Text(
                    "SEND IMAGE/VIDEO/RACE",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 18),
                      label: Text("Your Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.teal)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.tealAccent),
                      ),
                      suffixIcon: Icon(Icons.edit, color: Colors.teal),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {}),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 18),
                      label: Text("Title",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.teal)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.tealAccent),
                      ),
                      suffixIcon: Icon(Icons.edit, color: Colors.teal),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {}),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 18),
                      label: Text("Description",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.teal)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.tealAccent),
                      ),
                      suffixIcon: Icon(Icons.edit, color: Colors.teal),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {}),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _urlController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 18),
                      label: Text("Link",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.teal)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.tealAccent),
                      ),
                      suffixIcon: Icon(Icons.edit, color: Colors.teal),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {}),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        if(_titleController.value.text.isNotEmpty) {
                          contentController.sendPost(
                              _nameController.value.text,
                              _titleController.value.text,
                              _descriptionController.value.text,
                              _urlController.value.text
                          );

                          Get.off(() => const HomeScreen());

                        }else{
                          Get.snackbar("Title", "Title must be filled in");
                        }
                      },
                      icon: const Icon(
                        Icons.send_outlined,
                        color: Colors.teal,
                      ),
                      label: const Text(
                        "SEND",
                        style: TextStyle(color: Colors.teal),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
