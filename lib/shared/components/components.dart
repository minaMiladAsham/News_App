import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/web_view_screen/web_view_screen.dart';

Widget MyDivider() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: double.infinity,
      color: Colors.grey[100],
      height: 2,
    ),
  );
}

Widget defaultTextFormField({
  TextEditingController? controller,
  FormFieldValidator<String>? validate,
  String? labelText,
  TextInputType? type,
  IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  VoidCallback? onTap,
  ValueChanged<String>? onChanged,
}) =>
    TextFormField(
      onTap: onTap,
      validator: validate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffix)),
        labelText: labelText,
      ),
    );

Widget NewsItem(dynamic newsList, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(newsList["url"]));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${newsList['urlToImage']}"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${newsList['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${newsList['publishedAt']}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );

void navigateTo(
  context,
  Widget page,
) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
