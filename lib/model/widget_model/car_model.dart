class CarModel {
  final String name;
  final String imgSrc;
  final double ratePerHour;
  final List<CarFeature> features;
  late bool isFavourite;

  CarModel(
      {required this.name,
      required this.imgSrc,
      required this.ratePerHour,
      required this.features,
      required this.isFavourite});
}

class CarFeature {
  final String title;
  final String value;
  final String iconImg;

  CarFeature({required this.iconImg, required this.title, required this.value});
}

List<CarModel> carList = [
  CarModel(
    name: 'Tata Nexon',
    imgSrc: "assets/car/car_1.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "6"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "300 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "150 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Auto"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "2"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Petrol"),
    ],
    isFavourite: false,
    ratePerHour: 300,
  ),
  CarModel(
    name: 'Toyota Corolla',
    imgSrc: "assets/car/car_2.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "5"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "200 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "170 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Manual"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "4"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Gasoline"),
    ],
    isFavourite: true,
    ratePerHour: 350,
  ),
  CarModel(
    name: 'Honda Accord',
    imgSrc: "assets/car/car_3.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "5"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "250 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "160 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Auto"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "6"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Hybrid"),
    ],
    isFavourite: false,
    ratePerHour: 320,
  ),
  CarModel(
    name: 'Ford Mustang',
    imgSrc: "assets/car/car_4.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "4"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "450 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "250 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Manual"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "2"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Gasoline"),
    ],
    isFavourite: true,
    ratePerHour: 400,
  ),
  CarModel(
    name: 'Chevrolet Camaro',
    imgSrc: "assets/car/car_5.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "4"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "420 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "240 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Auto"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "4"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Gasoline"),
    ],
    isFavourite: false,
    ratePerHour: 380,
  ),
  CarModel(
    name: 'Nissan Rogue',
    imgSrc: "assets/car/car_6.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "5"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "180 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "170 Km/hr"),
      CarFeature(iconImg: "assets/icon/gears.png", title: "Gear", value: "CVT"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "6"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Gasoline"),
    ],
    isFavourite: true,
    ratePerHour: 280,
  ),
  CarModel(
    name: 'Volkswagen Golf',
    imgSrc: "assets/car/car_7.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "5"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "170 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "180 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Auto"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "4"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Diesel"),
    ],
    isFavourite: false,
    ratePerHour: 260,
  ),
  CarModel(
    name: 'Jeep Wrangler',
    imgSrc: "assets/car/car_8.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "4"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "285 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "180 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Manual"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "2"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Gasoline"),
    ],
    isFavourite: true,
    ratePerHour: 350,
  ),
  CarModel(
    name: 'Subaru Outback',
    imgSrc: "assets/car/car_9.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "5"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "200 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "180 Km/hr"),
      CarFeature(iconImg: "assets/icon/gears.png", title: "Gear", value: "CVT"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "6"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Gasoline"),
    ],
    isFavourite: true,
    ratePerHour: 340,
  ),
  CarModel(
    name: 'Mercedes-Benz E-Class',
    imgSrc: "assets/car/car_10.jpeg",
    features: [
      CarFeature(
          iconImg: "assets/icon/car_seat.png", title: "Capacity", value: "5"),
      CarFeature(
          iconImg: "assets/icon/hourse_power.png",
          title: "Engine",
          value: "300 HP"),
      CarFeature(
          iconImg: "assets/icon/spedo_meter.png",
          title: "Max Speed",
          value: "240 Km/hr"),
      CarFeature(
          iconImg: "assets/icon/gears.png", title: "Gear", value: "Auto"),
      CarFeature(
          iconImg: "assets/icon/air_bag.png", title: "Air Bag", value: "8"),
      CarFeature(
          iconImg: "assets/icon/fuel.png", title: "Fuel", value: "Diesel"),
    ],
    isFavourite: false,
    ratePerHour: 400,
  ),
];
