--1-Ürünlerin ürün adı, ürün kodunu ve KDV dahil satış fiyatını listeleyiniz.

SELECT 
	U.[urunAd] urun_adi, 
	U.[urunKod] urun_kodu, 
	S.[toplam] satis_fiyati
FROM 
	[dbo].[tblSiparisDetay] S
INNER JOIN [dbo].[tblUrun] U ON S.[urunKod] = U.[urunKod];