USE ASM2_FX09444
GO

-- 1. Chen du lieu cho bang QUYENQUANLY
INSERT INTO QUYENQUANLY
VALUES
('QQL001',N'Tổng biên tập',1,1,1,1,1),
('QQL002',N'Phó tổng biên tập',1,1,0,1,1),
('QQL003',N'Biên tập viên',1,0,0,0,1);
GO

-- 2. Chen du lieu cho bang QUYEN
INSERT INTO QUYEN
VALUES
('QUN001',N'Biên tập viên',1,1,1,1,'QQL003'),
('QUN002',N'Phóng viên',1,1,1,1,NULL),
('QUN003',N'Cộng tác viên',1,1,0,0,NULL);
GO

-- 3. Chen du lieu cho bang BIENTAPBIEN
INSERT INTO BIENTAPVIEN
VALUES
('BTV001',N'Quang',N'asdw@gmail.com',N'mFAfGJHb',1200,'QUN001'),
('BTV002',N'Hưng',N'qwsa@outlook.com',N'AgjGBBaz',1235,'QUN001'),
('BTV003',N'Hưng',N'gred@gmail.com',N'm2WcPu7X',1800,'QUN001'),
('BTV004',N'Hào',N'dasa@yahoo.com',N'C2RHf3pX',1750,'QUN001'),
('BTV005',N'Mạnh',N'read@gmail.com',N'HJZ2FkdT',1483,'QUN001');
GO

-- 4. Chen du lieu cho bang PHONGVIEN
INSERT INTO PHONGVIEN
VALUES
('PVN001',N'Nhật',N'abc@gmail.com',N'BMEreWOS',463,'QUN002','BTV001'),
('PVN002',N'Hoàng',N'xyz@yahoo.com',N'qH5sCEZW',538,'QUN002','BTV001'),
('PVN003',N'Hải',N'qwe@outlook.com',N'C3AMjgKb',789,'QUN002','BTV002'),
('PVN004',N'Tuyền',N'rty@gmail.com',N'VuQN7M4k',987,'QUN002','BTV002'),
('PVN005',N'Bách',N'cvb@gmail.com',N'svE5jbQ9',683,'QUN002','BTV002'),
('PVN006',N'Nhung',N'nhg@gmail.com',N'yY25KKnb',999,'QUN002','BTV003'),
('PVN007',N'Tuấn',N'qaz@yahoo.com',N'eLjFpSny',588,'QUN002','BTV003'),
('PVN008',N'Hồng',N'rfv@gmail.com',N'aayarq3C',695,'QUN002','BTV003'),
('PVN009',N'Kim',N'edc@outlook.com',N'XCf82gb2',739,'QUN002','BTV004'),
('PVN010',N'Dung',N'yhn@gmail.com',N'eJvMgc8G',846,'QUN002','BTV004'),
('PVN011',N'Toản',N'poi@gmail.com',N'NQWu4Nsm',572,'QUN002','BTV004'),
('PVN012',N'Chung',N'mkj@icloud.com',N'tcRURhDn',600,'QUN002','BTV004'),
('PVN013',N'Hùng',N'lki@yahoo.com',N'B5DZqcHP',800,'QUN002','BTV004'),
('PVN014',N'Dũng',N'wes@outlook.com',N'56Va4HMv',900,'QUN002','BTV005'),
('PVN015',N'Tiên',N'rfd@gmail.com',N'YMkcrRRd',888,'QUN002','BTV005')
GO

-- 5. Chen du lieu cho bang CHUDE
INSERT INTO CHUDE
VALUES
('CDE001',N'Thời sự'),
('CDE002',N'Góc nhìn'),
('CDE003',N'Thế giới'),
('CDE004',N'Kinh doanh'),
('CDE005',N'Khoa học');
GO

-- 6. Chen du lieu cho bang BAIBAO
INSERT INTO BAIBAO
VALUES
('BBO001',1,'2022/04/11','2022/04/15',N'Trung du và miền núi Bắc Bộ sẽ hướng đến phát triển xanh',N'Tổng bí thư Nguyễn Phú Trọng nhấn mạnh, năm 2045 vùng trung du và miền núi Bắc Bộ sẽ là hình mẫu phát triển xanh của cả nước. Ngày 15/4, Bộ Chính trị, Ban Bí thư tổ chức hội nghị toàn quốc triển khai Nghị quyết về phương hướng phát triển kinh tế, xã hội, bảo đảm quốc phòng, an ninh vùng trung du miền núi Bắc Bộ đến năm 2030, tầm nhìn năm 2045.','PVN001','BTV001','CDE001'),
('BBO002',1,'2022/04/13','2022/04/15',N'Đối ngoại quốc phòng kiên định "bốn không"',N'Đường lối đối ngoại quốc phòng của Việt Nam giai đoạn hiện nay vẫn kiên định nguyên tắc "bốn không", theo thượng tướng Hoàng Xuân Chiến. Sáng 14/4, tại hội nghị tổng kết công tác đối ngoại quốc phòng giai đoạn 2016-2021, Thứ trưởng Quốc phòng Hoàng Xuân Chiến nhấn mạnh Việt Nam nhất quán đường lối đối ngoại độc lập, tự chủ, hòa bình, hữu nghị; đa phương hóa, đa dạng hóa. Đối ngoại quốc phòng tiếp tục nguyên tắc "bốn không" theo Sách trắng Quốc phòng Việt Nam năm 2019.','PVN001','BTV001','CDE001'),
('BBO003',1,'2022/04/12','2022/04/15',N'"Không để sản phẩm Việt bị nước ngoài đăng ký quyền sở hữu trí tuệ"',N'Tiến sĩ Nguyễn Viết Chức đề nghị tạo thuận lợi cho người làm ra sản phẩm đăng ký quyền sở hữu trí tuệ, tránh rơi vào tay nước ngoài. Góp ý dự thảo Luật sửa đổi, bổ sung một số điều của Luật sở hữu trí tuệ do Ban Thường trực Mặt trận Tổ quốc Việt Nam tổ chức ngày 12/4, tiến sĩ Nguyễn Viết Chức, Phó chủ nhiệm Hội đồng tư vấn Văn hóa - Xã hội, nêu thực trạng nhiều sản phẩm, hàng hóa của người Việt bị tổ chức, cá nhân nước ngoài đăng ký quyền sở hữu trí tuệ.','PVN001','BTV001','CDE001'),
('BBO004',0,'2022/02/12',NULL,N'Hoàn thiện cơ chế khuyến khích người dân tố giác cán bộ tham nhũng',N'Bộ Chính trị yêu cầu cấp ủy, tổ chức Đảng có cơ chế bảo vệ, khuyến khích người dân phản ánh, tố giác cán bộ, đảng viên tham nhũng, tiêu cực. Trong kết luận số 12 về tiếp tục tăng cường sự lãnh đạo của Đảng đối với công tác phòng, chống tham nhũng, tiêu cực mới ban hành, Bộ Chính trị đánh giá 5 năm qua, thể chế từng bước hoàn thiện. Việc phát hiện, xử lý tham nhũng được chỉ đạo quyết liệt; tham nhũng từng bước được kiềm chế, ngăn chặn.','PVN002','BTV001','CDE001'),
('BBO005',0,'2022/02/13',NULL,N'Nhiều chức danh lãnh đạo có thể được kéo dài tuổi nghỉ hưu',N'Cán bộ nữ là phó chủ tịch Mặt trận Tổ quốc Việt Nam, ủy viên Ủy ban Kiểm tra Trung ương được đề xuất bổ sung vào danh sách kéo dài tuổi nghỉ hưu. Bộ Nội vụ vừa gửi Bộ Tư pháp hồ sơ đề nghị thẩm định dự thảo Nghị định nghỉ hưu ở tuổi cao hơn đối với cán bộ, công chức giữ chức vụ lãnh đạo, quản lý.','PVN002','BTV001','CDE001'),
('BBO006',1,'2022/02/14','2022/04/02',N'Tiền vùi vào đất',N'Tôi nhận được cuộc gọi từ số máy lạ ở Việt Nam, hỏi mua căn nhà cũ của tôi nằm xa trung tâm Hà Nội, nhưng gần vài dự án lớn đang được quy hoạch. Từ sau Tết, tần suất các cuộc gọi ngày càng dày. Có lần tôi hỏi đầu dây bên kia xem ai là người mua. Câu trả lời là: rất nhiều người săn lùng những căn nhà ở vị trí đắc địa. Tiền không phải vấn đề, họ thanh toán lập tức, và họ mua để đó hoặc cho thuê lại.','PVN002','BTV001','CDE002'),
('BBO007',1,'2022/02/15','2022/04/03',N'30 ngày hồi sinh',N'Chúng tôi coi 15/3/2022 là ngày hồi sinh ngành du lịch Việt Nam, cứu sống hàng chục nghìn doanh nghiệp, hàng chục triệu lao động. Ngành kinh tế tổng hợp đóng góp trực tiếp 10,4% GDP cả nước chưa bao giờ bi đát như trong hai năm qua.','PVN002','BTV001','CDE002'),
('BBO008',1,'2022/02/16','2022/04/04',N'Bảo vệ hay trừng phạt?',N'“Đây là toà nhà cao nhất Hàn Quốc và cao thứ sáu thế giới. Với các công trình như tòa tháp này, tập đoàn Lotte và các doanh nghiệp hàng đầu Hàn Quốc mang lại cho chúng tôi những xúc cảm pha trộn: Tự hào với những công trình và doanh nghiệp tầm cỡ thế giới, nhưng xấu hổ vì tham nhũng vẫn dai dẳng ở thượng tầng”.','PVN002','BTV001','CDE002'),
('BBO009',0,'2022/02/17',NULL,N'Thành viên NATO đắp chiếu toàn bộ tiêm kích MiG-21',N'Romania dừng bay toàn bộ tiêm kích MiG-21 do tỷ lệ tai nạn cao, đồng thời đẩy nhanh kế hoạch mua F-16 đã qua sử dụng của Na Uy. Bộ Quốc phòng Romania ngày 15/4 thông báo sẽ tiếp tục vận hành phi đội F-16 sau khi dừng bay tiêm kích MiG-21, trong khi các nước thành viên NATO khác điều máy bay tới quốc gia Đông Âu để thực hiện nhiệm vụ kiểm soát trên không trong nỗ lực củng cố sườn đông liên minh.','PVN003','BTV002','CDE003'),
('BBO010',0,'2022/02/18',NULL,N'Soái hạm Moskva - biểu tượng bị đánh mất của hải quân Nga',N'Soái hạm Moskva bị chìm không chỉ ảnh hưởng đến năng lực tác chiến ở Biển Đen, mà còn là tổn thất lớn về mặt biểu tượng của hải quân Nga. Bộ Quốc phòng Nga hôm 14/4 cho biết tàu tuần dương mang tên lửa dẫn đường Moskva, soái hạm của Hạm đội Biển Đen, bị chìm khi đang được kéo về cảng sau sự cố cháy nổ ngoài khơi Ukraine. Sự kiện này được coi là tổn thất nặng nề với Nga cả về mặt tác chiến và hình ảnh, khi chiến hạm Moskva được coi là một trong những biểu tượng quan trọng nhất của hải quân Nga hiện nay.','PVN003','BTV002','CDE003'),
('BBO011',1,'2022/02/15','2022/04/03',N'Tiêm kích Nhật xuất kích hơn 1.000 lần ứng phó máy bay Nga, Trung',N'Tiêm kích Nhật xuất kích 1.004 lần trong năm qua để ứng phó máy bay quân sự Nga, Trung Quốc, mức cao thứ hai từ khi công bố dữ liệu.Số liệu trên được Bộ Quốc phòng Nhật Bản ghi nhận trong năm tài khóa 2021, kết thúc hồi tháng 3, và công bố ngày 15/4. Đây là số lần xuất kích cao thứ hai từ khi Nhật Bản công bố dữ liệu từ năm 1958, con số cao nhất được ghi nhận năm tài khóa 2016 với 1.168 lần.','PVN003','BTV002','CDE003'),
('BBO012',1,'2022/02/16','2022/04/04',N'Nga công bố video tấn công nhà máy tên lửa ở Kiev',N'Quân đội Nga đăng video tập kích nhà máy tên lửa phòng không và chống hạm ở ngoại ô Kiev, cảnh báo sẽ tăng cường đánh phá thủ đô Ukraine. "Các tên lửa hành trình tầm xa Kalibr đã đánh trúng cơ sở quân sự ở ngoại ô Kiev đêm qua. Đòn tấn công phá hủy hoàn toàn Nhà máy chế tạo máy Vizar, nơi sản xuất và sửa chữa tên lửa phòng không tầm trung và tầm xa, cũng như tên lửa chống hạm cho quân đội Ukraine", phát ngôn viên Bộ Quốc phòng Nga Igor Konashenkov cho biết hôm nay.','PVN003','BTV002','CDE003'),
('BBO013',1,'2022/02/17','2022/04/05',N'Sếp nhà thuốc Long Châu: "Không đốt tiền mở cửa hàng ồ ạt"',N'Bà Nguyễn Bạch Điệp, người điều hành Long Châu cho biết, chuỗi này không chạy đua mở điểm bán ồ ạt mà luôn cân bằng giữ tăng độ phủ với hiệu quả kinh doanh. Bà Điệp hiện là Chủ tịch Công ty cổ phần Bán lẻ kỹ thuật số FPT (FPT Retail), đồng thời giữ chức Chủ tịch Công ty cổ phần Dược phẩm FPT Long Châu.','PVN003','BTV002','CDE004'),
('BBO014',0,'2022/02/18',NULL,N'Các siêu thị không bán kẹo trứng Kinder trong diện thu hồi',N'Các siêu thị cho biết kẹo trứng bán trên thị trường được sản xuất từ Ấn Độ và Italy, không liên quan tới những sản phẩm xuất xứ từ Bỉ đang được đề nghị thu hồi. Bộ Công Thương vừa đề nghị các nhà phân phối bán lẻ rà soát, thu hồi một số dòng sản phẩm kẹo trứng chocolate nhãn hiệu Kinder của Công ty Ferrero sản xuất tại Bỉ có khả năng bị nhiễm khuẩn samonella và đang được nhà sản xuất thông báo thu hồi.','PVN004','BTV002','CDE004'),
('BBO015',0,'2022/02/15',NULL,N'Pin mặt trời lập kỷ lục mới về hiệu suất',N'Các nhà khoa học Đức kết hợp hai loại vật liệu hấp thụ để phát triển pin mặt trời với hiệu suất chuyển đổi ánh sáng 24%. Nhóm nghiên cứu của giáo sư Thomas Riedl tại Đại học Wuppertal cùng các chuyên gia tại Viện Hóa Lý thuộc Đại học Cologne, Đại học Potsdam, Đại học Tübingen, viện nghiên cứu Helmholtz - Zentrum Berlin và viện nghiên cứu sắt Max-Planck, phát triển pin mặt trời xếp đôi đạt hiệu suất 24% - đo theo lượng photon được chuyển đổi thành điện.','PVN005','BTV002','CDE005');

GO