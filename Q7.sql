--7-x numaralı ürünü en fazla sipariş veren şehri bulunuz.

SELECT 
	A.[Isim] 
FROM 
	(
		SELECT 
			SH.[Isim], 
			COUNT(*) siparis_sayisi, 
			DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rn
		FROM [dbo].[tblSiparisDetay] D
		INNER JOIN [dbo].[tblUrun] U 
			ON D.[urunKod] = U.[urunKod]
		INNER JOIN [dbo].[tblSiparis] S 
			ON S.[faturaKod] = D.[faturaKod]
		INNER JOIN [dbo].[tblKullanici] K 
			ON S.[kullaniciKod] = K.[kullaniciKod]
		INNER JOIN [dbo].[tblSehir] SH 
			ON SH.[Id] = K.[sehir]
		WHERE U.[urunKod] = 2626
		GROUP BY SH.[Isim]
	) A
where A.rn = 1