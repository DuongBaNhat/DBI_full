USE ASM2_FX09444
GO

-- 1. Tao stored procedure xoa mot bai bao
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_xoa_bai_bao')
	DROP PROCEDURE sp_xoa_bai_bao
GO
CREATE PROCEDURE sp_xoa_bai_bao (@baibao_id VARCHAR(20))
AS
BEGIN
	DELETE FROM BAIBAO
	WHERE BAIBAO_ID = @baibao_id;
END
GO

-- 2. Tao stored procedure them mot bai bao
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_them_bai_bao')
	DROP PROCEDURE sp_them_bai_bao;
GO

CREATE PROCEDURE sp_them_bai_bao 
(@baibao_id VARCHAR(20), 
@bbo_ten NVARCHAR(255), @bbo_noidung NVARCHAR(MAX), 
@bbo_phongvien_id VARCHAR(20), @bbo_chude_id VARCHAR(20))
AS
BEGIN
	INSERT INTO BAIBAO
	(BAIBAO_ID, BBO_TRANGTHAI, BBO_NGAYVIET, BBO_NGAYDANG,
	BBO_TEN, BBO_NOIDUNG, PHONGVIEN_ID, BIENTAPVIEN_ID, CHUDE_ID)
	VALUES
	(@baibao_id, 0, GETDATE(), NULL, @bbo_ten, @bbo_noidung,
	@bbo_phongvien_id, (SELECT BIENTAPVIEN_ID FROM PHONGVIEN WHERE PHONGVIEN_ID = @bbo_phongvien_id), 
	@bbo_chude_id)
	
END
GO

-- 3. Tao stored procedure duyet mot bai bao
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_duyet')
	DROP PROCEDURE sp_duyet;
GO

CREATE PROCEDURE sp_duyet (@baibao_id VARCHAR(20))
AS
BEGIN
	UPDATE BAIBAO
	SET BBO_TRANGTHAI = 1, BBO_NGAYDANG = GETDATE()
	WHERE BAIBAO_ID = @baibao_id;
END
GO


-- -------- Su dung stored procedure ------
DECLARE @baibao_id  VARCHAR(20) = 'BBO100';

IF EXISTS (SELECT * FROM BAIBAO WHERE BAIBAO_ID = @baibao_id)
	EXECUTE sp_xoa_bai_bao @baibao_id
SELECT *, 'MOI_XOA' AS GHI_CHU FROM BAIBAO WHERE BAIBAO_ID = @baibao_id;

EXECUTE sp_them_bai_bao
'BBO100', N'Pin mặt trời lập kỷ lục mới về hiệu suất',N'Các nhà khoa học Đức kết hợp hai loại vật liệu hấp thụ để phát triển pin mặt trời với hiệu suất chuyển đổi ánh sáng 24%. Nhóm nghiên cứu của giáo sư Thomas Riedl tại Đại học Wuppertal cùng các chuyên gia tại Viện Hóa Lý thuộc Đại học Cologne, Đại học Potsdam, Đại học Tübingen, viện nghiên cứu Helmholtz - Zentrum Berlin và viện nghiên cứu sắt Max-Planck, phát triển pin mặt trời xếp đôi đạt hiệu suất 24% - đo theo lượng photon được chuyển đổi thành điện.','PVN005','CDE005'
SELECT *, 'MOI_THEM' AS GHI_CHU FROM BAIBAO WHERE BAIBAO_ID = @baibao_id;

EXECUTE sp_duyet @baibao_id;
SELECT *, 'MOI_DUYET' AS GHI_CHU FROM BAIBAO WHERE BAIBAO_ID = @baibao_id;