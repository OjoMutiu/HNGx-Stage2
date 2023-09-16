class Profile {
  String name, role, phoneNumber, email, summary;

  Profile(
      {required this.name,
      required this.role,
      required this.phoneNumber,
      required this.email,
      required this.summary});

  getName() => name;
  getRole() => role;
  getPhoneNumber() => phoneNumber;
  getEmail() => email;
  getSummary() => summary;

  setName(String value) => name = value;
  setRole(String value) => role = value;
  setPhoneNumber(String value) => phoneNumber = value;
  setEmail(String value) => email = value;
  setSummary(String value) => summary = value;
}

Profile profile = Profile(
    name: 'OJO MUTIU',
    role: 'Mobile Application Developer',
    phoneNumber: '+234 8168051247',
    email: 'sourcecode.wildtech@gmail.com',
    summary: 'I am Mutiu, a mobile app developer with a passion for '
        'creating innovative and user-friendly applications. Expertise in Java, '
        'Flutter, and other mobile development technologies. '
        'I am a highly motivated and results-oriented individual with a strong '
        'work ethic. I am always eager to learn new things and take on new challenges.');
