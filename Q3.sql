--3- Hiç sipariş vermeyen müşterilerin mesleklerini listeleyiniz.

SELECT 
	M.[meslek]
FROM 
	[dbo].[tblMeslek] M
INNER JOIN [dbo].[tblKullanici] K 
	ON M.[meslekKod] = K.[meslekKod]
WHERE K.[kullaniciKod] NOT IN
	(SELECT 
		K.[kullaniciKod]
	FROM 
		[dbo].[tblKullanici] K
	INNER JOIN dbo.tblSiparis S 
		ON K.[kullaniciKod] = S.[kullaniciKod]
	);
	
--- ya da ----

SELECT 
	M.[meslek]
FROM 
	[dbo].[tblMeslek] M
INNER JOIN [dbo].[tblKullanici] K 
	ON M.[meslekKod] = K.[meslekKod]
WHERE K.[kullaniciKod] = (
						SELECT 
							K.[kullaniciKod]  
						FROM 
							[dbo].[tblKullanici] K
						WHERE NOT EXISTS (
										SELECT 1 
										FROM 
											[dbo].[tblSiparis] S
										WHERE S.[kullaniciKod] = K.[kullaniciKod] --11365
										 )
						 );

