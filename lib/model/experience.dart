import 'operation.dart';

class ExperienceModel {
  String role, company, startDate, endDate, location, companyDescription;
  List<String> operation;

  ExperienceModel(
      {required this.role,
      required this.company,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.companyDescription,
      required this.operation});

  getRole() => role;
  getCompany() => company;
  getStartDate() => startDate;
  getEndDate() => endDate;
  getLocation() => location;
  getCompanyDescription() => companyDescription;

  setRole(value) => role = value;
  setCompany(value) => company = value;
  setStartDate(value) => startDate = value;
  setEndDate(value) => endDate = value;
  setLocation(value) => location = value;
  setCompanyDescription(value) => companyDescription = value;
  addOperation(List<String> operations) {
    operation = operations;
  }

  getOperations() => operation;

  removeOperation() {
    operation = [];
  }

  addOperationItem(value) => operation.add(value);
  deleteOperationItem(value) => operation.removeAt(value);

  getExperienceModelList() => experienceModel;
  addToExperienceModel(ExperienceModel experience) {
    experienceModel.add(experience);
  }
}

List<String> operations = [
  'Developed mobile apps for Android and iOS with flutter dart',
  'Collaborated with a team of engineers to design and implement new features',
  'Implementation of features across version control system',
  'Successfully assigned project within time'
];

List<ExperienceModel> experienceModel = [
  ExperienceModel(
      role: 'Mobile App Dev',
      company: 'Credevnet Tech',
      startDate: '2023',
      endDate: '2023',
      location: 'Abuja, Nigeria',
      companyDescription: 'Credevnet Technologies is a software development '
          'firm committed to making and delivering robust ICT solutions',
      operation: operations)
];
