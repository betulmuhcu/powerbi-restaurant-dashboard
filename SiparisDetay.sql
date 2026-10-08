select 
	s.SiparisNo,
	s.Tarih,
	sdu.SiparisDurumu,
	u.UrunAdi,
	u.Kategori,
	CASE
		WHEN ms.Konum is NULL Then 'Kasa'
		ELSE ms.Konum
	END AS Konum,
	m.Ad+' '+m.Soyad AS MusteriAdi,
	m.Cinsiyet,
	ms.MasaNo
FROM
	Siparisler s
	LEFT JOIN SiparisDetay sd ON s.SiparisID=sd.SiparisID
	LEFT JOIN Urunler u ON sd.UrunID=u.UrunID
	LEFT JOIN Musteriler m ON s.MusteriID=m.MusteriID
	LEFT JOIN SiparisDurumlari sdu ON s.SiparisDurumID=sdu.SiparisDurumID
	LEFT JOIN Masalar ms ON s.MasaID=ms.MasaID