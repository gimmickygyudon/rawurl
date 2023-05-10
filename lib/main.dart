import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RawUrl',
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: const MyHomePage(title: 'RawUrl')
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7)),
          shadowColor: Theme.of(context).primaryColorLight,
          scrolledUnderElevation: 20,
          surfaceTintColor: Colors.transparent,
          title: Row(
            children: [
              Text(widget.title),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.navigate_next),
              ),
              const Text('Hub', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.hovered)
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade800;
                    }),
                    side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.blueGrey.shade50)
                    )
                  )
                ),
              ),
              child: ButtonBar(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.hovered)
                          ? Theme.of(context).colorScheme.surfaceTint
                          : Theme.of(context).colorScheme.surface;
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.hovered)
                          ? Theme.of(context).hoverColor
                          : Theme.of(context).colorScheme.surfaceTint;
                      }),
                      side: const MaterialStatePropertyAll(BorderSide.none)
                    ),
                    icon: const Icon(Icons.add_link),
                    label: const Text('Add Link')
                  ),
                  OutlinedButton.icon(
                    onPressed: () {}, 
                    icon: const Icon(Icons.search),
                    label: const Text('Search Links')
                  ),
                  OutlinedButton.icon(
                    onPressed: () {}, 
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filters')
                  ),
                  IconButton(
                    onPressed: () {},
                    tooltip: 'Visibility',
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.blueGrey.shade50)
                      )
                    ),
                    icon: const Icon(Icons.visibility_outlined)
                  )
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              child: Theme(
                data: Theme.of(context).copyWith(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  chipTheme: ChipThemeData(
                    backgroundColor: Colors.green.shade400,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.fromLTRB(6, 1, 6, 0),
                    labelPadding: EdgeInsets.zero,
                  )
                ),
                child: GridView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.fromLTRB(12, 64, 12, 0),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                    childAspectRatio: 9/14
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    bool isHovered = false;
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AnimatedScale(
                          duration: const Duration(milliseconds: 100),
                          scale: isHovered ? 1.05 : 1,
                          child: InkWell(
                            onTap: () {},
                            onHover: (value) => setState(() => isHovered = value),
                            borderRadius: BorderRadius.circular(12),
                            splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: index == 3 ? const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('https://www.phoronix.net/image.php?id=amd-epyc-auto-ibrs&image=zen4_autoibrs_2_med')
                                ) : null,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [ Colors.transparent, isHovered ? Colors.black87 : Colors.black54 ]
                                  )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if(index != 3) const Expanded(child: Center(child: FlutterLogo(size: 62))),
                                    if(index == 3) ...[ 
                                      Wrap(
                                        spacing: 4,
                                        children: [
                                          Chip(label: Text('Tech'.toUpperCase(), style: const TextStyle(color: Colors.white))),
                                        ]
                                      ),
                                      const SizedBox(height: 8),
                                      Text("Linux Patches Updated For Parallel CPU Bring-Up".toUpperCase(), 
                                        style: TextStyle(fontWeight: FontWeight.w900, color: isHovered ? Theme.of(context).colorScheme.inversePrimary : Colors.grey.shade200)
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Image.network('https://www.phoronix.com/favicon.ico', height: 12),
                                          const SizedBox(width: 6),
                                          Text('phoronix.com', style: TextStyle(color: isHovered ? Colors.grey.shade300 : Colors.grey.shade400)),
                                        ],
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
