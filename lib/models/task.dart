//ไฟล์ที่แมปกับข้อมูลในตารางบน Supabase
class Task {
  //ตัวแปรที่ล้อกับชื่อคอลัมน์ในตาราง
  String? id;
  String? foodDate;
  String? foodMeal;
  String? foodName;
  String? foodPrice;
  String? foodPerson;
  String? foodImagesUrl;

  // Constructor
  //ที่เอาไว้แพ็กข้อมูลเวลาส่งไป Insert/Update ไปยัง Supabase
  //ที่เอาไว้แพ็กข้อมูลเวลาส่งค่าระหว่างหน้าจอ หรือ ส่งค่าข้อมูลไปมาใดๆ
Task({
    this.id,
    this.foodDate,
    this.foodMeal,
    this.foodName,
    this.foodPrice,
    this.foodPerson,
    this.foodImagesUrl,
  });

  // คำสั่งในการแปลงข้อมูลจาก Supabase ซึ่งเป็น JSOM มาใช้ในแอปฯ formJson
factory Task.fromJson(Map<String, dynamic> json) => Task (
      id: json['id'],
      foodDate: json['food_date'],
      foodMeal: json['food_meal'],
      foodName: json['food_name'],
      foodPrice: json['food_price'],
      foodPerson: json['food_person'],
      foodImagesUrl: json['food_images_url'],
    );
    
  // คำสั่งในการแปลงข้อมูลจาก แอปฯ ไปเป็น JSON เพื่อส่งไปยัง Supabase -> toJson
Map<String, dynamic> toJson() => {
    'id': id,
    'food_date': foodDate,
    'food_meal': foodMeal,
    'food_name': foodName,
    'food_price': foodPrice,
    'food_person': foodPerson,
    'food_images_url': foodImagesUrl,
  };



}