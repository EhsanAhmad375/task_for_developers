import '../Model/SkillsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:task_for_developers/Model/filtered.dart';



class FilterProvider with ChangeNotifier{

  List<FilterModel> _filterList=[
    FilterModel(color: Colors.amber,title: 'Software Engineer',loc: 'Lahore Pakistan',duration: 'Full Time',day: 'Today',range: '\$5K - \$10K'),
    FilterModel(color: Colors.pink,title: 'Front-end Developer',loc: 'Lahore Pakistan',duration: 'Full Time',day: '2H Ago',range: '\$5K - \$10K'),
    FilterModel(color: Colors.blue,title: 'Front-end Flutter Developer',loc: 'Lahore Pakistan',duration: 'Full Time',day: '2H Ago',range: '\$5K - \$10K'),
    FilterModel(color: Colors.red,title: 'Software Engineer',loc: 'Lahore Pakistan',duration: 'Full Time',day: '2H Ago',range: '\$5K - \$10K'),
    FilterModel(color: Colors.cyan,title: 'Web-Developer',loc: 'Lahore Pakistan',duration: 'Full Time',day: '2H Ago',range: '\$5K - \$10K'),
  ];

List<FilterModel> get filterList=>_filterList;



  List<String> cardList = ["Description", "Company"];
  
  int selectedIndex = 0; // Initialize to -1 (no selection)

  void selectItem(int index) {
    selectedIndex = index;
    notifyListeners();
  }

   bool signIncheckbox = false;
  int selectedOption = 0;

  void updateSelectedOption(int option) {
    selectedOption = option;
    notifyListeners(); // Notify listeners when the state changes
  }

  String code='92';

 void codePick(String newCode){
    code=newCode;
    notifyListeners();
  }
  String flag='🇵🇰';

 void flagPick(String newflag){
    flag=newflag;
    notifyListeners();
  }

  List<SkillsModel> skillsList=[
    SkillsModel(title: 'Web Design', percentage: 30,perind: 0.3),
    
    SkillsModel(title: 'HTML', percentage: 50,perind: 0.5),
    SkillsModel(title: 'Boolstrap', percentage: 30,perind: 0.3),
    SkillsModel(title: 'CSS', percentage: 85,perind: 0.85),
    SkillsModel(title: 'Ajax', percentage: 70,perind: 0.70),
  ];



}