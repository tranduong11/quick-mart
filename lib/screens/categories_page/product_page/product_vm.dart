// import 'package:quick_mart/models/entity/firebase_entity/product_entity.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_mart/models/entity/firebase_entity/product_entity.dart';

class ProductVm extends ChangeNotifier {
  List<ProductEntity> listProduct = [];

  void fetchData(String id) {
    listProduct.clear();
    FirebaseFirestore.instance.collection("products").where("idProduct", isEqualTo: id).get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          listProduct.add(ProductEntity.fromJson(docSnapshot));
        }
        notifyListeners();
      },
    );
  }
}

// List<ProductEntity> listCopyWith = [
// ProductEntity(
//     id: "4",
//     idProduct: "0",
//     images: "https://shopdunk.com/images/thumbs/0022263_iphone-15-pro-128gb_240.png",
//     title: "Iphone 15",
//     price: "24.890.000",
//     detail:
//         "Chip Apple A17 Pro 6 nhân RAM: 8 GB Dung lượng: 128 GB Camera sau: Chính 48 MP & Phụ 12 MP, 12 MP Camera trước: 12 MP Pin 3274 mAh, Sạc 20 W"),
// ProductEntity(
//     id: "0",
//     idProduct: "0",
//     images: "https://shopdunk.com/images/thumbs/0012164_iphone-11-64gb_240.webp",
//     title: "Iphone 11",
//     price: "8.990.000",
//     detail:
//         "Chip Apple A13 Bionic RAM: 4 GB Dung lượng: 64 GB Camera sau: 2 camera 12 MP Camera trước: 12 MP Pin 3110 mAh, Sạc 18 W"),
// ProductEntity(
//     id: "10",
//     idProduct: "0",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-tim-thumb-600x600.jpg",
//     title: "Iphone 14 Pro Max",
//     price: "22.390.000",
//     detail:
//         "Chip Apple A15 Bionic RAM: 6 GB Dung lượng: 128 GB Camera sau: 2 camera 12 MP Camera trước: 12 MP Pin 3279 mAh, Sạc 20 W"),
// ProductEntity(
//     id: "6",
//     idProduct: "0",
//     images: "https://cdn.tgdd.vn/Products/Images/42/329149/iphone-16-pro-max-titan-sa-mac.png",
//     title: "Iphone 16 Pro Max",
//     price: "34.990.000",
//     detail:
//         "Chip Apple A18 Pro 6 nhân Dung lượng: 256 GB Camera sau: Chính 48 MP & Phụ 48 MP, 12 MP Camera trước: 12 MP"),
// ProductEntity(
//     id: "7",
//     idProduct: "0",
//     images: "https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-hong-thumb-1-600x600.jpg",
//     title: "Iphone 15",
//     price: "19.690.000",
//     detail:
//         "Chip Apple A16 Bionic RAM: 6 GB Dung lượng: 128 GB Camera sau: Chính 48 MP & Phụ 12 MP Camera trước: 12 MP Pin 3349 mAh, Sạc 20 W"),
// ProductEntity(
//     id: "8",
//     idProduct: "0",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/303891/iphone-15-plus-xanh-la-128gb-thumb-600x600.jpg",
//     title: "Iphone 15 Plus",
//     price: "22.690.000",
//     detail:
//         "Chip Apple A16 Bionic RAM: 6 GB Dung lượng: 128 GB Camera sau: Chính 48 MP & Phụ 12 MP Camera trước: 12 MP Pin 4383 mAh, Sạc 20 W"),
// ProductEntity(
//     id: "1",
//     idProduct: "0",
//     images: "https://shopdunk.com/images/thumbs/0006794_iphone-12-64gb_240.png",
//     title: "Iphone 12",
//     price: "10.990.000",
//     detail:
//         "Chip Apple A14 Bionic RAM: 4 GB Dung lượng: 64 GB Camera sau: 2 camera 12 MP Camera trước: 12 MP Pin 2815 mAh, Sạc 20 W"),
// ProductEntity(
//     id: "2",
//     idProduct: "0",
//     images: "https://shopdunk.com/images/thumbs/0024430_iphone-13-128gb_240.png",
//     title: "Iphone 13",
//     price: "28.990.000",
//     detail:
//         "Chip Apple A16 Bionic RAM: 6 GB Dung lượng: 512 GB Camera sau: Chính 48 MP & Phụ 12 MP Camera trước: 12 MP Pin 4383 mAh, Sạc 20 W"),
// ProductEntity(
//     id: "3",
//     idProduct: "0",
//     images: "https://shopdunk.com/images/thumbs/0009181_iphone-14-128gb_240.png",
//     title: "Iphone 14",
//     price: "17.590.000",
//     detail:
//         "Chip Apple A15 Bionic RAM: 6 GB Dung lượng: 128 GB Camera sau: 2 camera 12 MP Camera trước: 12 MP Pin 3279 mAh, Sạc 20 W"),
// ProductEntity(
//     id: "5",
//     idProduct: "0",
//     images: "https://shopdunk.com/images/thumbs/0029837_iphone-16-128gb_240.png",
//     title: "Iphone 16",
//     price: "25.990.000",
//     detail:
//         "Chip Apple A18 Bionic 6 nhân Dung lượng: 128 GB Camera sau: Chính 48 MP & Phụ 12 MP Camera trước: 12 MP"),
// ProductEntity(
//     id: "9",
//     idProduct: "0",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-white-thumbnew-600x600.jpg",
//     title: "Iphone 15 Pro",
//     price: "24.890.000",
//     detail:
//         "Chip Apple A18 Pro 6 nhân Dung lượng: 1 TB Camera sau: Chính 48 MP & Phụ 48 MP, 12 MP Camera trước: 12 MP"),

// ProductEntity(
//   id: "18",
//   idProduct: "1",
//   images:
//       "https://cdn.tgdd.vn/Products/Images/44/322939/macbook-air-15-inch-m3-2024-70w-130324-032500-600x600.jpg",
//   title: "MacBook Pro 16 inch M1 Pro",
//   price: "49.990.000",
//   detail:
//       "Màn hình: 14.2, 4K, 120Hz CPU: Apple M3 Pro, 150 GB/s memory bandwidth Card: 14 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.61 kg",
// ),
// ProductEntity(
//     id: "21",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/322636/macbook-air-15-inch-m3-2024-16gb-256gb-060324-095629-600x600.jpg",
//     title: "MacBook Pro 14 inch M3 Max",
//     price: "77.490.000",
//     detail:
//         "Màn hình: 14.2, 4K, 120Hz CPU: Apple M3 Pro, 150 GB/s memory bandwidth Card: 14 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.61 kg"),
// ProductEntity(
//     id: "19",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/322616/macbook-air-15-inch-m3-2024-xanh-600x600.jpg",
//     title: "MacBook Air 15 inch M3",
//     price: "41.990.000",
//     detail:
//         "Màn hình: 14.2, 4K, 120Hz CPU: Apple M3, 100GB/s Card: 10 nhân GPU Pin: Lên đến 22 giờ Khối lượng: 1.55 kg"),
// ProductEntity(
//     id: "16",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/282827/apple-macbook-air-m2-2022-xanh-600x600.jpg",
//     title: "MacBook Air 13 inch M2",
//     price: "23.890.000",
//     detail:
//         "Màn hình: 13.6, Retina CPU: Apple M2, 100GB/s Card: 8 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.24 kg"),
// ProductEntity(
//     id: "17",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/322635/macbook-air-15-inch-m3-2024-512gb-060324-095622-600x600.jpg",
//     title: "MacBook Air 13 inch M3",
//     price: "27.090.000",
//     detail:
//         "Màn hình: 13.6, 2K CPU: Apple M3, 100GB/s Card: 8 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.24 kg"),
// ProductEntity(
//     id: "14",
//     idProduct: "1",
//     images: "https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg",
//     title: "Macbook Air M1",
//     price: "18.590.000",
//     detail:
//         "Màn hình: 13.3, Retina CPU: Apple M1 Card: 7 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.29 kg"),
// ProductEntity(
//     id: "15",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/309016/apple-macbook-air-15-inch-m2-2023-gray-thumb-600x600.jpg",
//     title: "MacBook Pro 14 inch M3 Max",
//     price: "77.990.000",
//     detail:
//         "Màn hình: 14.2, 4K, 120Hz CPU: Apple M3 Max, 300 GB/s memory bandwidth Card: 30 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.61 kg"),
// ProductEntity(
//     id: "12",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/322939/macbook-air-15-inch-m3-2024-70w-130324-032500-600x600.jpg",
//     title: "MacBook Air 15 inch M2",
//     price: "27.590.000",
//     detail:
//         "Màn hình: 15.3, Retina CPU: Apple M2, 100GB/s Card: 10 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.51 kg"),
// ProductEntity(
//     id: "11",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/318228/macbook-pro-14-inch-m3-2023-311023-095050-600x600.jpg",
//     title: "MacBook Pro 14 inch M3",
//     price: "27.090.000",
//     detail:
//         "Màn hình: 13.6, 2K CPU: Apple M3, 100GB/s Card: 8 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.24 kg"),
// ProductEntity(
//     id: "13",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/322636/macbook-air-15-inch-m3-2024-16gb-256gb-060324-095629-600x600.jpg",
//     title: "MacBook Air 15 inch M3",
//     price: "41.990.000",
//     detail:
//         "Màn hình: 15.3, 2K CPU: Apple M3, 100GB/s Card: 10 nhân GPU Pin: Lên đến 18 giờ Khối lượng: 1.51 kg"),
// ProductEntity(
//     id: "20",
//     idProduct: "1",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/44/325307/apple-macbook-pro-16-inch-m3-max-96gb-1tb-thumb-600x600.jpg",
//     title: "MacBook Pro 16 inch M3 Max",
//     price: "109.990.000",
//     detail:
//         "Màn hình: 16.2, 4K, 120Hz CPU: Apple M3 Max, 400GB/s Card: 30 nhân GPU Pin: Lên đến 22 giờ Khối lượng: 2.16 kg"),
// ProductEntity(
//     id: "26",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0022173_apple-watch-ultra-2-gps-cellular-49mm-ocean-band_240.png",
//     title: "Apple Watch Ultra 2 GPS",
//     price: "22.990.000",
//     detail:
//         "Chất liệu mặt: Kính Sapphire Chất liệu khung viền: Titanium Chất liệu dây: Dây vải Độ rộng dây: Hãng không công bố Độ dài dây: 13 - 20 cm Khả năng thay dây: Có Kích thước, khối lượng: Dài 49 mm - Ngang 44 mm - Dày 14.4 mm - Nặng 61.8 g"),
// ProductEntity(
//     id: "23",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0029215_apple-watch-series-10-nhom-gps-42mm-sport-loop_240.jpeg",
//     title: "Apple Watch Series 10",
//     price: "14.390.000",
//     detail:
//         "Chất liệu mặt: Ion-X strengthened glass Chất liệu khung viền: Hợp kim nhôm Chất liệu dây: Silicone Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 46 mm - Ngang 39 mm - Dày 9.7 mm - Nặng 35.3 g"),
// ProductEntity(
//     id: "30",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0014028_apple-watch-series-8-45mm-nhom-gps-cellular_240.png",
//     title: "Apple Watch Series 8",
//     price: "15.990.000",
//     detail:
//         "Chất liệu mặt: Kính Sapphire Chất liệu khung viền: Thép không gỉ Chất liệu dây: Silicone Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 45 mm - Ngang 38 mm - Dày 10.7 mm - Nặng 51.5 g"),
// ProductEntity(
//     id: "27",
//     idProduct: "2",
//     images: "https://shopdunk.com/images/thumbs/0001025_apple-watch-series-7-nhom-gps_240.png",
//     title: "Apple Watch Series 7",
//     price: "22.990.000",
//     detail:
//         "Chất liệu mặt: Ion-X strengthened glass Chất liệu khung viền: Nhôm Chất liệu dây: Silicone Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 45 mm - Ngang 38 mm - Dày 10.7 mm - Nặng 38.8 g"),
// ProductEntity(
//     id: "28",
//     idProduct: "2",
//     images: "https://shopdunk.com/images/thumbs/0022278_apple-watch-series-3-nhom_240.png",
//     title: "Apple Watch Series 3",
//     price: "5.390.000",
//     detail:
//         "Chất liệu mặt: Kính cường lực Gorilla Glass 3 Chất liệu khung viền: Nhựa mạ kim loại Chất liệu dây: TPU Độ rộng dây: 2 cm Độ dài dây: 13 - 20.5 cm Khả năng thay dây: Có Kích thước, khối lượng: Dài 46 mm - Ngang 33.35 mm - Dày 9.99 mm - Nặng 22.5 g"),
// ProductEntity(
//     id: "32",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0022172_apple-watch-ultra-2-gps-cellular-49mm-alpine-loop_240.png",
//     title: "Apple Watch Ultra 2 GPS",
//     price: "22.990.000",
//     detail:
//         "Chất liệu mặt: Kính Sapphire Chất liệu khung viền: Titanium Chất liệu dây: Dây vải Độ rộng dây: Hãng không công bố Độ dài dây: 13 - 20 cm Khả năng thay dây: Có Kích thước, khối lượng: Dài 49 mm - Ngang 44 mm - Dày 14.4 mm - Nặng 61.8 g"),
// ProductEntity(
//     id: "24",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0022328_apple-watch-se-2023-gps-cellular-sport-band-size-sm_240.png",
//     title: "Apple Watch SE 2023 GPS",
//     price: "6.990.000",
//     detail:
//         "Chất liệu mặt: Ion-X strengthened glass Chất liệu khung viền: Hợp kim nhôm Chất liệu dây: Dây vải Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 44 mm - Ngang 38 mm - Dày 10.7 mm - Nặng 32.9 g"),
// ProductEntity(
//     id: "31",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0022172_apple-watch-ultra-2-gps-cellular-49mm-alpine-loop_240.png",
//     title: "Apple Watch Ultra 2 GPS",
//     price: "7.490.000",
//     detail:
//         "Chất liệu mặt: Ion-X strengthened glass Chất liệu khung viền: Hợp kim nhôm Chất liệu dây: Silicone Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 40 mm - Ngang 34 mm - Dày 10.7 mm - Nặng 27.8 g"),
// ProductEntity(
//     id: "29",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0022166_apple-watch-series-9-nhom-gps-41mm-sport-band_240.png",
//     title: "Apple Watch Series 9",
//     price: "8.990.000",
//     detail:
//         "Chất liệu mặt: Ion-X strengthened glass Chất liệu khung viền: Hợp kim nhôm Chất liệu dây: Silicone Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 41 mm - Ngang 35 mm - Dày 10.7 mm - Nặng 31.9 g"),
// ProductEntity(
//     id: "22",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0022174_apple-watch-ultra-2-gps-cellular-49mm-trail-loop_240.png",
//     title: "Apple Watch Series 10",
//     price: "14.390.000",
//     detail:
//         "Chất liệu mặt: Ion-X strengthened glass Chất liệu khung viền: Hợp kim nhôm Chất liệu dây: Silicone Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 46 mm - Ngang 39 mm - Dày 9.7 mm - Nặng 35.3 g"),
// ProductEntity(
//     id: "25",
//     idProduct: "2",
//     images:
//         "https://shopdunk.com/images/thumbs/0022276_apple-watch-se-2023-gps-sport-loop_240.jpeg",
//     title: "Apple Watch SE 2023 GPS Sport Loop",
//     price: "4.770.000",
//     detail:
//         "Chất liệu mặt: Ion-X strengthened glass Chất liệu khung viền: Hợp kim nhôm Chất liệu dây: Dây vải Độ rộng dây: Hãng không công bố Độ dài dây: Hãng không công bố Khả năng thay dây: Có Kích thước, khối lượng: Dài 44 mm - Ngang 38 mm - Dày 10.7 mm - Nặng 32.9 g"),

// ProductEntity(
//     id: "41",
//     idProduct: "3",
//     images:
//         "https://product.hstatic.net/200000348419/product/imac-24-inch-m3-purple_454cd9b2bb7b4576b0c6d5cd189ca13b_master.png",
//     title: "iMac M3 2023 24 inch",
//     price: "35.990.000",
//     detail:
//         "Cổng giao tiếp: Jack 3.5 mm 2 x Thunderbolt/USB 4 (hỗ trợ DisplayPort, Thunderbolt 3 up to 40Gb/s, USB 4 up to 40Gb/s và USB 3.1 Gen 2 up to 10Gb/s) Giao tiếp mạng: Wi-Fi 6E (802.11ax) Bluetooth 5.3 Webcam: 1080p FaceTime HD camera Tính năng khác: Đi kèm chuột & bàn phím không dây"),
// ProductEntity(
//     id: "40",
//     idProduct: "3",
//     images:
//         "https://shopdunk.com/images/thumbs/0026757_imac-m1-2021-24-inch-8-core-gpu8gb512gb-chinh-hang-cu-dep_240.jpeg",
//     title: "iMac M1 2021 24 inch",
//     price: "46.490.000",
//     detail:
//         "Tính năng nổi bật Màn hình Retina 4.5K 24 inch với gam màu rộng P3 và độ sáng 500 nit Chip Apple M1 đem đến hiệu năng mạnh mẽ với CPU 8 lõi và GPU 7 hoặc 8 lõi Thiết kế mỏng ấn tượng 11.5mm với sắc màu sống động Camera FaceTime HD 1080p với M1 ISP để quay video chất lượng ấn tượng Dãy ba micro chuẩn phòng thu để thực hiện cuộc gọi và ghi âm tiếng trong như pha lê Hệ thống âm thanh sáu loa cho trải nghiệm âm thanh chất lượng cao và mạnh mẽ ấn tượng Bộ lưu trữ SSD siêu nhanh lên đến 512GB Hai cổng Thunderbolt / USB và lên đến hai cổng USB Wi-Fi 6 siêu nhanh và công nghệ không dây Bluetooth 5.0 Phối màu hoàn hảo giữa Magic Mouse và Magic Keyboard hoặc Magic Keyboard và Touch ID macOS sở hữu thiết kế ấn tượng, dễ sử dụng và phối hợp mượt mà với iPhone Có các màu xanh dương, xanh lá, hồng, bạc, vàng, cam và tím"),
// ProductEntity(
//     id: "38",
//     idProduct: "3",
//     images: "https://shopdunk.com/images/thumbs/0000728_studio-display_240.png",
//     title: "Apple Studio Display 27 inch",
//     price: "45.490.000",
//     detail:
//         "Loại màn hình: Phẳng Kích thước màn hình: 27 inch Độ phân giải: 5K Retina (5120 x 2880) Màn hình cảm ứng: Không cảm ứng Tấm nền: Hãng không công bố Tần số quét: Hãng không công bố Thời gian đáp ứng: Hãng không công bố Công nghệ màn hình: True Tone technology Wide color (P3) Số lượng màu: 1 tỷ màu Độ sáng: 600 cd/m2 Độ tương phản tĩnh: Hãng không công bố Góc nhìn: Hãng không công bố"),
// ProductEntity(
//     id: "34",
//     idProduct: "3",
//     images: "https://shopdunk.com/images/thumbs/0010524_pink_550.webp",
//     title: "iMac M1 2021 24 inch",
//     price: "27.990.000",
//     detail:
//         "Tính năng nổi bật Màn hình Retina 4.5K 24 inch với gam màu rộng P3 và độ sáng 500 nit Chip Apple M1 đem đến hiệu năng mạnh mẽ với CPU 8 lõi và GPU 7 hoặc 8 lõi Thiết kế mỏng ấn tượng 11.5mm với sắc màu sống động Camera FaceTime HD 1080p với M1 ISP để quay video chất lượng ấn tượng Dãy ba micro chuẩn phòng thu để thực hiện cuộc gọi và ghi âm tiếng trong như pha lê Hệ thống âm thanh sáu loa cho trải nghiệm âm thanh chất lượng cao và mạnh mẽ ấn tượng Bộ lưu trữ SSD siêu nhanh lên đến 512GB Hai cổng Thunderbolt / USB và lên đến hai cổng USB Wi-Fi 6 siêu nhanh và công nghệ không dây Bluetooth 5.0 Phối màu hoàn hảo giữa Magic Mouse và Magic Keyboard hoặc Magic Keyboard và Touch ID macOS sở hữu thiết kế ấn tượng, dễ sử dụng và phối hợp mượt mà với iPhone Có các màu xanh dương, xanh lá, hồng, bạc, vàng, cam và tím"),
// ProductEntity(
//     id: "33",
//     idProduct: "3",
//     images: "https://shopdunk.com/images/thumbs/0010518_green_550.webp",
//     title: "iMac M1 2021 24 inch",
//     price: "30.000.000",
//     detail:
//         "Tính năng nổi bật Màn hình Retina 4.5K 24 inch với gam màu rộng P3 và độ sáng 500 nit Chip Apple M1 đem đến hiệu năng mạnh mẽ với CPU 8 lõi và GPU 7 hoặc 8 lõi Thiết kế mỏng ấn tượng 11.5mm với sắc màu sống động Camera FaceTime HD 1080p với M1 ISP để quay video chất lượng ấn tượng Dãy ba micro chuẩn phòng thu để thực hiện cuộc gọi và ghi âm tiếng trong như pha lê Hệ thống âm thanh sáu loa cho trải nghiệm âm thanh chất lượng cao và mạnh mẽ ấn tượng Bộ lưu trữ SSD siêu nhanh lên đến 512GB Hai cổng Thunderbolt / USB và lên đến hai cổng USB Wi-Fi 6 siêu nhanh và công nghệ không dây Bluetooth 5.0 Phối màu hoàn hảo giữa Magic Mouse và Magic Keyboard hoặc Magic Keyboard và Touch ID macOS sở hữu thiết kế ấn tượng, dễ sử dụng và phối hợp mượt mà với iPhone Có các màu xanh dương, xanh lá, hồng, bạc, vàng, cam và tím"),
// ProductEntity(
//     id: "36",
//     idProduct: "3",
//     images:
//         "https://shopdunk.com/images/thumbs/0024290_imac-m3-2023-24-inch-10-core-gpu8gb512gb_240.jpeg",
//     title: "iMac M3 2023 24 inch",
//     price: "45.390.000",
//     detail:
//         "Một màn hình rời có độ phân giải lên đến 6K ở tần số 60Hz Đầu ra DisplayPort gốc qua cổng USB-C Hỗ trợ đầu ra VGA, HDMI, DVI và Thunderbolt 2 bằng cách sử dụng bộ tiếp hợp (được bán riêng) Chip CPU 8 lõi với 4 lõi hiệu năng và 4 lõi tiết kiệm điện GPU 10 lõi Công nghệ dò tia tốc độ cao bằng phần cứng Neural Engine 16 lõi Băng thông bộ nhớ 100GB/s Màn Hình Độ phân giải 4480x2520 với mật độ 218 pixel mỗi inch, hỗ trợ 1 tỷ màu Độ sáng 500 nit Dải màu rộng (P3) Công nghệ True Tone Kích thước thật của màn hình theo đường chéo là 23,5 inch. Camera Camera FaceTime HD 1080p Bộ xử lý tín hiệu hình ảnh tiên tiến với video điện toán"),
// ProductEntity(
//     id: "35",
//     idProduct: "3",
//     images:
//         "https://shopdunk.com/images/thumbs/0022756_imac-m3-2023-24-inch-8-core-gpu8gb256gb_240.jpeg",
//     title: "iMac M3 2023 24 inch",
//     price: "34.990.000",
//     detail:
//         "Một màn hình rời có độ phân giải lên đến 6K ở tần số 60Hz Đầu ra DisplayPort gốc qua cổng USB-C Hỗ trợ đầu ra VGA, HDMI, DVI và Thunderbolt 2 bằng cách sử dụng bộ tiếp hợp (được bán riêng) Chip CPU 8 lõi với 4 lõi hiệu năng và 4 lõi tiết kiệm điện GPU 8 lõi Công nghệ dò tia tốc độ cao bằng phần cứng Neural Engine 16 lõi Băng thông bộ nhớ 100GB/s Màn Hình Độ phân giải 4480x2520 với mật độ 218 pixel mỗi inch, hỗ trợ 1 tỷ màu Độ sáng 500 nit Dải màu rộng (P3) Công nghệ True Tone Kích thước thật của màn hình theo đường chéo là 23,5 inch. Camera Camera FaceTime HD 1080p Bộ xử lý tín hiệu hình ảnh tiên tiến với video điện toán"),
// ProductEntity(
//     id: "39",
//     idProduct: "3",
//     images:
//         "https://shopdunk.com/images/thumbs/0000807_imac-m1-2021-24-inch-7-core-gpu8gb256gb_240.webp",
//     title: "iMac M3 2023 24 inch",
//     price: "40.390.000",
//     detail:
//         "Một màn hình rời có độ phân giải lên đến 6K ở tần số 60Hz Đầu ra DisplayPort gốc qua cổng USB-C Hỗ trợ đầu ra VGA, HDMI, DVI và Thunderbolt 2 bằng cách sử dụng bộ tiếp hợp (được bán riêng) Chip CPU 8 lõi với 4 lõi hiệu năng và 4 lõi tiết kiệm điện GPU 10 lõi Công nghệ dò tia tốc độ cao bằng phần cứng Neural Engine 16 lõi Băng thông bộ nhớ 100GB/s Màn Hình Độ phân giải 4480x2520 với mật độ 218 pixel mỗi inch, hỗ trợ 1 tỷ màu Độ sáng 500 nit Dải màu rộng (P3) Công nghệ True Tone Kích thước thật của màn hình theo đường chéo là 23,5 inch."),
// ProductEntity(
//     id: "37",
//     idProduct: "3",
//     images:
//         "https://shopdunk.com/images/thumbs/0024252_imac-m3-2023-24-inch-10-core-gpu8gb256gb_240.jpeg",
//     title: "iMac M3 2023 24 inch",
//     price: "60.490.000",
//     detail:
//         "Cổng giao tiếp: Jack 3.5 mm 2 x Thunderbolt/USB 4 (hỗ trợ DisplayPort, Thunderbolt 3 up to 40Gb/s, USB 4 up to 40Gb/s và USB 3.1 Gen 2 up to 10Gb/s) 2 x USB 3 Giao tiếp mạng: Wi-Fi 6E (802.11ax) Bluetooth 5.3 Webcam: 1080p FaceTime HD camera Tính năng khác: Đi kèm chuột & bàn phím không dây Bàn phím tích hợp Touch ID"),

// ProductEntity(
//     id: "48",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/321771/samsung-galaxy-a55-5g-den-thumb-1-600x600.jpg",
//     title: "Samsung Galaxy A55 5G",
//     price: "11.990.000",
//     detail:
//         "Chip Exynos 1480 8 nhân RAM: 12 GB Dung lượng: 256 GB Camera sau: Chính 50 MP & Phụ 12 MP, 5 MP Camera trước: 32 MP Pin 5000 mAh, Sạc 25 W"),
// ProductEntity(
//     id: "45",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/310056/samsung-galaxy-a25-5g-xanh-duong-thumb-600x600.jpg",
//     title: "Samsung Galaxy A25 5G",
//     price: "6.390.000",
//     detail:
//         "Chip Exynos 1280 RAM: 8 GB Dung lượng: 128 GB Camera sau: Chính 50 MP & Phụ 8 MP, 2 MP Camera trước: 13 MP Pin 5000 mAh, Sạc 25 W"),
// ProductEntity(
//     id: "42",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/319667/samsung-galaxy-s24-ultra-grey-thumbnew-600x600.jpg",
//     title: "Samsung Galaxy S24 Ultra",
//     price: "27.990.000",
//     detail:
//         "Chip Snapdragon 8 Gen 3 for Galaxy RAM: 12 GB Dung lượng: 256 GB Camera sau: Chính 200 MP & Phụ 50 MP, 12 MP, 10 MP Camera trước: 12 MP Pin 5000 mAh, Sạc 45 W"),
// ProductEntity(
//     id: "47",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/313202/samsung-galaxy-a05s-black-thumbnew-600x600.jpg",
//     title: "Samsung Galaxy A05s",
//     price: "4.090.000",
//     detail:
//         "Chip Snapdragon 680 RAM: 6 GB Dung lượng: 128 GB Camera sau: Chính 50 MP & Phụ 2 MP, 2 MP Camera trước: 13 MP Pin 5000 mAh, Sạc 25 W"),
// ProductEntity(
//     id: "44",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/323459/samsung-galaxy-s23-fe-tim-thumbnew-600x600.jpg",
//     title: "Samsung Galaxy S23 FE",
//     price: "12.390.000",
//     detail:
//         "Chip Exynos 2200 8 nhân RAM: 8 GB Dung lượng: 256 GB Camera sau: Chính 50 MP & Phụ 12 MP, 8 MP Camera trước: 10 MP Pin 4500 mAh, Sạc 25 W"),
// ProductEntity(
//     id: "43",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/301796/samsung-galaxy-s23-ultra-thumb-den-600x600.jpg",
//     title: "Samsung Galaxy S23",
//     price: "22.990.000",
//     detail:
//         "Chip Snapdragon 8 Gen 2 for Galaxy RAM: 8 GB Dung lượng: 256 GB Camera sau: Chính 200 MP & Phụ 12 MP, 10 MP, 10 MP Camera trước: 12 MP Pin 5000 mAh, Sạc 45 W"),
// ProductEntity(
//     id: "50",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/319901/samsung-galaxy-a15-4g-den-thumb-600x600.jpg",
//     title: "Samsung Galaxy A15",
//     price: "5.190.000",
//     detail:
//         "Chip MediaTek Helio G99 RAM: 8 GB Dung lượng: 256 GB Camera sau: Chính 50 MP & Phụ 5 MP, 2 MP Camera trước: 13 MP Pin 5000 mAh, Sạc 25 W"),
// ProductEntity(
//     id: "49",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/313199/samsung-galaxy-a05-green-thumbnew-600x600.jpg",
//     title: "Samsung Galaxy A05",
//     price: "3.090.000",
//     detail:
//         "Chip MediaTek Helio G85 RAM: 6 GB Dung lượng: 128 GB Camera sau: Chính 50 MP & Phụ 2 MP Camera trước: 8 MP Pin 5000 mAh, Sạc 25 W"),
// ProductEntity(
//     id: "46",
//     idProduct: "4",
//     images:
//         "https://cdn.tgdd.vn/Products/Images/42/321778/samsung-galaxy-a35-5g-vang-thumb-1-600x600.jpg",
//     title: "Samsung Galaxy A35",
//     price: "8.790.000",
//     detail:
//         "Chip Exynos 1380 8 nhân RAM: 8 GB Dung lượng: 256 GB Camera sau: Chính 50 MP & Phụ 8 MP, 5 MP Camera trước: 13 MP Pin 5000 mAh, Sạc 25 W"),
//
//   ProductEntity(
//       id: "59",
//       idProduct: "5",
//       images: "https://cdn.tgdd.vn/Products/Images/522/247517/iPad-9-wifi-trang-600x600.jpg",
//       title: "iPad 9 WiFi",
//       price: "7.690.000",
//       detail:
//           "Màn hình Công nghệ màn hình: Retina IPS LCD Độ phân giải: 1620 x 2160 Pixels Màn hình rộng: 10.2 - Tần số quét Hãng không công bố Hệ điều hành & CPU Hệ điều hành: iPadOS 15 Chip xử lý (CPU): Apple A13 Bionic Tốc độ CPU: 2 nhân 2.65 GHz & 4 nhân 1.8 GHz Chip đồ hoạ (GPU): Apple GPU 4 nhân Bộ nhớ & Lưu trữ RAM: 3 GB Dung lượng lưu trữ: 64 GB Dung lượng còn lại (khả dụng) khoảng: 49 GB"),
//   ProductEntity(
//       id: "53",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/325501/ipad-air-11-inch-m2-wifi-blue-thumb-600x600.jpg",
//       title: "iPad Air 6 M2",
//       price: "16.990.000",
//       detail:
//           "Màn hình Công nghệ màn hình: Retina IPS LCD Độ phân giải: 1640 x 2360 Pixels Màn hình rộng: 11 - Tần số quét Hãng không công bố Hệ điều hành & CPU Hệ điều hành: iPadOS 17 Chip xử lý (CPU): Apple M2 8 nhân Tốc độ CPU: Hãng không công bố Chip đồ hoạ (GPU): Apple GPU 9 nhân Bộ nhớ & Lưu trữ RAM: 8 GB Dung lượng lưu trữ: 128 GB Dung lượng còn lại (khả dụng) khoảng: 113 GB"),
//   ProductEntity(
//       id: "56",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/325506/ipad-air-13-inch-m2-wifi-purple-thumb-600x600.jpg",
//       title: "iPad Air 6 M2",
//       price: "25.790.000",
//       detail:
//           "Màn hình Công nghệ màn hình: Retina IPS LCD Độ phân giải: 2048 x 2732 Pixels Màn hình rộng: 13 - Tần số quét Hãng không công bố Hệ điều hành & CPU Hệ điều hành: iPadOS 17 Chip xử lý (CPU): Apple M2 8 nhân Tốc độ CPU: Hãng không công bố Chip đồ hoạ (GPU): Apple GPU 9 nhân Bộ nhớ & Lưu trữ RAM: 8 GB Dung lượng lưu trữ: 128 GB Dung lượng còn lại (khả dụng) khoảng: 113 GB"),
//   ProductEntity(
//       id: "60",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/325989/redmi-pad-pro-blue-thumb-1-2-600x600.jpg",
//       title: "Xiaomi Redmi Pad Pro",
//       price: "6.990.000",
//       detail:
//           "Màn hình Công nghệ màn hình: IPS LCD Độ phân giải: 1600 x 2560 Pixels Màn hình rộng: 12.1 - Tần số quét 120 Hz Hệ điều hành & CPU Hệ điều hành: Xiaomi HyperOS (Android 14) Chip xử lý (CPU): Snapdragon 7s Gen 2 8 nhân Tốc độ CPU: 4 nhân 2.3 GHz & 4 nhân 1.95 GHz Chip đồ hoạ (GPU): Adreno 710 Bộ nhớ & Lưu trữ RAM: 8 GB Dung lượng lưu trữ: 128 GB Dung lượng còn lại (khả dụng) khoảng: 103 GB Thẻ nhớ ngoài: Micro SD, hỗ trợ tối đa 1.5 TB"),
//   ProductEntity(
//       id: "55",
//       idProduct: "5",
//       images: "https://cdn.tgdd.vn/Products/Images/522/294103/iPad-Gen-10-sliver-thumb-600x600.jpg",
//       title: "iPad 10 WiFi",
//       price: "9.990.000",
//       detail:
//           "1/8 1/6 Thế Giới Di Động cam kết Hư gì đổi nấy 12 tháng tại 2968 siêu thị toàn quốc (miễn phí tháng đầu) Xem chi tiết Bảo hành chính hãng máy tính bảng 1 năm tại các trung tâm bảo hành hãng Xem địa chỉ bảo hành Bộ sản phẩm gồm: Sách hướng dẫn, Hộp máy, Cáp Type-C, Củ sạc nhanh rời đầu Type C Thông số kỹ thuật Bài viết đánh giá iPad 10 WiFi 64GB Màn hình Công nghệ màn hình: Retina IPS LCD Độ phân giải: 1640 x 2360 Pixels Màn hình rộng: 10.9 - Tần số quét 60 Hz Hệ điều hành & CPU Hệ điều hành: iPadOS 17 Chip xử lý (CPU): Apple A14 Bionic Tốc độ CPU: 2 nhân 3.1 GHz & 4 nhân 1.8 GHz Chip đồ hoạ (GPU): Apple GPU 4 nhân Bộ nhớ & Lưu trữ RAM: 4 GB Dung lượng lưu trữ: 64 GB Dung lượng còn lại (khả dụng) khoảng: 49 GB"),
//   ProductEntity(
//       id: "58",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/325991/xiaomi-poco-pad-grey-thumb-1-2-600x600.jpg",
//       title: "Xiaomi POCO Pad WiFi",
//       price: "7.690.000",
//       detail:
//           "Màn hình Công nghệ màn hình: IPS LCD Độ phân giải: 1600 x 2560 Pixels Màn hình rộng: 12.1 - Tần số quét 120 Hz Hệ điều hành & CPU Hệ điều hành: Xiaomi HyperOS (Android 14) Chip xử lý (CPU): Snapdragon 7s Gen 2 8 nhân Tốc độ CPU: 4 nhân 2.4 GHz & 4 nhân 1.95 GHz Chip đồ hoạ (GPU): Adreno 710 Bộ nhớ & Lưu trữ RAM: 8 GB Dung lượng lưu trữ: 256 GB Dung lượng còn lại (khả dụng) khoảng: 241 GB Thẻ nhớ ngoài: Micro SD, hỗ trợ tối đa 1.5 TB"),
//   ProductEntity(
//       id: "52",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/309818/galaxy-tab-s9-fe-xanh-mint-thumb-600x600.jpg",
//       title: "Samsung Galaxy Tab S9",
//       price: "8.990.000",
//       detail:
//           "Màn hình Công nghệ màn hình: TFT LCD Độ phân giải: 1440 x 2304 Pixels Màn hình rộng: 10.9 - Tần số quét 90 Hz Hệ điều hành & CPU Hệ điều hành: Android 13 Chip xử lý (CPU): Exynos 1380 8 nhân Tốc độ CPU: 4 nhân 2.4 GHz & 4 nhân 2 GHz Chip đồ hoạ (GPU): Mali-G68 MP5 Bộ nhớ & Lưu trữ RAM: 6 GB Dung lượng lưu trữ: 128 GB Dung lượng còn lại (khả dụng) khoảng: 99.9 GB Thẻ nhớ ngoài: Micro SD, hỗ trợ tối đa 1 TB"),
//   ProductEntity(
//       id: "51",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/325513/ipad-pro-11-inch-m4-wifi-black-thumb-600x600.jpg",
//       title: "iPad Pro M4",
//       price: "32.990.000",
//       detail:
//           "Màn hình Công nghệ màn hình: Ultra Retina XDR Độ phân giải: 1668 x 2420 Pixels Màn hình rộng: 11 - Tần số quét 120 Hz Hệ điều hành & CPU Hệ điều hành: iPadOS 17 Chip xử lý (CPU): Apple M4 9 nhân Tốc độ CPU: Hãng không công bố Chip đồ hoạ (GPU): Apple GPU 10 nhân Bộ nhớ & Lưu trữ RAM: 8 GB Dung lượng lưu trữ: 256 GB Dung lượng còn lại (khả dụng) khoảng: 241 GB"),
//   ProductEntity(
//       id: "54",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/325534/ipad-pro-13-inch-m4-lte-sliver-thumb-600x600.jpg",
//       title: "iPad Pro M4",
//       price: "37.290.000",
//       detail:
//           "Màn hình Công nghệ màn hình: Ultra Retina XDR Độ phân giải: 2064 x 2752 Pixels Màn hình rộng: 13 - Tần số quét 120 Hz Hệ điều hành & CPU Hệ điều hành: iPadOS 17 Chip xử lý (CPU): Apple M4 9 nhân Tốc độ CPU: Hãng không công bố Chip đồ hoạ (GPU): Apple GPU 10 nhân Bộ nhớ & Lưu trữ RAM: 8 GB Dung lượng lưu trữ: 256 GB Dung lượng còn lại (khả dụng) khoảng: 241 GB"),
//   ProductEntity(
//       id: "57",
//       idProduct: "5",
//       images:
//           "https://cdn.tgdd.vn/Products/Images/522/248091/ipad-mini-6-wifi-starlight-1-600x600.jpg",
//       title: "iPad mini 6",
//       price: "12.890.000",
//       detail:
//           "Màn hình Công nghệ màn hình: LED-backlit IPS LCD Độ phân giải: 1488 x 2266 Pixels Màn hình rộng: 8.3 - Tần số quét Hãng không công bố Hệ điều hành & CPU Hệ điều hành: iPadOS 15 Chip xử lý (CPU): Apple A15 Bionic Tốc độ CPU: 2.93 GHz Chip đồ hoạ (GPU): Apple GPU 5 nhân Bộ nhớ & Lưu trữ RAM: 4 GB Dung lượng lưu trữ: 64 GB Dung lượng còn lại (khả dụng) khoảng: 49 GB"),
// ];
