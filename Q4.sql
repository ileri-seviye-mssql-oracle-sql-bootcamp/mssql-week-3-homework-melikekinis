--4 - 01.02.2007 - 05.03.2014 tarihleri arasında hangi üründen kaç adet sipariş edildiğini bulan SQL kodunu yazınız.

SELECT 
	U.[urunAd] urun_adi, 
	SUM(D.adet) siparis_adedi  
FROM 
	[dbo].[tblUrun] U
INNER JOIN [dbo].[tblSiparisDetay] D 
	ON U.[urunKod] = D.[urunKod]
INNER JOIN [dbo].[tblSiparis] S 
	ON D.[faturaKod] = S.[faturaKod]
WHERE S.[siparisTarih] BETWEEN CAST('2007-02-01' AS date) AND CAST('2014-03-05' AS date)
GROUP BY U.[urunAd];