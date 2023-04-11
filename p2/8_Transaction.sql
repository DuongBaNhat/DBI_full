USE ASM2_FX09444
GO

-- Giao dich:
BEGIN TRANSACTION 
DECLARE @baibao_id VARCHAR(20) = 'BBO015';

EXECUTE dbo.sp_xoa_bai_bao @baibao_id; -- xoa bai bao  'BBO015'
IF @baibao_id BETWEEN 'BBO001' AND 'BBO015' -- neu trong khoang nay thi khong xoa
		ROLLBACK TRANSACTION;

COMMIT TRANSACTION -- neu khong thuoc khoang tren thi xoa
SELECT * FROM BAIBAO ORDER BY BAIBAO_ID