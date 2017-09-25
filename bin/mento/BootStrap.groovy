package mento

import com.mento.event.Event
import com.mento.event.Request
import com.mento.school.Course

import com.mento.school.School
import com.mento.utility.*
import com.mento.utility.user.SystemCounsellorUser
import com.mento.utility.user.SystemStudentUser
import grails.plugin.wschat.*

class BootStrap {

    def addUserService
    
    def init = { servletContext ->
        //testing variation for most relevance picking
        ChatAI.findOrSaveWhere(input:'phone number', output: '0800 123456' )
        ChatAI.findOrSaveWhere(input:'opening hours', output: 'Opening hours are 9 - 5' )
        ChatAI.findOrSaveWhere(input:'opening days', output: 'Opening days are Mon-Fri' )
        ChatAI.findOrSaveWhere(input:'opening person', output: 'Opening person is Sam' )
        ChatAI.findOrSaveWhere(input:'opening person drives', output: 'Some car' )
        ChatAI.findOrSaveWhere(input:'opening hours on a sunday', output: 'Not open on sunday' )
        ChatAI.findOrSaveWhere(input:'computer science course details', output: '/resultDetails' )
        ChatAI.findOrSaveWhere(input:'weekdays', output: 'Do you mean which days are week days? This would be Monday to Friday' )

        ChatAI.findOrSaveWhere(input:'kickbot', output: 'close_connection' )

        ChatBadWords.findOrSaveWhere(input:'poo', output: '/kickuser' )
        //minutes months hours years days
        ChatBadWords.findOrSaveWhere(input:'pants', output: '/banuser', duration: 1  ,period: 'minutes')
        ChatBadWords.findOrSaveWhere(input:'bastard', output: '/banuser', duration: 1  ,period: 'months')

        //Spring security configuration to add me as a user and admin role
        def adminRole = new ChatRole('ROLE_ADMIN').save()
        def anonymouse = new ChatRole('ROLE_ANONYMOUS').save()

        def adminOfficerRole = new ChatRole('ROLE_ADMIN_OFFICER').save()
        def counsellorRole = new ChatRole('ROLE_COUNSELLOR').save()
        def studentRole = new ChatRole('ROLE_USER').save()

        def testUser = new ChatAuth('me', 'password').save()

        def adminOfficer = new ChatAuth('academyOfficer', 'password').save()
        def counsellor = new ChatAuth('counsellor', 'password').save()
        def counsellor2 = new ChatAuth('counsellor2', 'password').save()
        def student = new ChatAuth('student', 'password').save()
        def princely = new ChatAuth('princely', 'password').save()
        def guest = new ChatAuth('guest', 'password').save()

        ChatAuthChatRole.create testUser, adminRole, true
        ChatAuthChatRole.create testUser, studentRole, true
        ChatAuthChatRole.create testUser, anonymouse, true

        ChatAuthChatRole.create adminOfficer, adminOfficerRole, true
        ChatAuthChatRole.create adminOfficer, adminRole, true
        ChatAuthChatRole.create adminOfficer, anonymouse, true

        ChatAuthChatRole.create counsellor, counsellorRole, true
        ChatAuthChatRole.create counsellor, adminRole, true
        ChatAuthChatRole.create counsellor, anonymouse, true

        ChatAuthChatRole.create student, studentRole, true
        ChatAuthChatRole.create student, anonymouse, true

        ChatAuthChatRole.create guest, anonymouse, true

        def adminUser = new ChatAuth(username: 'admin', password: 'admin').save()
        ChatAuthChatRole.create adminUser, adminRole, true

        //Adding System User's Profiles
        addUserService.addAcademyOfficerUser('academyOfficer', 'academyOfficer@gmail.com', 'Adewale',  'Muhammed', 'Dr', adminRole)
        addUserService.addSystemAdminUser('admin', 'princehardetuneji@gmail.com', 'Moronkola',  'Abdulwasiu', 'Mr', adminRole)
        addUserService.addSystemAdminUser('me', 'mabdulwasii@gmail.com', 'Moronkola',  'Abdulwasiu', 'Mr', adminRole)
        addUserService.addSystemStudentUser('student', 'student@gmail.com', 'Adeseye',  'Omolewa', 'Mr', adminRole)
        addUserService.addSystemStudentUser('princely', 'princely@gmail.com', 'Princely',  'Waitz', 'Mr', adminRole)
        addUserService.addSystemCounsellorUser('counsellor', 'mypendash@yahoo.com', 'Silvester',  'John', 'Dr', adminRole)
        addUserService.addSystemCounsellorUser('counsellor2', 'counsellor@yahoo.com', 'Solagberu',  'Ibrahim', 'prof', adminRole)

        //Adding Chat Users
        addUserService.addChatAdminUser('me','mabdulwasii@gmail.com',adminRole)
        addUserService.addChatUser('student','princely@gmail.com',studentRole)
        addUserService.addChatAdminUser('counsellor','mypendash@gmail.com',studentRole)
        addUserService.addChatAdminUser('counsellor2','counsellor@gmail.com',studentRole)
        addUserService.addChatAdminUser('academyOfficer','academyOfficer@gmail.com',studentRole)
        addUserService.addChatUser('guest','guest@gmail.com',anonymouse)

        addUserService.addChatAdminUser('admin1','test1@test.com',adminRole)
        addUserService.addChatAdminUser('admin2','test2@test.com',adminRole)

        addUserService.addChatUser('admin','admin@test.com',adminRole)
        addUserService.addChatUser('princely','princely@test.com',studentRole)
        addUserService.addChatUser('user02','user@test.com',studentRole)
        addUserService.addChatUser('user03','user@test.com',studentRole)
        addUserService.addChatUser('user04','user@test.com',studentRole)
        addUserService.addChatUser('user05','user@test.com',studentRole)
        addUserService.addChatUser('user06','user@test.com',studentRole)
        addUserService.addChatUser('user07','user@test.com',studentRole)
        addUserService.addChatUser('user08','user@test.com',studentRole)
        addUserService.addChatUser('user09','user@test.com',studentRole)
        addUserService.addChatUser('user10','user@test.com',studentRole)


        //Subject
        def eng = new Subject(name: 'English').save(flush:true)
        def math = new Subject(name: 'Mathematics').save(flush:true)
        def yor = new Subject(name: 'Yoruba').save(flush:true)
        def eco = new Subject(name: 'Economics').save(flush:true)
        Subject gov = new Subject(name: 'Government').save(flush:true)
        Subject phy = new Subject(name: 'Physics').save(flush:true)
        Subject chm = new Subject(name: 'Chemistry').save()
        Subject bio = new Subject(name: 'Biology').save()
        Subject agric = new Subject(name: 'Agricultural Science').save()
        Subject geo = new Subject(name: 'Geography').save()
        Subject trd = new Subject(name: 'Trade/ Entrepreneurial Studies').save()
        Subject civ = new Subject(name: 'Civic Education').save()
        Subject ins = new Subject(name: 'Insurance').save()
        Subject irs = new Subject(name: 'Islamic Religious Studies').save()
        Subject crs = new Subject(name: 'Christian Religious Studies').save()
        Subject furMth = new Subject(name: 'Further mathematics').save()
        Subject fre = new Subject(name: ' French language').save()
        Subject compSci = new Subject(name: 'Computer Studies').save()
        Subject lit = new Subject(name: 'Literature in English').save()
        Subject market = new Subject(name: 'Marketting').save()
        Subject acc = new Subject(name: 'Accounting').save()
        Subject commerce = new Subject(name: 'Commerce').save()
        Subject literature = new Subject(name: 'Literature In English').save()
        Subject otherScience = new Subject(name: 'One Science Subject').save()
        Subject twoOtherScience = new Subject(name: 'Two Science Subject').save()
        Subject otherSocial = new Subject(name: 'One Social Science Subject').save()
        Subject twoOtherSocial = new Subject(name: 'Two Social Science Subject').save()

        //Interest
        Interest dancing = new Interest(name: 'Dancing').save()
        Interest exercise = new Interest(name: 'Exercise').save()
        Interest travel = new Interest(name: 'Traveling').save()
        Interest reading = new Interest(name: 'Reading').save()
        Interest painting = new Interest(name: 'Painting').save()
        Interest comp = new Interest(name: 'Computer').save()
        Interest animalCare = new Interest(name: 'Animal Care').save()
        Interest writing = new Interest(name: 'Writing').save()
        Interest cooking = new Interest(name: 'Cooking').save()
        Interest compProg = new Interest(name: 'Computer Programming').save()
        Interest drama = new Interest(name: 'Drama').save()
        Interest draw = new Interest(name: 'Drawing').save()
        Interest metal = new Interest(name: 'Metalworking').save()
        Interest paint = new Interest(name: 'Painting').save()
        Interest music = new Interest(name: 'Playing musical instruments').save()
        Interest web = new Interest(name: 'Web surfing').save()
        Interest code = new Interest(name: 'Coding').save()
        Interest calculating = new Interest(name: 'Calculating').save()
        Interest adaptability = new Interest(name: 'Adaptability').save()
        Interest patience = new Interest(name: 'Patience').save()
        Interest hardwork = new Interest(name: 'Hardwork').save()
        Interest managePeople = new Interest(name: 'Managing People').save()
        Interest observation = new Interest(name: 'Observation').save()
        Interest thinking = new Interest(name: 'Critical Thinking').save()
        Interest brainstorming = new Interest(name: 'Brainstorming').save()

        //INdustries
        Industry busFinInd = new Industry(name: 'Business & Finance').save()
        Industry compTechInd = new Industry(name: 'Computers & Technology').save()
        Industry agricInd = new Industry(name: 'Agriculture').save()
        Industry edu = new Industry(name: 'Education and Training').save()
        Industry hospTour = new Industry(name: 'Hospitality and Tourism').save()
        Industry manu = new Industry(name: 'Manufacturing').save()
        Industry sci = new Industry(name: 'Science').save()
        Industry engr = new Industry(name: 'Engineering').save()
        Industry tech = new Industry(name: 'Technology').save()
        Industry engTech = new Industry(name: 'Engineering & Engineering Technicians').save()
        Industry fishing = new Industry(name: 'Fishing, Farming & Forestry').save()
        Industry health = new Industry(name: 'Health And Medical').save()
        Industry legal = new Industry(name: 'Legal, Criminal Justice & Law Enforcement').save()
        Industry manage = new Industry(name: 'Management').save()
        Industry media = new Industry(name: 'Media Communications & Broadcasting').save()
        Industry military = new Industry(name: 'Military & Armed Forces').save()
        Industry salesMarket = new Industry(name: 'Sales & Marketing').save()
        Industry transport = new Industry(name: 'Transportation & Moving').save()
        Industry airline = new Industry(name: 'Airline').save()
        Industry bankInd = new Industry(name: 'Banking').save()
        Industry other = new Industry(name: 'Other').save()

        //Career  Jobs

        CareerJob perfArtsCJ = new CareerJob(name: 'Performing Artist').save()
        CareerJob prodDesignCJ = new CareerJob(name: 'Product Designer').save()
        CareerJob urpCJ = new CareerJob(name: 'Urban Planner & Designer').save()
        CareerJob accCJ = new CareerJob(name: 'Accountant').save()
        CareerJob bankCJ = new CareerJob(name: 'Banker').save()
        CareerJob biomedCJ = new CareerJob(name: 'Biomedical Engineer').save()
        CareerJob chefCJ = new CareerJob(name: 'Chef').save()
        CareerJob ceoCJ = new CareerJob(name: 'Chief Executive Officer').save()
        CareerJob compProgCJ = new CareerJob(name: 'Computer Programmer').save()
        CareerJob compSystemCJ = new CareerJob(name: 'Computer Systems Analyst').save()
        CareerJob consultCJ = new CareerJob(name: 'Consultant').save()
        CareerJob DbaCj = new CareerJob(name: 'Database Administrator').save()
        CareerJob dentCJ = new CareerJob(name: 'Dentist').save()
        CareerJob docCJ = new CareerJob(name: 'Doctor').save()
        CareerJob edtCJ = new CareerJob(name: 'Editor').save()
        CareerJob electCJ = new CareerJob(name: 'Electrician').save()
        CareerJob fashDesCJ = new CareerJob(name: 'Fashion Designer').save()
        CareerJob finMgrCj = new CareerJob(name: 'Financial Manager').save()
        CareerJob lawCJ = new CareerJob(name: 'Lawyer').save()
        CareerJob nurseCJ = new CareerJob(name: 'Nurse').save()
        CareerJob pharmCJ = new CareerJob(name: 'Pharmacist').save()
        CareerJob softDevCJ = new CareerJob(name: 'Software Developer').save()
        CareerJob webDevCJ = new CareerJob(name: 'Web Developer').save()
        CareerJob writerCJ = new CareerJob(name: 'Writer').save()
        CareerJob careerCJ = new CareerJob(name: 'Career Counselor').save()
        CareerJob lecCJ = new CareerJob(name: 'lecturer').save()
        CareerJob farmCj = new CareerJob(name: 'Farmer').save()
        CareerJob agConsCJ = new CareerJob(name: 'Agricultural consultant').save()
        CareerJob actorCJ = new CareerJob(name: 'Actor').save()
        CareerJob cfoCJ = new CareerJob(name: 'Chief Financial Officer').save()

        //Creating Schools
        School ilorin = new School(name: 'University of Ilorin', type:'University', yearFounded: '1970', noOfStudent: 35000, noOfApplication: 120000, owner: 'federal School',
                address: 'PMB 14141 Ilorin', website: 'www.unilorin.edu.ng', email: 'info@unilorin.edu.ng', phoneNumber: '09078367729').save()
        School ibadan = new School(name: 'University of Ibadan', type:'University', yearFounded: '1958', noOfStudent: 40000, noOfApplication: 60000, owner: 'federal School',
                address: 'PMB 45141 Ibadan', website: 'www.ui.edu.ng ', email: 'info@ui.edu.ng ', phoneNumber: '08088367790').save()
        School oau = new School(name: 'Obafemi Awolowo University', type:'University', yearFounded: '1960', noOfStudent: 35000, noOfApplication: 50000, owner: 'federal School',
                address: 'PMB 340550 Ife', website: 'www.oauife.edu.ng ', email: 'info@oauife.edu.ng ', phoneNumber: '09078367729').save()
        School port = new School(name: 'University of Port-Harcourt', type:'University', yearFounded: '1983', noOfStudent: 20000, noOfApplication: 40500, owner: 'federal School',
                address: 'PMB 23452 port-Harcourt', website: 'www.uniport.edu.ng', email: 'info@uniport.edu.ng ', phoneNumber: '09078367729').save()
        School akure = new School(name: 'federal University Of Technology Akure', type:'University', yearFounded: '1992', noOfStudent: 3500, noOfApplication:  58500, owner: 'federal Owned',
                address: 'PMB 14141 Akure', website: 'www.futa.edu.ng', email: 'info@futa.edu.ng', phoneNumber: '09078367729').save()
        School minna = new School(name: 'federal University Of Technology Minna', type:'University', yearFounded: '1973', noOfStudent: 23500, noOfApplication: 45000,owner: 'federal School',
                address: 'PMB 14141 minna', website: 'www.futminna.edu.ng', email: 'info@futminna.edu.ng', phoneNumber: '09078367729').save()
        School nsukka = new School(name: 'University of Nigeria Nsukka', type:'University', yearFounded: '1980', noOfStudent: 40000, noOfApplication: 20000, owner: 'federal School',
                address: 'PMB 14141 Nsukka', website: 'www.unn.edu.ng', email: 'info@unn.edu.ng', phoneNumber: '09078367729').save()
        School lautech = new School(name: 'Ladoke Akintola University of Technology', type: 'University', yearFounded: '1980', noOfStudent: 40000, noOfApplication: 80500, owner: 'State School',
                address: 'PMB 14141 Ogbomosho', website: 'www.lautech.edu.ng', email: 'info@lautech.edu.ng', phoneNumber: '09078367729').save()
        School unilag = new School(name: 'University Of Lagos', type: 'University', yearFounded: '1980', noOfStudent: 40000, noOfApplication: 80500, owner: 'federal School',
                address: 'PMB 14141 Lagos', website: 'www.unilag.edu.ng', email: 'info@unilag.edu.ng', phoneNumber: '09078367729').save()


        //Course Accounting
        Course accounting = new Course(name: 'Accounting', maxNumberOfStudent: 200, noOfApplication: 400, jambScore: 200,
                description: 'A degree program in Accountancy/Accounting exposes the students to the systematic and comprehensive recording of financial transactions pertaining to a business, and it also refers to the process of summarizing, analyzing and reporting these transactions to oversight agencies and tax collection entities.',
                jambSubjects: [ chm, bio, phy], olevelSubjects: [eng, bio, gov, math, commerce],
                interests: [calculating, reading], careerJobs: [cfoCJ, accCJ, bankCJ ], industries: [busFinInd, bankInd, manage], schools: [lautech, ibadan, ilorin, oau]).save()

       // Agricultural Science & Engineering
        Course ahmaduAgricDept = new Course(name: 'Agricultural Science & Engineering', maxNumberOfStudent: 240, noOfApplication: 560, jambScore: 200,
                description: 'Agricultural science degree programs give students a broad background in agriculture that includes agricultural technology, management principles, and research methods. Other science-related topics include the biological principles of farming and ecosystem protection.' +
                        ' Business-related topics like agribusiness management and marketing may also be covered.',
                jambSubjects: [ chm, bio, phy], olevelSubjects: [eng, bio, chm, math, geo],
                interests: [hardwork, patience, adaptability], careerJobs: [farmCj, agConsCJ], schools: [ilorin, ibadan, akure, minna, lautech],
                industries: [agricInd, edu, manu]).save()
        //Banking And Finance

        Course ahmaduBankFinDept = new Course(name: 'Banking And Finance', maxNumberOfStudent: 240, noOfApplication: 560, jambScore: 180,
                description: 'A degree program in Banking & Finance exposes the students to a variety of banking and money management services such as saving, investing and retirement plans. Careers in banking and financial ' +
                        'services range from customer service banking and sales positions, financial advisers and analyst positions',
                jambSubjects: [math, eco, commerce], olevelSubjects: [eng, math, eco, commerce, acc, geo, gov],
                interests: [thinking, observation, managePeople, calculating], careerJobs: [bankCJ, cfoCJ, ceoCJ],
                industries: [bankInd, manage, busFinInd, manu], schools: [ilorin, ibadan, ]).save()

        //Political science
        Course PoliticalScience = new Course(name: 'Political SCience', maxNumberOfStudent: 240, noOfApplication: 560, jambScore: 180,
                description: 'A degree program in Political Sv=cience exposes the students to a variety of banking and money management services such as saving, investing and retirement plans. Careers in banking and financial ' +
                        'services range from customer service banking and sales positions, financial advisers and analyst positions',
                jambSubjects: [math, eco, commerce], olevelSubjects: [eng, math, eco, commerce, acc, geo, gov],
                interests: [thinking, observation, managePeople, calculating], careerJobs: [bankCJ, cfoCJ, ceoCJ],
                industries: [bankInd, manage, busFinInd, manu], schools: [ilorin, ibadan, akure, lautech ]).save()



        //Medicine and surgery
        Course medicine = new Course(name: 'Medicine And Surgery', maxNumberOfStudent: 240, noOfApplication: 560, jambScore: 180,
                description: 'A degree program in Political Sv=cience exposes the students to a variety of banking and money management services such as saving, investing and retirement plans. Careers in banking and financial ' +
                        'services range from customer service banking and sales positions, financial advisers and analyst positions',
                jambSubjects: [math, eco, commerce], olevelSubjects: [eng, math, eco, commerce, acc, geo, gov],
                interests: [thinking, observation, managePeople, calculating], careerJobs: [bankCJ, cfoCJ, ceoCJ],
                industries: [bankInd, manage, busFinInd, manu], schools: [ilorin, port, akure, ibadan, nsukka ]).save()


        //Computer Science
        Course Computer  = new Course(name: 'Computer Science', maxNumberOfStudent: 240, noOfApplication: 560, jambScore: 180,
                description: 'A degree program in Computer Science is the study of how to manipulate, manage, transform and encode information. There are many areas in computer science, in which some of the areas consider problems in an abstract way and some areas need special machines called computers. A person who work with computers will often need mathematics, science, and logic in order to make and use computers.',
                jambSubjects: [math, eco, commerce], olevelSubjects: [eng, math, eco, commerce, acc, geo, gov],
                interests: [thinking, observation, managePeople, calculating], careerJobs: [bankCJ, cfoCJ, ceoCJ],
                industries: [bankInd, manage, busFinInd, manu], schools: [ilorin, port, akure, ibadan, nsukka ]).save()




        //Mass Communication
        Course massComm  = new Course(name: 'Mass Communication', maxNumberOfStudent: 240, noOfApplication: 560, jambScore: 180,
                description: 'A degree program in Computer Science is the study of how to manipulate, manage, transform and encode information. There are many areas in computer science, in which some of the areas consider problems in an abstract way and some areas need special machines called computers. A person who work with computers will often need mathematics, science, and logic in order to make and use computers.',
                jambSubjects: [math, eco, commerce], olevelSubjects: [eng, math, eco, commerce, acc, geo, gov],
                interests: [thinking, observation, managePeople, calculating], careerJobs: [bankCJ, cfoCJ, ceoCJ],
                industries: [bankInd, manage, busFinInd, manu], schools: [ilorin, port, akure, ibadan, nsukka ]).save()



        //Mass Communication
        Course pharmacy  = new Course(name: 'Pharmacy', maxNumberOfStudent: 240, noOfApplication: 560, jambScore: 180,
                description: 'A degree program in Computer Science is the study of how to manipulate, manage, transform and encode information. There are many areas in computer science, in which some of the areas consider problems in an abstract way and some areas need special machines called computers. A person who work with computers will often need mathematics, science, and logic in order to make and use computers.',
                jambSubjects: [math, eco, commerce], olevelSubjects: [eng, math, eco, commerce, acc, geo, gov],
                interests: [thinking, observation, managePeople, calculating], careerJobs: [bankCJ, cfoCJ, ceoCJ],
                industries: [bankInd, manage, busFinInd, manu], schools: [ilorin, port, akure, ibadan, nsukka ]).save()


        Event event = new Event(title: "Seminar Request At Ibadan", location: 'Ibadan, Oyo State', price: 0, eventDate: new Date(2017, 9, 21), isInterested: true).save()
        Event e2 = new Event(title: "Seminar Request At Ibadan", location: 'Ibadan, Oyo State', price: 0, eventDate: new Date(2018, 12, 13), isInterested: true).save()
        Event e3 = new Event(title: "How to become A Medical practioner", location: 'Osogbo, Osun State', price: 0, eventDate: new Date(2017, 11, 23), isInterested: true).save()
        Event e4 = new Event(title: "Getting ready for Institution Learning", location: 'ilorin, Kwara State', price: 0, eventDate: new Date(2017, 12, 8), isInterested: true).save()
        Event e5 = new Event(title: "Become an undergraduate this season", location: 'okene, Kogi State', price: 0, eventDate: new Date(2018, 01, 8), isInterested: true).save()

     /*   def r1 = Request(title: 'Becomming a Teacher', location: 'Ibadan , Oyo State', description: 'How to become an educator', eventDate: new Date(2018, 1, 4)).save()
        def r2 = Request(title: 'Becoming A Doctor', location: 'Osogbo Osun State', description: 'How to become a successful career Lawyer', eventDate: new Date(2017, 3, 23)).save()
        def r3 = Request(title: 'How to Gain Admission to University', location: 'ikeja Lagos State', description: 'How to Gain Admission to University', eventDate: new Date(2017, 3, 23)).save()
        def r4 = Request(title: 'Seminar Request At Ibadan', location: 'Ilorin Kwara State', description: 'How to become a successful career Lawyer', eventDate: new Date(2017, 3, 23)).save()
        def r5 = Request(title: 'University Or Polytechnic', location: 'Ede Osun State', description: 'How to become a successful career Lawyer', eventDate: new Date(2017, 3, 23)).save()
        def r6 = Request(title: 'Life of an Undergraduate', location: 'Iseyin Oyo State', description: 'How to become a successful career Lawyer', eventDate: new Date(2017, 3, 23)).save()
*/

        def stu1 = new SystemStudentUser(title: 'Mr', username: 'princely', firstName: 'Adewale', lastName: 'Solagberu', birthDate: new Date(1994, 2, 23), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()
        def stu2 = new SystemStudentUser(title: 'Mr', username: 'princely', firstName: 'Adewale', lastName: 'Mubarak', birthDate: new Date(1998, 3, 14), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()
        def stu3 = new SystemStudentUser(title: 'Miss', username: 'sola2e', firstName: 'Adesola', lastName: 'Alakemo', birthDate: new Date(1989, 5, 02), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()
        def stu4 = new SystemStudentUser(title: 'Miss', username: 'dembel', firstName: 'Bolanle', lastName: 'Mandate', birthDate: new Date(1990, 12, 05), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()
        def stu5 = new SystemStudentUser(title: 'Mr', username: 'sinder', firstName: 'Muslim', lastName: 'Obe', birthDate: new Date(2000, 10, 29), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()
        def stu6 = new SystemStudentUser(title: 'Mr', username: 'manuchi', firstName: 'Adeyemi', lastName: 'Ismail', birthDate: new Date(1985, 5, 12), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()
        def stu7 = new SystemStudentUser(title: 'Miss', username: 'colla', firstName: 'Aduke', lastName: 'David', birthDate: new Date(1997, 8, 13), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()
        def stu8 = new SystemStudentUser(title: 'Mr', username: 'bretty', firstName: 'Adewale', lastName: 'Ibrahim', birthDate: new Date(2001, 5, 230), gender: 'Male', email: 'stud@gmail.com', martialStatus: 'Single', phone: '07076767367').save()

        def cou1 = new SystemCounsellorUser(username: 'counsed', title: 'Mr', firstName: 'Salawu', lastName: 'Alake', email: 'counsel@gail.com', gender: 'Male', martialStatus: 'Married', birthDate: new Date(1967, 2, 06) ).save()
        def cou2 = new SystemCounsellorUser(username: 'onem', title: 'Prof', firstName: 'Salami', lastName: 'Adeola', email: 'counsel@gail.com', gender: 'Male', martialStatus: 'Married', birthDate: new Date(1985, 6, 13) ).save()
        def cou3 = new SystemCounsellorUser(username: 'damber', title: 'Mrs', firstName: 'Adeshina', lastName: 'Ahmad', email: 'counsel@gail.com', gender: 'Female', martialStatus: 'Married', birthDate: new Date(1978, 12, 11) ).save()
        def cou4 = new SystemCounsellorUser(username: 'ownesn', title: 'Mr', firstName: 'Conrad', lastName: 'Chukuma', email: 'counsel@gail.com', gender: 'Male', martialStatus: 'Married', birthDate: new Date(1982, 5, 20) ).save()
        def cou5 = new SystemCounsellorUser(username: 'siisMissy', title: 'Dr Mrs', firstName: 'Adenle', lastName: 'Asalim', email: 'counsel@gail.com', gender: 'Female', martialStatus: 'Married', birthDate: new Date(1972, 10, 1) ).save()
    }
    def destroy = {
    }

    void addUser(String username, String email, ChatRole userRole) {
        ChatUser user
        ChatPermissions perm
        String defaultPermission = 'admin'
        if (defaultPermission) {
            perm = ChatPermissions.findByName(defaultPermission)
            perm = perm ? perm : new ChatPermissions(name: defaultPermission).save(flush: true)
            user = ChatUser.findByUsername(username)
            if (!user) {
                def addlog = addLog()
                user = new ChatUser(username: username, permissions: perm, log: addlog, offlog: addlog).save(flush:true)

                //def springUser = new ChatAuth(username: username, password: 'admin').save(flush:true)
                //ChatAuthChatRole.create springUser, userRole, true
            }
            ChatUserProfile.findOrSaveWhere(chatuser:user, email:"${email}").save(flush:true)
        }

    }

    private ChatLog addLog() {
        ChatLog logInstance = new ChatLog(messages: [])
        if (!logInstance.save()) {
            log.debug "${logInstance.errors}"
        }
        return logInstance
    }
}
