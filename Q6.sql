--6-En fazla sipariş veren meslek grubunu bulunuz.

SELECT A.[meslek] 
	FROM 
		(SELECT 
			M.[meslek], 
			COUNT(M.[meslekKod]),
			DENSE_RANK() OVER (ORDER BY COUNT(M.[meslekKod]) DESC) en_fazla_siparis
		FROM 
			[dbo].[tblKullanici] K 
		INNER JOIN [dbo].[tblSiparis] S 
			ON K.[kullaniciKod] = S.[kullaniciKod]
		INNER JOIN [dbo].[tblMeslek] M
			ON M.[meslekKod] = K.[meslekKod]
		GROUP BY M.[meslek]
		) A 
WHERE en_fazla_siparis = 1;