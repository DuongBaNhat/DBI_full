USE ASM2_FX09444
GO

--Tao bang luu log trigger
IF  NOT EXISTS (SELECT * FROM sys.tables where name = 'TRIGGER_LOG')
	BEGIN
		CREATE TABLE TRIGGER_LOG (
		TRIGGER_LOG_ID INT PRIMARY KEY IDENTITY(1,1),

		BAIBAO_ID VARCHAR(20) NOT NULL,
		BBO_TRANGTHAI BIT NOT NULL DEFAULT 'FALSE',
		BBO_NGAYVIET DATE NOT NULL,
		BBO_NGAYDANG DATE DEFAULT NULL,
		BBO_TEN NVARCHAR(255) NOT NULL,
		BBO_NOIDUNG NVARCHAR(MAX) NOT NULL,
		PHONGVIEN_ID VARCHAR(20) NOT NULL, 
		BIENTAPVIEN_ID VARCHAR(20) NOT NULL,
		CHUDE_ID VARCHAR(20) NOT NULL,

		LOG_NGAY DATE,
		LOG_LOAI VARCHAR(20) NOT NULL,
		CHECK(LOG_LOAI = 'deleted' OR LOG_LOAI = 'inserted')
		)
	END
GO

-- Tao trigger thuc hien hanh dong luu lich su sua, xoa vao bang TRIGGER_LOG
IF EXISTS(SELECT * FROM sys.triggers WHERE name = 'tr_baibao')
	DROP TRIGGER tr_baibao
GO

CREATE TRIGGER tr_baibao ON BAIBAO
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO TRIGGER_LOG
		SELECT 
				i.*, GETDATE(), 'inserted'
		FROM inserted as i
		UNION ALL
			SELECT 
				d.*, GETDATE(), 'deleted'
		FROM deleted as d
END
GO


--- Kiem tra hoat dong cua trigger -----------
IF EXISTS(SELECT * FROM BAIBAO WHERE BAIBAO_ID BETWEEN 'BBO016' AND 'BBO018')
	-- delete
	DELETE BAIBAO WHERE BAIBAO_ID BETWEEN 'BBO016' AND 'BBO018'
GO
 -- Insert
INSERT INTO BAIBAO
VALUES
('BBO016',1,'2022/02/15',GETDATE(),N'Pin mặt trời lập kỷ lục mới về hiệu suất',N'Các nhà khoa học Đức kết hợp hai loại vật liệu hấp thụ để phát triển pin mặt trời với hiệu suất chuyển đổi ánh sáng 24%. Nhóm nghiên cứu của giáo sư Thomas Riedl tại Đại học Wuppertal cùng các chuyên gia tại Viện Hóa Lý thuộc Đại học Cologne, Đại học Potsdam, Đại học Tübingen, viện nghiên cứu Helmholtz - Zentrum Berlin và viện nghiên cứu sắt Max-Planck, phát triển pin mặt trời xếp đôi đạt hiệu suất 24% - đo theo lượng photon được chuyển đổi thành điện.','PVN005','BTV002','CDE005'),
('BBO017',1,'2022/02/15',GETDATE(),N'Pin mặt trời lập kỷ lục mới về hiệu suất',N'Các nhà khoa học Đức kết hợp hai loại vật liệu hấp thụ để phát triển pin mặt trời với hiệu suất chuyển đổi ánh sáng 24%. Nhóm nghiên cứu của giáo sư Thomas Riedl tại Đại học Wuppertal cùng các chuyên gia tại Viện Hóa Lý thuộc Đại học Cologne, Đại học Potsdam, Đại học Tübingen, viện nghiên cứu Helmholtz - Zentrum Berlin và viện nghiên cứu sắt Max-Planck, phát triển pin mặt trời xếp đôi đạt hiệu suất 24% - đo theo lượng photon được chuyển đổi thành điện.','PVN005','BTV002','CDE005'),
('BBO018',0,'2022/02/15',NULL,N'Pin mặt trời lập kỷ lục mới về hiệu suất',N'Các nhà khoa học Đức kết hợp hai loại vật liệu hấp thụ để phát triển pin mặt trời với hiệu suất chuyển đổi ánh sáng 24%. Nhóm nghiên cứu của giáo sư Thomas Riedl tại Đại học Wuppertal cùng các chuyên gia tại Viện Hóa Lý thuộc Đại học Cologne, Đại học Potsdam, Đại học Tübingen, viện nghiên cứu Helmholtz - Zentrum Berlin và viện nghiên cứu sắt Max-Planck, phát triển pin mặt trời xếp đôi đạt hiệu suất 24% - đo theo lượng photon được chuyển đổi thành điện.','PVN005','BTV002','CDE005')
GO
SELECT * FROM TRIGGER_LOG
DELETE TRIGGER_LOG