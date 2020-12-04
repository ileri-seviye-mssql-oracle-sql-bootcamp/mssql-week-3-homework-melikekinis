--8-Adı A ile başlayıp soyadında ak geçen müşterilerden en fazla sipariş vereni bulunuz.

SELECT 
	ad + ' ' + soyad AS musteri
FROM 
	(SELECT 
		S.kullaniciKod,
		K.[isim] ad,
		K.[soyad] soyad,
		COUNT(S.[kullaniciKod]) siparis_sayisi,
		DENSE_RANK() OVER (ORDER BY COUNT(S.kullaniciKod) DESC) rn
	FROM [dbo].[tblSiparis] S	
	INNER JOIN [dbo].[tblKullanici] K 
		ON K.[kullaniciKod] = S.[kullaniciKod]
	WHERE K.[isim] LIKE 'A%' 
		AND K.[soyad] LIKE '%AK%'
	GROUP BY S.[kullaniciKod], K.[isim], K.[soyad]
	) A
WHERE A.rn = 1;

--deneme