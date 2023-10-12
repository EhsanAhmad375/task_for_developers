import '../Model/JobTypeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class JobTypePRovider with ChangeNotifier {
  List<JobTypeModel> _salaryList = [
    JobTypeModel(
        min_max: 'Min Range', salaryRange: '20,000 PKR', JobType: 'Contract'),
    JobTypeModel(
        min_max: 'Max Range', salaryRange: '40,000 PKR', JobType: 'Freelance'),
    JobTypeModel(JobType: 'On Site Fulltime'),
    JobTypeModel(JobType: 'Remote Fulltime'),
    JobTypeModel(JobType: 'On Site Parttime'),
    JobTypeModel(JobType: 'Remote Parttime'),
  ];

  List<JobTypeModel> get salaryList => _salaryList;

  List<JobTypeModel> _jobTypeList = [
    JobTypeModel(JobType: 'Contract'),
    JobTypeModel(JobType: 'Freelance'),
    JobTypeModel(JobType: 'On Site Fulltime'),
    JobTypeModel(JobType: 'Remote Fulltime'),
    JobTypeModel(JobType: 'On Site Parttime'),
    JobTypeModel(JobType: 'Remote Parttime'),
  ];

  List<JobTypeModel> get jobTypeList => _jobTypeList;

  List<String> _level=[
    'Beggner',
    'Intermediate',
    'Expert'
  ];

  List<String> get level => _level;


  bool _isValid = false;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void setErrorMessage(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  bool _isVisible = true; // Initial visibility state

  bool get isVisible => _isVisible;

  // Toggle visibility method
  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners(); // Notify listeners to rebuild the widget
  }
  bool _isVisibleSalary = false; // Initial visibility state

  bool get isVisibleSalary => _isVisibleSalary;

  // Toggle visibility method
  void toggleVisibilitySalart() {
    _isVisibleSalary = !_isVisibleSalary;
    notifyListeners(); // Notify listeners to rebuild the widget
  }

  void selectItem(int index) {
    // Deselect the previously selected item
    for (int i = 0; i < _jobTypeList.length; i++) {
      _jobTypeList[i].isSelected = false;
    }
    
    // Select the new item
    _jobTypeList[index].isSelected = true;
    notifyListeners();
  }







}
