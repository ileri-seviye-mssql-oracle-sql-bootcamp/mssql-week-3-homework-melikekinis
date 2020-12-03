--5-İptal edilen siparişlerde bulunan ürünleri listeyiniz.

SELECT 
	U.[urunAd] iptal_edilen_urunler
FROM 
	[dbo].[tblSiparis] S
INNER JOIN [dbo].[tblSiparisDurum] SD
	ON S.[siparisDurumKod] = SD.[siparisDurumKod]
INNER JOIN [dbo].[tblSiparisDetay] D
	ON S.[faturaKod] = D.[faturaKod]
INNER JOIN [dbo].[tblUrun] u
	ON U.[urunKod] = D.[urunKod]
WHERE SD.[aciklama] LIKE '%ptal Edildi%';