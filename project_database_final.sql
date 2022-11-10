-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 11:15 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` varchar(50) NOT NULL,
  `Category_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Category_Name`) VALUES
('C0001', 'Các món bò'),
('C0002', 'Các món gà'),
('C0003', 'Các món cá'),
('C0004', 'Lẩu'),
('C0005', 'Nướng'),
('C0006', 'Nước ngọt'),
('C0007', 'Bia/Rượu');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_ID` varchar(50) NOT NULL,
  `Emp_name` varchar(50) NOT NULL,
  `Emp_birthday` date NOT NULL,
  `Emp_gender` varchar(3) NOT NULL,
  `Emp_phone` varchar(50) NOT NULL,
  `Emp_address` text NOT NULL,
  `Emp_role` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_ID`, `Emp_name`, `Emp_birthday`, `Emp_gender`, `Emp_phone`, `Emp_address`, `Emp_role`, `Username`, `Password`) VALUES
('AD01', 'Hong Quan', '2002-10-01', 'Nam', '0708992832', 'Hậu Giang', 'admin', 'admin', 'c4ca4238a0b923820dcc509a6f75849b'),
('E0001', 'Lê Duy Khánh', '2002-10-01', 'Nam', '0999999999', 'Cà Mau', 'emp', 'E0001Khanh', 'c4ca4238a0b923820dcc509a6f75849b'),
('E0002', 'Quan', '2002-10-01', 'Nam', '0708992832', 'Hậu Giang', 'admin', 'qan', 'c4ca4238a0b923820dcc509a6f75849b'),
('T12', 'a', '2004-11-03', 'Nu', '0708992832', 'a', 'emp', 'a', 'c4ca4238a0b923820dcc509a6f75849b');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `Food_ID` varchar(50) NOT NULL,
  `Food_name` varchar(50) NOT NULL,
  `Price` double NOT NULL,
  `F_Status` varchar(50) NOT NULL,
  `URL_img` varchar(500) NOT NULL,
  `Validate` varchar(50) NOT NULL,
  `Category_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`Food_ID`, `Food_name`, `Price`, `F_Status`, `URL_img`, `Validate`, `Category_ID`) VALUES
('F00001', 'Bò Lúc Lắc', 45000, 'true', 'https://anmongiday.com/wp-content/uploads/2020/05/huong-dan-cach-lam-bo-luc-lac-mem-khong-bi-dai-cung-1.jpg', 'false', 'C0001'),
('F00002', 'Bò xào khổ qua', 55000, 'true', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/400/734/products/a-nh-chu-p-ma-n-hi-nh-2021-03-19-lu-c-2-23-26-ch.png?v=1616138725227', 'true', 'C0001'),
('F00003', 'Bò xào ớt chuông', 55000, 'true', 'https://netamthuc.vn/wp-content/uploads/2021/06/hoan-tanh-mon-thit-bo-xao-ot-chuong.jpg', 'true', 'C0001'),
('F00004', 'Bò Beef steak', 45000, 'true', 'https://cdn.tgdd.vn/2020/11/content/4-800x500-5.jpg', 'true', 'C0001'),
('F00005', 'Bò kho', 45000, 'true', 'https://cdn.tgdd.vn/Files/2018/12/13/1137914/cach-nau-bo-kho-tai-nha-bang-goi-gia-vi-bo-kho-don-gian-ngon-dung-dieu-202107211101519924.jpg', 'true', 'C0001'),
('F00006', 'Bò né', 45000, 'true', 'https://cdn.beptruong.edu.vn/wp-content/uploads/2021/04/bo-ne.jpg', 'true', 'C0001'),
('F00020', 'Cánh gà chiên giòn', 45000, 'true', 'https://www.knorr.com/content/dam/unilever/global/recipe_image/158/15803/158035-default.jpg/_jcr_content/renditions/cq5dam.web.800.600.jpeg', 'true', 'C0002'),
('F00021', 'Đùi gà chiên giòn', 65000, 'true', 'https://ngonaz.com/wp-content/uploads/2022/04/cach-lam-ga-ran-han-quoc.jpg', 'true', 'C0002'),
('F00022', 'Cánh gà chiên nước mắm', 45000, 'true', 'https://cdn.tgdd.vn/Files/2020/04/04/1246636/chia-se-cach-lam-canh-ga-chien-nuoc-mam-thom-ngon-kho-cuong-202202251510579911.jpg', 'true', 'C0002'),
('F00023', 'Đùi gà chiên nước mắm', 65000, 'true', 'https://cdn.tgdd.vn/Files/2020/04/04/1246636/chia-se-cach-lam-canh-ga-chien-nuoc-mam-thom-ngon-kho-cuong-202202251510579911.jpg', 'true', 'C0002'),
('F00024', 'Chân gà xả tắc', 25000, 'true', 'https://vohan.vn/wp-content/uploads/2021/05/chan-ga-sa-tac.jpg', 'true', 'C0002'),
('F00025', 'Chân gà sốt thái', 25000, 'true', 'https://cdn.tgdd.vn/2021/09/CookProduct/1200o-1200x676.jpg', 'true', 'C0002'),
('F00040', 'Cá Tai Tượng Chiên Xù', 65000, 'true', 'https://yummyday.vn/uploads/images/cach-chien-xu-ca-tai-tuong.jpg', 'true', 'C0003'),
('F00041', 'Cá lóc nướng', 65000, 'true', 'https://cdn.daotaobeptruong.vn/wp-content/uploads/2020/07/ca-loc-nuong-trui.jpg', 'true', 'C0003'),
('F00042', 'Cá lóc hấp', 65000, 'true', 'https://cdn.huongnghiepaau.com/wp-content/uploads/2019/01/ca-loc-hap-bau.jpg', 'true', 'C0003'),
('F00043', 'Cá chép chiên sốt cà', 55000, 'true', 'https://www.cungcaphaisan.com/contents_cungcaphaisan/uploads/images/che-bien/ca-chep-gion-nau-chua-ngot.jpg', 'true', 'C0003'),
('F00044', 'Cá kho tộ', 65000, 'true', 'https://cdn.tgdd.vn/Files/2021/02/23/1329799/bi-quyet-nau-ca-kho-to-ngon-chuan-vi-ca-dai-mau-sac-chuan-dep-202102231139008474.jpg', 'true', 'C0003'),
('F00080', 'Lẩu thái', 120000, 'true', 'https://cdn.tgdd.vn/Files/2019/07/26/1181815/lau-thai-hai-san-chua-chua-cay-cay-danh-bay-cai-lanh-202111161130260017.jpg', 'true', 'C0004'),
('F00081', 'Lẩu kim chi Hàn Quốc', 99000, 'true', 'https://cdn.cet.edu.vn/wp-content/uploads/2019/03/lau-kim-chi-hai-san.jpg', 'true', 'C0004'),
('F00082', 'Lẩu Nấm', 120000, 'true', 'https://cdn.daynauan.info.vn/wp-content/uploads/2019/05/cach-nau-lau-nam-ngon.jpg', 'true', 'C0004'),
('F00083', 'Lẩu Hải Sản', 120000, 'true', 'https://cdn.tgdd.vn/Files/2021/02/25/1330480/tong-hop-3-cach-nau-lau-hai-san-thom-ngon-tai-nha-202202231018022482.jpg', 'true', 'C0004'),
('F00084', 'Lẩu Bò', 120000, 'true', 'https://image-us.eva.vn/upload/2-2022/images/2022-06-09/image14-1654766816-198-width900height600.jpg', 'true', 'C0004'),
('F00085', 'Lẩu cá hồi', 120000, 'true', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/lenttt/4cachnaulaudaucahoi/cach-nau-lau-dau-ca-hoi-don-gian-tai-nha-ai-an-cung-thich-me-2.jpg', 'true', 'C0004'),
('F00086', 'Lẩu tobokki', 120000, 'true', 'https://cf.shopee.vn/file/2cdc944e5aca5d87f41f705f77ddc135', 'true', 'C0004'),
('F00100', 'Sườn heo', 65000, 'true', 'https://cdn.tgdd.vn/Files/2020/05/05/1253631/cong-thuc-uop-suon-nuong-mat-ong-vua-thom-lai-mem-thit-ca-nha-deu-me-202005051435374859.jpg', 'true', 'C0005'),
('F00101', 'Sườn heo non', 65000, 'true', 'https://tongkhothitheo.vn/wp-content/uploads/2020/07/833754911616.png', 'true', 'C0005'),
('F00102', 'Ba rọi', 65000, 'true', 'http://cdn.tgdd.vn/Files/2017/04/14/972222/15-cach-uop-thit-nuong-ngon-dung-chuan-vi-nha-hang-tai-nha-202201071019267824.jpg', 'true', 'C0005'),
('F00103', 'Bắp bò', 65000, 'true', 'https://thucphamsachgiagoc.com/wp-content/uploads/2018/12/bap-bo-uc-cat-lat-600x450.jpg', 'true', 'C0005'),
('F00104', 'Bò tơ', 65000, 'true', 'https://statics.vinpearl.com/bo-to-tay-ninh-thumb_1631971024.jpg', 'true', 'C0005'),
('F00120', 'String', 10000, 'true', 'https://cdn.tgdd.vn/Products/Images/3226/76520/bhx/nuoc-tang-luc-sting-huong-dau-330ml-201909031559004919.jpg', 'true', 'C0006'),
('F00121', 'Coca', 11000, 'true', 'https://thegioidouong.net/wp-content/uploads/2021/06/coca-300ml-chai-nhua.jpg', 'true', 'C0006'),
('F00122', 'Fanta', 11000, 'true', 'https://cdn.tgdd.vn/Products/Images/2443/76453/bhx/nuoc-ngot-fanta-vi-cam-lon-330ml-201812281420358633.jpg', 'true', 'C0006'),
('F00123', 'Aquafina', 6000, 'true', 'https://minhcaumart.vn/media/com_eshop/products/8934588063053.jpg', 'true', 'C0006'),
('F00124', 'Cam twister', 11000, 'true', 'https://cdn.tgdd.vn/Products/Images/3265/79132/bhx/nuoc-ep-twister-cam-455ml-201901150946041620.jpg', 'true', 'C0006'),
('F00125', 'C2', 11000, 'true', 'https://cdn.tgdd.vn/Products/Images/8938/76562/bhx/tra-xanh-c2-huong-chanh-360ml-201912090949471802.jpg', 'true', 'C0006'),
('F00140', 'Tiger Nâu', 17000, 'true', 'https://cdn.tgdd.vn/Products/Images/2282/83563/bhx/bia-tiger-330ml-202012151339189979.jpg', 'true', 'C0007'),
('F00142', 'Tiger bạc', 16000, 'true', 'https://cdn.tgdd.vn/Products/Images/2282/77607/bhx/bia-tiger-crystal-330ml-202003281743435742.jpg', 'true', 'C0007'),
('F00143', 'Heineken', 18000, 'true', 'http://product.hstatic.net/200000419239/product/c77ab3fa04f548ddb5b6e633e6a405a1_15974fe16d8e4bf4a6d65a235eb43ab6_grande.jpg', 'true', 'C0007'),
('F00144', 'Sai Gòn Đỏ', 15000, 'true', 'https://cdn.tgdd.vn/Products/Images/2282/214411/bhx/bia-sai-gon-export-330ml-201911140836237362.jpg', 'true', 'C0007');

-- --------------------------------------------------------

--
-- Table structure for table `make_payments`
--

CREATE TABLE `make_payments` (
  `Pay_ID` varchar(50) NOT NULL,
  `Pay_date` datetime NOT NULL,
  `Price_total` double NOT NULL,
  `Emp_ID` varchar(50) NOT NULL,
  `Table_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `make_payments`
--

INSERT INTO `make_payments` (`Pay_ID`, `Pay_date`, `Price_total`, `Emp_ID`, `Table_ID`) VALUES
('PMOD-2045782089', '2022-11-01 10:47:50', 135000, 'E0002', 'T0001'),
('PMOD1352497779', '2022-11-10 16:13:17', 400000, 'E0001', 'T0003'),
('PMOD680776087', '2022-11-10 14:47:39', 245000, 'E0002', 'T0001'),
('PMOD850310776', '2022-11-01 10:48:53', 110000, 'E0002', 'T0001'),
('POD00001', '2022-10-25 11:36:54', 110000, 'E0001', 'T0001'),
('POD00002', '2022-10-25 17:36:54', 45000, 'E0001', 'T0003'),
('POD00003', '2022-10-25 18:00:54', 65000, 'E0001', 'T0004'),
('POD00004', '2022-10-25 20:00:54', 45000, 'E0001', 'T0006');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `Order_ID` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Table_ID` varchar(50) NOT NULL,
  `Food_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`Order_ID`, `Quantity`, `Table_ID`, `Food_ID`) VALUES
('OD-2045782089', 3, 'T0001', 'F00001'),
('OD00001', 1, 'T0001', 'F00001'),
('OD00001', 1, 'T0001', 'F00002'),
('OD00001', 1, 'T0001', 'F00040'),
('OD00001', 2, 'T0001', 'F00042'),
('OD00001', 2, 'T0001', 'F00100'),
('OD00002', 2, 'T0003', 'F00001'),
('OD00002', 1, 'T0003', 'F00021'),
('OD00003', 1, 'T0006', 'F00001'),
('OD00003', 1, 'T0006', 'F00144'),
('OD00004', 10, 'T0007', 'F00144'),
('OD1352497779', 4, 'T0003', 'F00001'),
('OD1352497779', 4, 'T0003', 'F00002'),
('OD680776087', 3, 'T0001', 'F00001'),
('OD680776087', 2, 'T0001', 'F00002'),
('OD850310776', 2, 'T0001', 'F00003');

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

CREATE TABLE `table` (
  `Table_ID` varchar(50) NOT NULL,
  `T_Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table`
--

INSERT INTO `table` (`Table_ID`, `T_Status`) VALUES
('T0001', 'true'),
('T0002', 'true'),
('T0003', 'true'),
('T0004', 'true'),
('T0005', 'true'),
('T0006', 'true'),
('T0007', 'true'),
('T0008', 'false'),
('T0009', 'true'),
('T0010', 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`Food_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Indexes for table `make_payments`
--
ALTER TABLE `make_payments`
  ADD PRIMARY KEY (`Pay_ID`),
  ADD KEY `Emp_ID` (`Emp_ID`,`Table_ID`),
  ADD KEY `Table_ID` (`Table_ID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`Order_ID`,`Food_ID`),
  ADD KEY `Table_ID` (`Table_ID`),
  ADD KEY `order_detail_ibfk_2` (`Food_ID`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`Table_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`);

--
-- Constraints for table `make_payments`
--
ALTER TABLE `make_payments`
  ADD CONSTRAINT `make_payments_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`),
  ADD CONSTRAINT `make_payments_ibfk_2` FOREIGN KEY (`Table_ID`) REFERENCES `table` (`Table_ID`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`Table_ID`) REFERENCES `table` (`Table_ID`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`Food_ID`) REFERENCES `foods` (`Food_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
