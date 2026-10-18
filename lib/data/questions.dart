import '../models/quiz_question.dart';

const questions = [
  QuizQuestion('Aké sú hlavné stavebné bloky Flutter UI?', [
    'Widgety',
    'Komponenty',
    'Bloky',
    'Funkcie',
  ]),
  QuizQuestion('Ako sa vo Flutteri vytvára UI?', [
    'Kombinovaním widgetov v kóde',
    'Kombinovaním widgetov vo vizuálnom editore',
    'Definovaním widgetov v konfiguračných súboroch',
    'Používaním XCode pre iOS a Android Studia pre Android',
  ]),
  QuizQuestion('Na čo slúži StatefulWidget?', [
    'Mení UI, keď sa zmenia dáta',
    'Mení dáta, keď sa zmení UI',
    'Ignoruje zmeny dát',
    'Vykresľuje UI, ktoré nezávisí od dát',
  ]),
  QuizQuestion('Ktorý widget by si mal používať častejšie?', [
    'StatelessWidget',
    'StatefulWidget',
    'Oba rovnako často',
    'Žiadny z nich',
  ]),
  QuizQuestion('Čo sa stane, keď zmeníš dáta v StatelessWidgete?', [
    'UI sa neaktualizuje',
    'UI sa aktualizuje',
    'Aktualizuje sa najbližší StatefulWidget',
    'Aktualizujú sa všetky vnorené StatefulWidgety',
  ]),
  QuizQuestion('Ako by si mal aktualizovať dáta v StatefulWidgete?', [
    'Volaním setState()',
    'Volaním updateData()',
    'Volaním updateUI()',
    'Volaním updateState()',
  ]),
];
