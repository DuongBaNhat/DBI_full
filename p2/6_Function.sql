USE ASM2_FX09444
GO

-- 1. Ham kiem tra trang thai bai bao (ham scalar)
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'fc_trang_thai')
	DROP FUNCTION fc_trang_thai;
GO

CREATE FUNCTION fc_trang_thai(@baibao_id varchar(20))
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @ketqua NVARCHAR(50), @trangthai BIT;
	SELECT @trangthai = BBO_TRANGTHAI FROM BAIBAO WHERE BAIBAO_ID = @baibao_id;
	IF (@trangthai = 1)
		SET @ketqua = N'Bài báo đã đăng'
	ELSE IF (@trangthai = 0)
		SET @ketqua = N'Bài báo chưa được đăng'
	ELSE
		SET @ketqua = N'Không tìm thấy thông tin';
	RETURN @ketqua;
END
GO

-- 2. Ham thong ke phong vien theo luong (tra ve mot bang - inline)
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'fc_thongke_phongvien_theo_luong')
	DROP FUNCTION fc_thongke_phongvien_theo_luong
GO
CREATE FUNCTION fc_thongke_phongvien_theo_luong (@luong MONEY)
RETURNS TABLE
AS
	RETURN (SELECT * FROM PHONGVIEN WHERE PVN_LUONG >= @luong);
GO

-- 3. Ham thong ke nhung bai bao moi nhat (tra ve mot bang - co nhieu cau lenh)
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'fc_top_baibao')
	DROP FUNCTION fc_top_baibao
GO
CREATE FUNCTION fc_top_baibao (@top int)
RETURNS @toptbl TABLE
(BAIBAO_ID VARCHAR(20),  BBO_NGAYDANG DATE, BBO_TEN NVARCHAR(255), BBO_NOI NVARCHAR(MAX))
AS
BEGIN
	INSERT INTO @toptbl
	SELECT TOP (@top) B.BAIBAO_ID, B.BBO_NGAYDANG, B.BBO_TEN, B.BBO_NOIDUNG  FROM BAIBAO B
	WHERE B.BBO_TRANGTHAI = 1
	ORDER BY B.BBO_NGAYDANG DESC;
	RETURN;
END
GO

-- Su dung ham ---
SELECT dbo.fc_trang_thai ('BBO015') AS TRANG_THAI;

SELECT * FROM fc_thongke_phongvien_theo_luong (900) ORDER BY PVN_LUONG;

SELECT * FROM fc_top_baibao (5) 
GO
