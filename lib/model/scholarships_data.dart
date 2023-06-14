class ScholarshipsData {
  String id;
  String title;
  String? image;
  String? publishedDate;
  String? deadlineDate;
  bool? liked;
  String longDescription;



  ScholarshipsData({
    required this.id,
    required this.title,
    this.image,
    this.publishedDate,
    this.deadlineDate = 'Deadline not mentioned',
    this.liked = false,
    required this.longDescription,
  });
}



    List <ScholarshipsData> shcolaships = [
    ScholarshipsData(id: "1", title: "FAO World Food Forum in Italy Call for Nomination",
    image: 'assets/img_1.png',publishedDate: "Published 8 hours ago", deadlineDate: " Dead line July 15, 2023",

        longDescription: """ 
<h2>Opportunity Description</h2>
  <p>The Harvard Global Health Institute, in partnership with the Global Health and Population Department, accepts applications
   for Harvard LEAD Fellowship for Women. This transformational fellowship promotes leadership skills in fellows 
   from low- and middle-income countries. Applicants should be female with potential which will, in turn, mentor future female leaders in global health.</p>
  <h2>Opportunity Description</h2>
  <ul>
<li>LEAD Fellowship will cover the applicant&#8217;s visa fees, housing, and flights;</li>
<li>A living stipend will be available for the four weeks in residence;</li>
<li>Personal coach and executive leadership training;</li>
<li>Aligned interests 1:1 mentorship by Harvard Faculty;</li>
<li>Opportunity to speak at Harvard and global events;</li>
<li>Free enrolment across different departments in Harvard courses;</li>
<li>Private Workshops enhancing applicant&#8217;s leadership skills by leading experts;</li>
<li>Four-week in-residence experience at Harvard University in April 2024</li>
</ul>
  <p>The Harvard Global Health Institute, in partnership with the Global Health and Population Department, accepts applications
   for Harvard LEAD Fellowship for Women. This transformational fellowship promotes leadership skills in fellows 
   from low- and middle-income countries. Applicants should be female with potential which will, in turn, mentor future female leaders in global health.</p>
  <h2>Opportunity Description</h2>
  <p>The Harvard Global Health Institute, in partnership with the Global Health and Population Department, accepts applications
   for Harvard LEAD Fellowship for Women. This transformational fellowship promotes leadership skills in fellows 
   from low- and middle-income countries. Applicants should be female with potential which will, in turn, mentor future female leaders in global health.</p>

  
    
    """

    ),



ScholarshipsData(id: "1", title: "Reproductive Health Coordinator Job at Swedish Committee for Afghanistan (SCA) 2023",
    image: 'assets/img_2.png',publishedDate: "Published 9 hours ago", deadlineDate: "Deadline June 7, 2023", longDescription: ''),

ScholarshipsData(id: "1", title: "MHT Project Consultant Job at Afghan Family Guidance Association (AFGA) 2023",
    image: 'assets/img_3.png',publishedDate: "Published 9 hours ago", deadlineDate: "Deadline May 31, 2023", longDescription: ''),
      ScholarshipsData(id: "1", title: "Peace Programme Ambassadors Scholarship to Attend One Young World Summit 2023",
    image: 'assets/img-4.jpg',publishedDate: "Published 10 hours ago", deadlineDate: "Deadline June 19, 2023", longDescription: ''),
      ScholarshipsData(id: "1", title: "UNODA Youth Leader Fund for a World Without Nuclear Weapons",
    image: 'assets/img_5.png',publishedDate: "Published 18 hours ago", deadlineDate: "Deadline July 31, 2023", longDescription: ''),
      ScholarshipsData(id: "1", title: "OSUN Online Courses and Network Collaborative Courses for Fall 2023",
    image: 'assets/download.png',publishedDate: "Published 1 day ago", deadlineDate: "Deadline May 31, 2023", longDescription: ''),
      ScholarshipsData(id: "1", title: "HISA Youth Dialogue 2023 in Madrid, Spain (Fully Funded)",
    image: 'assets/img_7.png',publishedDate: "Published 1 day ago", deadlineDate: "Deadline June 14, 2023", longDescription: ''),
      ScholarshipsData(id: "1", title: "King Fahd University Scholarships 2023-24 in Saudi Arabia (Fully Funded)",
    image: 'assets/img_8.png',publishedDate: "Published 2 days ago", longDescription: '',),
      ScholarshipsData(id: "1", title: "Breakthrough Junior Challenge 2023 for Students Worldwide",
    image: 'assets/img_9.png',publishedDate: "Published 2 days ago", deadlineDate: "Deadline June 25, 2023", longDescription: ''),
      ScholarshipsData(id: "1", title: "Marie Skłodowska Curie Actions -MSCA Postdoctoral Fellowship ",
    image: 'assets/img-10.jpg',publishedDate: "Published 3 day ago", deadlineDate: "Deadline September 13, 2023", longDescription: ''),

    ];