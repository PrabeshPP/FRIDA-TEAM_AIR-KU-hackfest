import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend_flutter/model/floods/floods.dart';
import 'package:frontend_flutter/services/floods/floods_repository.dart';

class FloodsPage extends StatefulWidget {
  const FloodsPage({Key? key}) : super(key: key);

  @override
  State<FloodsPage> createState() => _FloodsPageState();
}

class _FloodsPageState extends State<FloodsPage> {
  FloodsRepository eventsRepository = FloodsRepository();
  List<Floods>? listEvents = [];
  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  loadEvents() async {
    listEvents = await eventsRepository.getEvents();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Floods"),
      ),
      body: SizedBox(
          width: size.width,
          child: ListView.builder(
            itemCount: listEvents!.length,
            itemBuilder: ((context, index) {
              Floods news = listEvents![index];
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                    horizontal: size.width * 0.05),
                child: Container(
                  height: size.height * 0.24,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color.fromARGB(63, 0, 0, 0),
                        )
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.2 * 0.2,
                            child: Text(
                              news.riverName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.004),
                          child: SizedBox(
                            width: size.width * 0.8,
                            child: Text(
                              news.message,
                              maxLines: 4,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Water Level:${news.waterLevel}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          )),
    );
  }
}
