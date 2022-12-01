import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/presentation/locator.dart';
import 'package:inno_quiz_app/presentation/pages/navigation/router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultPage extends ConsumerStatefulWidget {
  const ResultPage({super.key});

  @override
  ConsumerState<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: Center(
          child: Container(
            // margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hey, ${ref.read(resultProvider).username}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'We think you are a '),
                      TextSpan(
                        text: determineResult(ref.read(resultProvider).answers),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  style: TextStyle(color: Colors.black54, fontSize: 30),
                ),
                const SizedBox(height: 20),
                // TODO: replace with copyrigth free image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      'https://koreajoongangdaily.joins.com/data/photo/2022/04/01/96587477-f706-4c95-b158-cd54cf781305.jpg'),
                ),
                const SizedBox(
                  height: 20,
                ),

                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () => context.router.navigate(MainRoute()),
                          icon: Icon(Icons.replay),
                          label: Text('Go again')),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          final uri = Uri.parse(
                              'https://www.verywellmind.com/the-myers-briggs-type-indicator-2795583#');
                          launchUrl(uri);
                        },
                        icon: Icon(Icons.question_mark_rounded),
                        label: Text('What that means'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => Center(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      ref.read(resultProvider).inviteId ??
                                          'ID not found'),
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.copy),
                        label: Text('Save my result (get ID)'),
                      ),
                      if (ref.read(resultProvider).inviteId != null) ...[
                        const SizedBox(width: 20),
                        ElevatedButton(
                            onPressed: () =>
                                context.router.push(CompareRoute()),
                            child: Text('Compare with friend')),
                      ],
                      if (ref.read(resultProvider).inviteId != null) ...[
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            final id = ref.read(resultProvider).id;
                            if (id != null) {
                              Share.share(
                                  'Hey! Find out which personality type are you at this link https://glebosotov.github.io/inno-quiz-app/#/signin/$id');
                            }
                          },
                          icon: Icon(Icons.share),
                          label: Text('Invite a friend'),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String determineResult(BuiltMap<String, String> map) {
  final answers = map.entries.map((e) => '${e.key}${e.value}').toSet();

  final eScore = e.keys.toSet().intersection(answers).length;
  final iScore = i.keys.toSet().intersection(answers).length;
  final sScore = s.keys.toSet().intersection(answers).length;
  final nScore = n.keys.toSet().intersection(answers).length;
  final tScore = t.keys.toSet().intersection(answers).length;
  final fScore = f.keys.toSet().intersection(answers).length;
  final jScore = j.keys.toSet().intersection(answers).length;
  final pScore = p.keys.toSet().intersection(answers).length;

  return '${eScore >= iScore ? 'E' : 'I'}${sScore >= nScore ? 'S' : 'N'}${tScore >= fScore ? 'T' : 'F'}${jScore >= pScore ? 'J' : 'P'}';
}

const Map<String, int> e = {
  '3A': 2,
  '6A': 2,
  '9A': 2,
  '13A': 1,
  '16A': 2,
  '21A': 2,
  '24A': 1,
  '26A': 1,
  '29B': 2,
  '36B': 2,
  '43B': 1,
};

const Map<String, int> i = {
  '3B': 2,
  '6B': 1,
  '9B': 1,
  '13B': 2,
  '16B': 2,
  '21B': 2,
  '24B': 1,
  '26B': 0,
  '29A': 2,
  '36A': 1,
  '43A': 1,
};

const Map<String, int> s = {
  '2A': 2,
  '5B': 1,
  '10A': 1,
  '12A': 1,
  '15B': 1,
  '20A': 2,
  '23B': 2,
  '28A': 2,
  '31B': 2,
  '35A': 2,
  '38B': 2,
  '42A': 1,
  '45B': 2,
  '48A': 1,
};

const Map<String, int> n = {
  '2B': 2,
  '5A': 1,
  '10B': 2,
  '12B': 2,
  '15A': 0,
  '20B': 2,
  '23A': 1,
  '28B': 1,
  '31A': 0,
  '35B': 1,
  '38A': 0,
  '42B': 2,
  '45A': 0,
  '48B': 1,
};

const Map<String, int> t = {
  '4B': 2,
  '14B': 2,
  '22B': 2,
  '30A': 2,
  '32A': 1,
  '33B': 2,
  '37A': 1,
  '39A': 1,
  '40B': 2,
  '44A': 1,
  '46A': 2,
  '47B': 2,
  '49A': 2,
  '50A': 2,
};
const Map<String, int> f = {
  '4A': 1,
  '14A': 1,
  '22A': 2,
  '30B': 1,
  '32B': 1,
  '33A': 0,
  '37B': 2,
  '39B': 1,
  '40A': 1,
  '44B': 2,
  '46B': 0,
  '47A': 1,
  '49B': 1,
  '50B': 0,
};
const Map<String, int> j = {
  '1A': 2,
  '7A': 1,
  '8A': 1,
  '11A': 2,
  '17A': 2,
  '18A': 1,
  '19A': 1,
  '25A': 1,
  '25C': 0,
  '27A': 2,
  '34A': 2,
  '41A': 2,
};
const Map<String, int> p = {
  '1B': 2,
  '7B': 1,
  '7C': 1,
  '8B': 2,
  '11B': 1,
  '17B': 2,
  '18B': 1,
  '19B': 1,
  '25B': 1,
  '27B': 2,
  '34B': 2,
  '41B': 2,
};
