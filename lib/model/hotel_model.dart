import 'package:flutter/material.dart';
import 'package:tourism/model/room_model.dart';

class HotelInfo{
  final String location, image,name,description;
   final List<Map<String, dynamic>> amenities;
  final List<RoomInfo> Room;
  final int rate;
   List<Map<String, String>> review;


  HotelInfo({
   required this.location,
      required this.Room,
      required this.image,
      required this.name,
      required this.description,
      required this.amenities,
      required this.rate,
       required this.review,
  });


}

List hotels = [
  HotelInfo(
    rate: 4,
    image:"lib/images/photo_2024-05-14_13-18-53.jpg",
     location: 'USA',
      name: 'Hilton',
      description:
          "Hiltons luxury hotels around the world offer an unparalleled experience, blending world-class amenities with local traditions. We have some of the best hotels to make your luxurious escape a truly unforgettable experience",
      amenities: [
        {
          'text': 'Wi-Fi',
          'icon': Icons.wifi, // رمز Wi-Fi
        },
        {
          'text': 'pool',
          'icon': Icons.pool, // رمز البركة
        },
        {
          'text': 'restaurant',
          'icon': Icons.restaurant, // رمز المطعم
        },
      ],
      Room: [
        RoomInfo(
            price: "\$1200",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Sweet ",
            description: "",
            pictures:
  ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1000",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: [
              'HouseKeeping',
              'Telephon',
            ],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1300",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: [
              "lib/images/photo_2024-07-14_05-58-46.jpg",
              "lib/images/photo_2024-07-14_05-58-46.jpg",
            ],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps")


 ] ,
  review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]
 ),

  HotelInfo(
      rate: 5,
    image:"lib/images/photo_2024-05-14_13-18-59.jpg",
     location: 'Egypt',
      name: 'Marriott' ,
       description:
          "Marriott International, Inc. is an American multinational company that operates, franchises, and licenses lodging brands that include hotel, residential, and timeshare properties",
      amenities: [
        {
          'text': 'Wi-Fi',
          'icon': Icons.wifi, // رمز Wi-Fi
        },
        {
          'text': 'pool',
          'icon': Icons.pool, // رمز البركة
        },
        {
          'text': 'restaurant',
          'icon': Icons.restaurant, // رمز المطعم
        },
        {
          'text': 'AC',
          'icon': Icons.ac_unit, // رمز المطعم
        },
        // يمكن إضافة المزيد من العناصر هنا
      ],
      Room: [
        RoomInfo(
            price: "\$1000",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: [
              'HouseKeeping',
              'Telephon',
            ],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1300",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: [
              "lib/images/photo_2024-07-14_05-58-46.jpg",
              "lib/images/photo_2024-07-14_05-58-46.jpg",
            ],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps")
      ],
       review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]
      ),

  HotelInfo(
      rate: 3,
    image:"lib/images/photo_2024-05-14_13-19-04.jpg",
     location: 'Canada',
      name: 'FourSeasons',
       description:
          "The hotel was popular with Americans arriving in France on Transatlantic ocean liners, as it operated offices in the port of Cherbourg to receive customers on their arriva",
      amenities: [
        {
          'text': 'Wi-Fi',
          'icon': Icons.wifi, // رمز Wi-Fi
        },
        {
          'text': 'pool',
          'icon': Icons.pool, // رمز البركة
        },
        {
          'text': 'AC',
          'icon': Icons.ac_unit, // رمز المطعم
        },
        // يمكن إضافة المزيد من العناصر هنا
      ],
      Room: [
        RoomInfo(
            price: "\$1200",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Sweet ",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1000",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg","lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: [
              'HouseKeeping',
              'Telephon',
            ],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1300",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: [
              "lib/images/photo_2024-07-14_05-58-46.jpg",
             "lib/images/photo_2024-07-14_05-58-46.jpg",
            ],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps")
      ],
       review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]
      ),

  HotelInfo(
    rate: 4,
    image:"lib/images/photo_2024-05-14_13-19-19.jpg",
     location: 'China',
      name: 'jin jiang',
       description:
          "is the largest hotel group in China. It has more than 380 hotels and inns affiliated to it and under its management in major Chinese cities, including Peace Hotel and Jinjiang Inns",
      amenities: [
        {
          'text': 'restaurant',
          'icon': Icons.restaurant, // رمز المطعم
        },
        {
          'text': 'AC',
          'icon': Icons.ac_unit, // رمز المطعم
        },
        // يمكن إضافة المزيد من العناصر هنا
      ],
      Room: [
        RoomInfo(
            price: "\$1200",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Sweet ",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1000",
            image:"lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: [
              'HouseKeeping',
              'Telephon',
            ],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1300",
            image:"lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: [
              "lib/images/photo_2024-07-14_05-58-46.jpg",
             "lib/images/photo_2024-07-14_05-58-46.jpg",
            ],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps")
      ],
       review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]

       ),

  HotelInfo(
   rate: 5,
    image:"lib/images/photo_2024-05-14_13-19-34.jpg",
     location: 'Italy',
      name: 'Passalacqua',
       description:
          " 5 star hotel on Lake Como with warm, personalised service, Passalacqua is your gateway to a region for all seasons",
      amenities: [
        {
          'text': 'Wi-Fi',
          'icon': Icons.wifi, // رمز Wi-Fi
        },
        {
          'text': 'pool',
          'icon': Icons.pool, // رمز البركة
        },
        {
          'text': 'restaurant',
          'icon': Icons.restaurant, // رمز المطعم
        },
        {
          'text': 'AC',
          'icon': Icons.ac_unit, // رمز المطعم
        },
        // يمكن إضافة المزيد من العناصر هنا
      ],
      Room: [
        RoomInfo(
            price: "\$1200",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Sweet ",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1000",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: ["lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg", "lib/images/photo_2024-07-14_05-58-46.jpg"],
            fetuers: [
              'HouseKeeping',
              'Telephon',
            ],
            beds: "5beds",
            sleeps: "5sleeps"),
        RoomInfo(
            price: "\$1300",
            image: "lib/images/photo_2024-07-14_05-58-46.jpg",
            name: "Room",
            description: "",
            pictures: [
             "lib/images/photo_2024-07-14_05-58-46.jpg",
             "lib/images/photo_2024-07-14_05-58-46.jpg",
            ],
            fetuers: ['HouseKeeping', 'Telephon', 'Wake-up Service'],
            beds: "5beds",
            sleeps: "5sleeps")
      ],
       review: [
        {'name': 'ahmad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'amjad@123', 'comment': "gjhjiojhugdsswdfjimml"},
        {'name': 'ali@123', 'comment': "gjhjiojhugdsswdfjimml"}
      ]

       ),            
];