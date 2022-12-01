import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/data/model/result_model.dart';
import 'package:inno_quiz_app/presentation/locator.dart';
import 'package:inno_quiz_app/presentation/pages/result_screen.dart';

class ComparePage extends ConsumerStatefulWidget {
  const ComparePage({super.key});

  @override
  ConsumerState<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends ConsumerState<ComparePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<ResultModel?>(
            future: ref
                .read(quizRepository)
                .getResult(ref.read(resultProvider).inviteId ?? ''),
            builder: (context, s) {
              if (s.hasError || s.data == null) {
                return Center(
                  child: Text('No data'),
                );
              }
              final friendResult = determineResult(s.data!.answers);
              final myResult =
                  determineResult(ref.read(resultProvider).answers);

              // final friendResult = 'INTJ';
              // final myResult = 'ESTP';
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline6!,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Your friend is $friendResult'),
                          Text('You are $myResult'),
                        ],
                      ),
                    ),
                    LimitedBox(
                      maxHeight: MediaQuery.of(context).size.height / 2,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: _ResultSection.values
                            .map((e) => _MeaningBox(
                                result1: myResult.substring(
                                    _ResultSection.values.indexOf(e),
                                    _ResultSection.values.indexOf(e) + 1),
                                result2: friendResult.substring(
                                    _ResultSection.values.indexOf(e),
                                    _ResultSection.values.indexOf(e) + 1),
                                section: e))
                            .toList(),
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () => context.router.navigateBack(),
                        icon: Icon(Icons.arrow_back_rounded),
                        label: Text('Go back'))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum _ResultSection {
  introvertExtravert,
  senseIntuition,
  thinkingFeeling,
  judgingPerceiving
}

Map<_ResultSection, String> _sectionNames = {
  _ResultSection.introvertExtravert: 'Introvert/Extravert',
  _ResultSection.senseIntuition: 'Sensing/Intuition',
  _ResultSection.thinkingFeeling: 'Thinking/Feeling',
  _ResultSection.judgingPerceiving: 'Judging/Perceiving',
};

class _MeaningBox extends StatelessWidget {
  final String result1;
  final String result2;
  final _ResultSection section;
  const _MeaningBox({
    Key? key,
    required this.result1,
    required this.result2,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _sectionNames[section]!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              result1 == result2 ? 'You are the same' : 'You are different',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            ..._resultMeaning[section]!
                .map((e) => Flexible(child: Text(e)))
                .toList(),
            const SizedBox(height: 20),
            Text(
              'swipe to see more',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

Map<_ResultSection, List<String>> _resultMeaning = {
  _ResultSection.introvertExtravert: [
    'Extravert - I like getting my energy from active involvement in events and having a lot of different activities. I\'m excited when I\'m around people and I like to energize other people. I like moving into action and making things happen. I generally feel at home in the world. I often understand a problem better when I can talk out loud about it and hear what others have to say.',
    'Introvert - I like getting my energy from dealing with the ideas, pictures, memories, and reactions that are inside my head, in my inner world. I often prefer doing things alone or with one or two people I feel comfortable with. I take time to reflect so that I have a clear idea of what I\'ll be doing when I decide to act. Ideas are almost solid things for me. Sometimes I like the idea of something better than the real thing.',
  ],
  _ResultSection.senseIntuition: [
    'Sensing - Paying attention to physical reality, what I see, hear, touch, taste, and smell. I\'m concerned with what is actual, present, current, and real. I notice facts and I remember details that are important to me. I like to see the practical use of things and learn best when I see how to use what I\'m learning. Experience speaks to me louder than words.',
    'Intuition - Paying the most attention to impressions or the meaning and patterns of the information I get. I would rather learn by thinking a problem through than by hands-on experience. I\'m interested in new things and what might be possible, so that I think more about the future than the past. I like to work with symbols or abstract theories, even if I don\'t know how I will use them. I remember events more as an impression of what it was like than as actual facts or details of what happened.',
  ],
  _ResultSection.thinkingFeeling: [
    'Thinking - When I make a decision, I like to find the basic truth or principle to be applied, regardless of the specific situation involved. I like to analyze pros and cons, and then be consistent and logical in deciding. I try to be impersonal, so I won\'t let my personal wishes--or other people\'s wishes--influence me.',
    'Feeling - I believe I can make the best decisions by weighing what people care about and the points-of-view of persons involved in a situation. I am concerned with values and what is the best for the people involved. I like to do whatever will establish or maintain harmony. In my relationships, I appear caring, warm, and tactful.',
  ],
  _ResultSection.judgingPerceiving: [
    'Judging - I use my decision-making (Judging) preference (whether it is Thinking or Feeling) in my outer life. To others, I seem to prefer a planned or orderly way of life, like to have things settled and organized, feel more comfortable when decisions are made, and like to bring life under control as much as possible.',
    'Perceiving - I use my perceiving function (whether it is Sensing or Intuition) in my outer life. To others, I seem to prefer a flexible and spontaneous way of life, and I like to understand and adapt to the world rather than organize it. Others see me staying open to new experiences and information.',
  ],
};
