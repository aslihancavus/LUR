# Önhazırlık

[CASIA] B veritabanı kullanılacak. **Nasıl** temin edileceğine dair ayrıntı
[CASIA]'nın sayfasından erişilebilir.

Bu dizin altında ilgili veritabanıyla **arayüz** sağlanacak. Matlab ile kolay
işlenebilir forma dönüştürülecek.

IN:
	- `_db/casia/` veritabanını alır

OUT:
	- `_db/data.mat` üretir

## Nasıl

CASIA veritabanında üç seviyeli bir dizin yapısı kurulmuştur:

	personID/mm-seqID/viewAngle/fnm.png

burada

- `personID` (veya `subjectID`), `1-124` arasında değer almaktadır.

- `mm`, ya normal (`nm`), ya mont giymiş (`cl`) ya da çantası var (`bg`) şeklindedir

- `seqID`, `1-6` arası değer almaktadır

- `viewAngle`, `0-18-...-360` derece arası değerler almaktadır

- her bir alt durumdaki kare sayısı **farklılık** gösterir.

Örnek dosya yolu şöyledir,

	001/bg-01/000/001-bg-01-000-001.png

### Yaklaşım

`mm = nm & bg` ve `90 derece` durumuyla veriseti daraltılacak. `1` etiketi
normal durum için, `2` etiketi de çantalı durum için kullanılacak.

	personID/nm-seqID/090/fnm.png 	-> 1: uL
	personID/bg-seqID/090/fnm.png 	-> 2: L

Böylelikle saklanacak bilgi: `personID`, `seqID`, `frmID` ile sınırlanacaktır,
bu değerler ise `fnms` isminde bir hücrede tutulacak (dizi değil hücre),

	fnms{personID, seqID, frmID}

burada

- `personID`: 1-124

- `seqID`, `1-6`

- `frmID` ise değişkenlik gösterir.

Diğer taraftan normal veya çantalı durum bilgisi (etiketini) tutmak için de
`fnms` ile aynı boyutlu `etiket` hücresi kullanılacak,

	etiket{personID, seqID, frmID}

burada etiket değeri `1 - 2` (`uL - L`) değerini alır.

Bu iki hücre değişkeni `data.mat` olarak kaydedilir.

Bu ortak dosya isminden tam dosya ismine/yola geçmek için yardımcı
işlev tasarlanacaktır.

```octave
	function ffnm = fnm4video(personID, seqID, frmID, lbl)
	%
	% Usage:
	% 	ffnm = fnm4video(1,1,1,1); % ffnm = '001/nm-01/090/001-nm-01-090-001.png'
	% 	ffnm = fnm4video(1,1,1,2); % ffnm = '001/bg-01/090/001-bg-01-090-001.png'
```

<!-- kaynaklar -->

[CASIA]: 				https://github.com/19/asid/wiki/Casia
