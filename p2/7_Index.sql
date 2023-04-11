USE ASM2_FX09444
GO

IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'idx_nonclustered_ngaydang' )
	DROP INDEX idx_nonclustered_ngaydang ON BAIBAO
GO

-- Truy van truoc khi tao chi muc
SELECT BBO_NGAYDANG, BBO_TEN, BBO_NOIDUNG FROM BAIBAO ORDER BY BBO_NGAYDANG
GO

-- Tao chi muc dang non-clustered (logic)
CREATE NONCLUSTERED INDEX idx_nonclustered_ngaydang 
ON BAIBAO(BBO_NGAYDANG)
INCLUDE (BBO_TEN, BBO_NOIDUNG)
GO

-- Truy van sau khi tao chi muc
SELECT BBO_NGAYDANG, BBO_TEN, BBO_NOIDUNG FROM BAIBAO ORDER BY BBO_NGAYDANG
 GO

 -- -- Chon them chuc nang: include Actual Excution plan (ctrl + M) de so sanh cost ----