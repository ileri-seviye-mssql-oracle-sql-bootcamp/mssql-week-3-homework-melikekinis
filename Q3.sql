--3- Hiç sipariş vermeyen müşterilerin mesleklerini listeleyiniz.

SELECT 
	M.[meslek]
FROM 
	[dbo].[tblMeslek] M
INNER JOIN [dbo].[tblKullanici] K 
	ON M.[meslekKod] = K.[meslekKod]
WHERE K.[kullaniciKod] NOT IN 
	(SELECT 
		S.*, K.[kullaniciKod]
	FROM 
		[dbo].[tblKullanici] K
	INNER JOIN dbo.tblSiparis S 
		ON K.[kullaniciKod] = S.[kullaniciKod]
	);