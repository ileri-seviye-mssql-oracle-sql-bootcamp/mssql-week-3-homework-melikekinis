--2-En yüksek toplam fiyata sahip faturaya dahil ürünleri ve faturayı sipariş veren müşterinin adını soyadını listeyen SQL kodunu yazınız.

SELECT 
	DISTINCT U.[urunAd] urun_adi, 
	K.[isim] + ' ' + K.[soyad] musteri
FROM 
	[dbo].[tblSiparis] S
INNER JOIN [tblSiparisDetay] D 
	ON S.[faturaKod] = D.[faturaKod]
INNER JOIN [dbo].[tblUrun] U 
	ON D.[urunKod] = U.[urunKod]
INNER JOIN [dbo].[tblKullanici] K 
	ON S.[kullaniciKod] = K.[kullaniciKod]
WHERE S.[faturaKod] = (
					SELECT 
						S.[faturaKod]
					FROM (
							SELECT 
								S.*, 
								DENSE_RANK() OVER(ORDER BY toplam DESC) AS rn 
							FROM 
								[dbo].[tblSiparis] S
						 ) S
					WHERE rn = 1
					);