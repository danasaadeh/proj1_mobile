class AttracInfo{
  final String location, image,name,description;
  List<Map<String, String>> review;

  AttracInfo({
    required this.location,
    required this.image,
    required this.name,
    required this.description,
    required this.review,

  });


}

List Attracs = [
  AttracInfo(
    image:"lib/images/photo_2024-05-14_13-19-25.jpg",
     location: 'Egypt',
      name: 'Giza Pyramids',
      description: "The Giza pyramid complex (also called the Giza necropolis)"
          "in Egypt is home to the Great Pyramid, the Pyramid of Khafre,"
          "and the Pyramid of Menkaure, along with their associated pyramid complexes and the Great Sphinx."
          " All were built during the Fourth Dynasty of the Old Kingdom",
      review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]

       ),

  AttracInfo(
    image:"lib/images/photo_2024-05-14_13-19-29.jpg",
     location: 'Paris',
      name: 'Eiffel Tower' ,
       description:
          "The Eiffel Tower  is a wrought-iron lattice tower on the Champ de Mars in Paris, France."
          " It is named after the engineer Gustave Eiffel, "
          "whose company designed and built the tower from 1887 to 1889",
      review: [
        {'name': 'suhaib@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'hanin@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'husam@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'suhaib@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'hanin@123', 'comment': "gjhjiojhugdsswdfjimml"},
      ]

      ),

  AttracInfo(
    image:"lib/images/photo_2024-05-14_13-19-54.jpg",
     location: 'Italy',
      name: 'Pizza',
        description:
          "The Tower of Pisa is located in Italy, in the city of Pisa in the state of Tuscany. "
          "Its construction began in 1173 AD, and its construction lasted 199 years. "
          " It has a tilt and a deviation from the vertical plane. Its structure consists of white marble in the Roman style,"
          " and consisting of 294 steps (currently equipped with an electric elevator).",
      review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]

       ),

  AttracInfo(
    image:"lib/images/photo_2024-05-14_13-19-39.jpg",
     location: 'Los Angeles',
      name: 'Hollywood Sign',
        description:
          "The Hollywood Sign is one of the most recognizable images of Los Angeles and California."
          " Located on a steep hillside of Mt"
          "The best places to see the Hollywood Sign are Griffith Observatory and Hollywood & Highland.",
      review: [
        {'name': 'leen@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'lara@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]
       ),

  AttracInfo(
    image:"lib/images/photo_2024-05-14_13-19-44.jpg",
     location: 'Bangkok',
      name: 'Grand palace',
       description:
          "The Grand Palace (Thai: พระบรมมหาราชวัง, RTGS: Phra Borom Maha Ratcha Wang[3]) is a complex of buildings at the heart of Bangkok, Thailand."
          " The palace has been the official residence of the Kings of Siam (and later Thailand) since 1782",
      review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]
       ),            
];