-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 22, 2023 lúc 02:07 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(40, 1, 6, 1, 'Essex EUP-123EA1', 230000000, '4c301f519e.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Piano', 1),
(4, 'Guitar', 1),
(5, 'Organ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-12-11 10:44:28.419660'),
(2, 'auth', '0001_initial', '2023-12-11 10:44:28.749057'),
(3, 'admin', '0001_initial', '2023-12-11 10:44:28.827264'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-12-11 10:44:28.827264'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-11 10:44:28.827264'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-12-11 10:44:28.874647'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-12-11 10:44:28.905882'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-12-11 10:44:28.905882'),
(9, 'auth', '0004_alter_user_username_opts', '2023-12-11 10:44:28.905882'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-12-11 10:44:28.939640'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-12-11 10:44:28.939640'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-12-11 10:44:28.939640'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-12-11 10:44:28.953149'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-12-11 10:44:28.968784'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-12-11 10:44:28.968784'),
(16, 'auth', '0011_update_proxy_permissions', '2023-12-11 10:44:28.968784'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-12-11 10:44:28.984408'),
(18, 'sessions', '0001_initial', '2023-12-11 10:44:29.000031');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(39, 31, '2021-12-07', '2021-12-07', 'Complete');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(36, 39, 7, 2, 3190000, 'GUITAR YAMAHA CX40', 'd3ac08c33e.jpg'),
(37, 39, 4, 1, 749000000, 'Boston GP-156', 'a30bcd79d7.jpg'),
(38, 39, 8, 3, 19000000, 'Taylor 114E', 'cb50eef0d8.jpg'),
(39, 39, 9, 4, 4200000, 'Takamine D2D', '758ded2800.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(2, 'Kohler & Campbell KIG50D', 233000000, 220000000, '95548b09b3.jpg', 1, '0000-00-00', 2, 96, 'Với kích thước linh hoạt, giúp người chơi dễ dàng bố trí phù hợp cho mọi không gian. Giờ đây, người chơi sẽ không còn lo ngại với diện tích không gian chật hẹp. Từ phòng khách, sảnh nhà hàng, khách sạn,.. hay bất cứ đâu Kohler & Campbell KiG50D sẽ góp phần làm nổi bật không gian thêm phần sang trọng.', 1, 4),
(3, 'Kawai ND-21', 90500000, 85000000, '8d2e8819d7.jpg', 1, '0000-00-00', 2, 9, 'Đàn Piano Kawai ND-21 hiện thân cho vẻ đẹp của một cây Piano Acoustic ở phân khúc giá rẻ. Khoác bên ngoài vẻ đẹp sang trọng của một cây đàn upright piano.', 1, 1),
(4, 'Boston GP-156', 749000000, 749000000, 'a30bcd79d7.jpg', 1, '0000-00-00', 2, 19, 'Đàn piano Boston là một thương hiệu con của hãng Piano lừng danh Steinway & Sons, mang cùng một tiêu chuẩn xuất sắc của tất cả các công cụ được thiết kế bởi hãng này. GP-156 PE được thừa hưởng những thiết kế ưu việt của thương hiệu Steinway, mang âm sắc cổ điện với thiết kế tinh tế, đẹp và hiện đại.', 1, 1),
(5, 'Kohler & Campbell J310B', 98000000, 90000000, '109cc07e03.jpg', 1, '0000-00-00', 2, 8, 'Công ty Công nghiệp Kohler & Campbell, Inc đã được thành lập vào năm 1896 tại New York bởi 2 nhà đồng thời sáng lập là Charles Kohler và John Campbell. Campbell là một thợ máy đã phát minh ra một số máy chế biến gỗ và sắt và sau đó đã áp dụng vào việc chế tạo đàn piano.', 1, 2),
(6, 'Essex EUP-123EA1', 230000000, 230000000, '4c301f519e.jpg', 1, '0000-00-00', 2, 7, 'Piano Essex EUP-123E nổi bật với phong cách cổ điển, sang trọng. Cây đàn được thiết kế bởi thương hiệu Steinway & Sons, phối hợp với nhà thiết kế đồ nội thất nổi tiếng William Faber tạo nên sự đẳng cấp, tinh tế của cây đàn.aah', 1, 3),
(7, 'GUITAR YAMAHA CX40', 3190000, 3190000, 'd3ac08c33e.jpg', 1, '2021-12-07', 4, 8, 'Đàn Classic Guitar Yamaha CX40', 1, 2),
(8, 'Taylor 114E', 19000000, 19000000, 'cb50eef0d8.jpg', 1, '2021-12-07', 4, 7, 'Đàn guitar Taylor 114E là một dòng sản phẩm acoustic thuộc dòng series 1 của taylor với thiết kế độc đáo đó chính là khớp nối cần đàn và sử dụng gỗ sitka spruce tạo âm thanh vô cùng trong trẻo, sống động, giúp người chơi có thể cảm nhận được tốt hơn và đây cũng là ưu điểm nổi bật tạo lên sự thành công cho thương hiệu Taylor.', 1, 3),
(9, 'Takamine D2D', 4200000, 4200000, '758ded2800.jpg', 1, '2021-12-07', 4, 6, 'Đàn guitar Takamine D2D là sản phẩm nổi bật của thương hiệu Takamine Nhật Bản và được rất nhiều tín đồ săn đón trong thời gian gần đây. Không những mang đến một thiết kế dáng đàn đẹp mắt, vừa vặn với mọi dáng người mà âm thanh tuyệt vời mà bạn không thể chê vào đâu được.', 1, 4),
(10, 'Takamine ED2DCNAT', 6350000, 6200000, '1dfd0eec5c.jpg', 1, '2021-12-07', 4, 10, 'Đàn guitar Takamine ED2DCNAT là một sản phẩm được thiết kế hoàn hảo đến từng chi tiết với mặt đàn được làm từ gỗ Spruce, mặt sau và hông đàn được làm từ gỗ Mahogany, cùng hệ thống điện tử khuếch đại âm thanh để truyền tải âm thanh đến cho người nghe một cách rõ ràng và chân thật nhất.\r\n\r\nChắc hẳn, đây chính là cây đàn guitar tuyệt vời dành riên cho bạn, bất kể bạn là người mới học hay là người chơi đàn guitar có nhiều kinh nghiệm.', 1, 0),
(11, 'TAYLOR 150E 12 String', 21100000, 21100000, '9bc38b3364.jpg', 1, '2021-12-07', 4, 10, 'Đàn Guitar Taylor 150E 12 String là cây đàn acoustic sở hữu 12 dây đàn đã tạo ra âm thanh tốt, chuẩn xác, thiết kế độc đáo, tinh tế cùng với việc cân bằng ánh sáng octave sắc nét đã tạo ra tông màu tươi sáng, tốt và rõ ràng. Đây chắc hẳn là những tính năng nổi bật đã tạo nên sự khác biệt trong các loại đàn khác.', 1, 0),
(12, 'TAYLOR 214CE DLX', 34700000, 34700000, 'e235fe0bc6.jpg', 1, '2021-12-07', 4, 10, 'Đàn guitar Taylor 214CE DLX sở hữu thiết kế độc đáo với đường nét trên cơ thể mượt mà mang đến âm thanh trung thực, giai điệu rõ ràng và sử dụng chất liệu gỗ rosewood đem lại giai điệu tuyệt vời trong một loại nhạc cụ tuyệt đẹp.', 1, 0),
(13, 'Roland BK-9', 31000000, 31000000, 'bf843e62a9.jpg', 1, '2021-12-07', 5, 20, 'Đàn organ Roland BK-9 là công cụ hàng đầu mới trong loạt dòng BK nổi tiếng, mang lại âm thanh giật gân, nhịp điệu hàng đầu, và một lựa chọn đáng kinh ngạc của các tính năng cao cấp. Bạn có một thế giới âm nhạc dưới sự kiểm soát của ngón tay, với một lựa chọn âm thanh tuyệt vời - bao gồm âm thanh SuperNATURAL nổi tiếng của Roland - và một loạt các giai điệu đệm hoàn toàn remastered trong gần như mọi thể loại âm nhạc, từ cổ điển đến hiện đại.', 1, 0),
(14, 'Roland E-A7', 29000000, 29000000, 'd1a3f61f87.jpg', 1, '2021-12-07', 5, 15, 'Đàn organ Roland E-A7 là cây đàn cao cấp dùng để biểu diễn hoặc đi show với hơn 1.500 âm sắc nhạc cụ đến từ khắp nơi trên thế giới, 156 nút chuyên dụng để truy cập tức thì vào chức năng cho hiệu suất trình diễn mạnh mẽ.', 1, 0),
(15, 'Roland FA-06', 29500000, 29500000, '8f40bd6405.jpg', 1, '2021-12-07', 5, 10, 'Đàn organ Roland FA-06 là một sản phẩm cao cấp đến từ Roland với âm thanh tốt và nhiều tính năng hấp dẫn hỗ trợ người sử dụng để trình diễn trên sân khấu một cách xuất sắc nhất. Ngoài ra với thiết kế nhỏ gọn nên dễ dàng mang đi di chuyển để biểu diễn mà không lo cồng kềnh hư hỏng.', 1, 0),
(16, 'Roland FA-08', 44300000, 44300000, 'a12f8914dc.jpg', 1, '2021-12-07', 5, 10, 'Đàn organ Roland FA-08 sở hữu đầy đủ chức năng của một Music Workstation với thiết kế chắc chắn, tính linh hoat cao cùng với hiệu ứng Studio chất lượng cao, điều khiển thời gian thực, hỗ trợ chức năng Sampling và phát lại âm thanh ngay lập tức từ 16 mặt pad có trang bị đèn tín hiệu.', 1, 0),
(17, 'Roland AXSYNTH', 25100000, 25100000, '422b3a5da2.jpg', 1, '2021-12-07', 5, 20, 'Đàn organ Roland AXSYNTH mang một phong cách mới của Roland, với việc sử dụng âm thanh mạnh mẽ, phong cách solo mới nhất của Roland và có thể đeo lên vai thực hiện phần trình diễn được hiệu quả hơn trên sân khấu.', 1, 0),
(18, 'Roland GAIA SH-01', 14300000, 14300000, 'c43d221a7b.jpg', 1, '2021-12-07', 5, 5, 'Đàn organ Roland GAIA SH-01 cung cấp cho bạn một tấn hiệu ứng (reverb, biến dạng, lông tơ, tai nạn bit, flanger, phaser, pitch shifter, tăng thấp và trì hoãn) để khám phá âm những giới hạn âm thanh tuyệt vời, với những nút tính năng điều chỉnh dễ dàng mang lại sự sáng tạo vô biên của người chơi khi sử dụng cây đàn organ này.', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `password`, `role_id`, `status`, `address`, `isConfirmed`) VALUES
(1, 'admin@gmail.com', 'Nguyễn Lập An Khương', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1),
(31, 'lapankhuongnguyen@gmail.com', 'khuong nguyen', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'CanTho', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
