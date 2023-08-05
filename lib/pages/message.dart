import 'package:flutter/material.dart';
import 'package:layop2/util/app_constant.dart';
import 'package:layop2/widget/k_text.dart';

class MessageOfStudent extends StatefulWidget {
  const MessageOfStudent({super.key});

  @override
  State<MessageOfStudent> createState() => _MessageOfStudentState();
}

class _MessageOfStudentState extends State<MessageOfStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const KText(text: "Notifications"),
        centerTitle: true,
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.search))],
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(
                thickness: .5,
              ),
          itemBuilder: (context, index) => const MessageTile(),
          itemCount: 22),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      onTap: null,
      trailing: KText(text: "Mon"),
      title: KText(
        text: "Type",
        weight: FontWeight.bold,
        color: AppConstant.secondaryColor,
      ),
      subtitle: KText(
        overflow: TextOverflow.ellipsis,
        text: "You need to write the test",
        color: AppConstant.secondaryColor,
      ),
      leading: Icon(Icons.message),
    );
  }
}
