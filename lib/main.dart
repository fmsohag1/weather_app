import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/consts/const.dart';
import 'package:weather_app/controller/main_controller.dart';
import 'package:weather_app/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMd").format(DateTime.now());
    var theme=Theme.of(context);
    var controller=Get.put(MainController());
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: "${date}".text.color(theme.primaryColor).make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Obx(()=>
            IconButton(
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Icon(
                  controller.isDark.value?Icons.light_mode:Icons.dark_mode,
                  color: theme.iconTheme.color,
                )),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: theme.iconTheme.color,
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "DHAKA"
                  .text
                  .color(theme.primaryColor)
                  .size(30)
                  .letterSpacing(3)
                  .fontFamily(poppins_bold)
                  .make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    img01d,
                    width: 60,
                    height: 60,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "37$degree",
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 55,
                            fontFamily: poppins)),
                    TextSpan(
                        text: "Sunny",
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 14,
                            fontFamily: poppins))
                  ]))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_less_rounded,
                        color: theme.iconTheme.color,
                      ),
                      label: "24$degree".text.size(12).color(theme.iconTheme.color).make()),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_more_rounded,
                        color: theme.iconTheme.color,
                      ),
                      label: "16$degree".text.size(12).color(theme.iconTheme.color).make()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    iconslist.length,
                    (index) => Column(
                          children: [
                            Image.asset(
                              iconslist[index],
                              width: 60,
                              height: 60,
                            )
                                .box
                                .roundedSM
                                .gray200
                                .padding(EdgeInsets.all(8))
                                .make(),
                            10.heightBox,
                            values[index].text.gray400.make()
                          ],
                        )),
              ),
              10.heightBox,
              Divider(),
              10.heightBox,
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                    itemBuilder: (BuildContext context,int index){
                  return Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: Vx.gray200,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        "${index+1} AM".text.gray800.make(),
                        Image.asset(img09n,width: 80,),
                        "38$degree".text.gray800.make(),
                      ],
                    ),
                  );
                }),
              ),
              10.heightBox,
              Divider(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Next 7 days".text.semiBold.color(theme.primaryColor).make(),
                  TextButton(onPressed: (){}, child: "View all".text.make())
                ],
              ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                  var day=DateFormat("EEEE").format(DateTime.now().add(Duration(days: index+1)));
                return Card(
                  color: theme.cardColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: day.text.color(theme.primaryColor).semiBold.make()),
                        Expanded(
                          child: TextButton.icon(
                              onPressed: () {},
                              icon:
                                Image.asset(img50n,width: 40,),
                              label: "24$degree".text.size(12).color(theme.primaryColor).make()),
                        ),
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: "37$degree /",
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontFamily: poppins,
                                fontSize: 16
                              )
                            ),
                            TextSpan(
                                text: " 20$degree",
                                style: TextStyle(
                                    color: theme.iconTheme.color,
                                    fontFamily: poppins,
                                    fontSize: 16
                                )
                            )
                          ]
                        ))
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
