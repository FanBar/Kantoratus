truncate table [KFOLD_website].[SheetMusics]
declare @ChapterId int
declare @SubChapterId int

-- VERSES ÉNEKEK
set @ChapterId = (select Id from [KFOLD_website].[Chapters] where Name = 'VERSES ÉNEKEK')

-- ADVENT–KARÁCSONY
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'ADVENT–KARÁCSONY' and ChapterId = @ChapterId)

-- 1 Jó a teremtés
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'1', 
		'Jó a teremtés', 
		@SubChapterId, 
		'
			¶1. Jó a teremtés!\Csodálatos mennyég!\Megváltott lelkeknek szent kara!\Elhagyva földünk\Sok szép országát\A mennybe hív a glória.§
			¶2. Új korok jönnek,\idők majd betelnek,\új meg új nemzedék sarjad föl:\mennyei szózat\el sose hallgat\már itt felzeng a lelkünkből.§
			¶3. Angyalok kezdték,\pásztoroknak zengték,\lélektől lélekig ért a szó:\béke a földön!\Örvendezz, ember,\megszületett a Megváltó!§
		',
		'Dánia / Németország',
		'Szöveg: Bernhard Severin Ingemann (1789–1862), fordította Pap Kinga Marjatta (PR 2 047)',
		'Dallam: Glatz grófság (Szilézia) 1842 előtt (EÉ 371 Felséges Jézus)',
		'Dejlig er jorden'
)

-- 2 Halljátok: ő a nagy Tanácsos
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'2', 
		'Halljátok: ő a nagy Tanácsos', 
		@SubChapterId, 
		'	
			¶Halljátok: ő a nagy Tanácsos.\Halljátok: sok csodával páros.\Halljátok: nincs erősebb nála,\Istené a hála, béke tőle jő.\§
			¶*Alternatív szövegváltozat gyermekeknek:/*\Meglátod: ő a nagy Tanácsos.\Meglátod: sok csodával páros.\Meglátod: nincs erősebb nála,\Istené a hála, béke tőle jő.\§
		',
		'Dánia / Németország',
		'Szöveg: Bernhard Severin Ingemann (1789–1862), fordította Pap Kinga Marjatta (PR 2 047)',
		'Dallam: Glatz grófság (Szilézia) 1842 előtt (EÉ 371 Felséges Jézus)',
		'Seu nome Maravilhoso'
)

-- 3 Paradicsom mezejibe
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'3', 
		'Paradicsom mezejibe', 
		@SubChapterId, 
		'	
			¶1. Paradicsom mezejibe\Aranyszőnyeg leterítve,\Azon vagyon rengő bölcső,\Abba’ fekszik az Úr Jézus§
			¶2. Jobb kezibe’ aranyalma,\bal kezibe’ aranyvessző,\megzúgítá a vesszejét,\zúg az erdő, cseng a mező.§
			¶3. Én nem láték szebb termőfát,\mint Úr Jézus keresztfáját,\mert az vérrel virágozik,\Szentlélekkel gyümölcsözik.§
		',
		'Magyarország',
		'Szöveg: népi gyűjtés',
		'Dallam: német korál moldvai változata (PR 2 048)',
		NULL
)

-- BÖJT
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'BÖJT' and ChapterId = @ChapterId)

-- 4a Friss erővel támad, megered a mag
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'4a', 
		'Friss erővel támad, megered a mag', 
		@SubChapterId, 
		'	
			¶1. Friss erővel támad, megered a mag,\földnek rejtekéből végre kisarjad.\Életre kel, ki holtak között járt:\termő szeretet legyőz ma bűnt, halált.§
			¶2. Ott feküdt a sírban, testét megtörték,\így nem viszi véghez megváltó tettét...\Földben pihent, mint elvetett mag, várt:\termő szeretet legyőz ma bűnt, halált.§
			¶3. Harmadnapra fölkelt élő Jézusunk,\sírját hátrahagyta megváltó Urunk.\Jézus az Úr, nem rejti el arcát:\termő szeretet legyőz ma bűnt, halált.§
			¶4. Lelkünk téli táján zúzmarás a szív,\Jézus érintése új életre hív.\Hol nincs remény, csak belső pusztaság:\termő szeretet legyőz ma bűnt, halált.§
		',
		'Anglia / Franciaország',
		'Szöveg: John Macleod Campbell Crum (1872–1958), fordította PKM',
		'Dallam: A. XIV. századi francia dallam (Noël nouvelet), B. Marcel Dupré változata (Variations sur noël 1922; EÉ169)',
		'Now the green blade riseth'
)

-- 4b Friss erővel támad, megered a mag
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'4b', 
		'Friss erővel támad, megered a mag', 
		@SubChapterId, 
		'	
			¶*Alternatív szövegjavaslat az EÉ 169 dallamváltozathoz/*§
			¶1. Friss erővel támad, megered a mag,\földnek rejtekéből végre kisarjad.\Új életre kel, ki holtak között járt:\termő szeretet legyőz ma bűnt, halált.\Friss erővel támad, megered a mag,\földnek rejtekéből végre kisarjad.§
			¶2. Ott feküdt a sírban, testét megtörték,\úgy hitték: nem végzi megváltó tettét.\Mélyben elpihent, mint elvetett mag, várt:\termő szeretet legyőz ma bűnt, halált.\Ott feküdt a sírban, testét megtörték,\úgy hitték: nem végzi megváltó tettét.§
			¶3. Harmadnapra fölkelt élő Jézusunk,\sírját hátrahagyta megváltó Urunk.\Jézus jelen van, nem rejti el arcát:\termő szeretet legyőz ma bűnt, halált.\Harmadnapra fölkelt élő Jézusunk,\sírját hátrahagyta megváltó Urunk.§
			¶4. Lelkünk téli táján zúzmarás a szív,\Jézus érintése új életre hív.\Ott, hol nincs remény, csak belső pusztaság:\termő szeretet legyőz ma bűnt, halált.\Lelkünk téli táján zúzmarás a szív,\Jézus érintése új életre hív.§
		',
		'Anglia',
		'Szöveg: John Macleod Campbell Crum (1872–1958), fordította PKM',
		'Dallam: A. XIV. századi francia dallam (Noël nouvelet), B. Marcel Dupré változata (Variations sur noël 1922; EÉ169)',
		'Now the green blade riseth'
)

-- 5 Ki érti meg kegyelmét
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'5', 
		'Ki érti meg kegyelmét', 
		@SubChapterId, 
		'	
			¶1. Ki érti meg kegyelmét\mit elnyert fenn a fán\felmérhetetlen áron\a véres Golgotán?\De erő tőle árad,\ő az örök forrás,\az üdvösség kútjából\élethozó áldás.§
			¶2. Fiát adta az Isten,\őt tette emberré,\ki Atyja szándékából\lett összetört testté.\Nevét felmagasztalják,\övé a dicsőség –\ki a halált legyőzte,\őérte élünk még.§
		',
		'Észtország',
		'Szöveg: Evelin Kõrvits (1972–), fordította PKM',
		'Dallam: Samuel Sebastian Wesley (1810–1876), ad notam Az egyháznak az Jézus a fundámentuma ÚjRÉ 590',
		'Kes suudaks mõista armu'
)

-- 6 Uram, közel voltam hozzád
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'6', 
		'Uram, közel voltam hozzád', 
		@SubChapterId, 
		'	
			¶1. Uram, közel voltam hozzád, mégis elszakadtam.\Megvallatták hűségemet, neved megtagadtam.\Halálodnak harmadnapján vádolnak a fények,\Halálodnak harmadnapján sírva hajtok térdet.§
			¶2. Uram, kerestelek téged, céltalan futottam:\Csak magamig, másokig, majd sírodig jutottam.\Halálodnak harmadnapján megszűnik az átok,\Halálodnak harmadnapján szívem megtalálod.§
			¶3. Uram, taníts hinni benned, várni új csodára,\Tedd életem hűségessé, legyen szavam hála!\Halálodnak harmadnapján zendülnek a fények,\Halálodnak harmadnapján én is áldlak téged!§
		',
		'Magyarország',
		'Szöveg: Kádár Ferenc (1926–2010)',
		'Dallam: Berkesi Sándor (1944–)',
		NULL
)

-- 7 Mennyi vétek itt e földön
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'7', 
		'Mennyi vétek itt e földön', 
		@SubChapterId, 
		'	
			¶1. Mennyi vé*tek/* itt e *föl/*dön, kereszt ter*hét/* hordozod.\Minden ál*munk/* össze*tör/*ve: mégis te *fel/*oldozod.\Refrén: Kedvesem, ó, szívem–lelkem, melyik út visz tehozzád?\Kelyhét it*tad/* szenve*dés/*nek, s nékünk nyitva a mennyország.§
			¶2. Sír a kert *is/*, az o*laj/*fa gyászolja a halott Urat.\Jeruzsá*lem/* város*á/*ban minden hívő téged sirat.\Kedvesem, ó, szívem–lelkem, melyik út visz tehozzád?\Kelyhét it*tad/* szenve*dés/*nek, s nékünk nyitva a mennyország.§
			¶[3. Hol a gyógy*ír/* ennyi kínra, szívem bújára lesz vigasz?\Sok-sok hang*on/* zeng az *é/*nek tettedért, *Vi/*lágigaz.\Kedvesem, ó, szívem–lelkem, melyik út visz tehozzád?\Kelyhét it*tad/* szenve*dés/*nek, s nékünk nyitva a mennyország.§
			¶4. Bármit kí*nál/*nék is néked, teljes é*le/*tem kevés.\Hálát ad*nék/*, míg csak *é/*lek – az sem len*ne/* most elég.\Kedvesem, ó, szívem–lelkem, melyik út visz tehozzád?\Kelyhét it*tad/* szenve*dés/*nek, s nékünk nyitva a mennyország.]§
		',
		'Libanon',
		'Szöveg: Jubrail Gabbour.',
		'Dallam: hagyományos arab dallam.',
		'Ayyuhal masslubu zulman'
)

-- HÚSVÉT
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'HÚSVÉT' and ChapterId = @ChapterId)

-- 8 Mfurahini, aleluya
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'8', 
		'Mfurahini, aleluya', 
		@SubChapterId, 
		'	
			¶1. Feltámadt Jézus, halleluja.\Örvendjen népe, halleluja.\Megváltónk él, legyőzte a sírt,\Visszhangozzátok most a jó hírt:\Refrén: Örvendjünk, vigadjunk, élő Úr ő! Harmadnap feltámadt, gördült a kő!\Halálon győzött, halleluja: Megváltónk él, mindenek Ura.§
			¶2. Feltámadt Jézus, jöjj, és dicsérd,\Halleluja, imádd szent nevét!\Ördögnek tőre kettétörött:\Krisztus legyőzte, imádjuk őt!\Refrén: Örvendjünk, vigadjunk, élő Úr ő! Harmadnap feltámadt, gördült a kő!\Halálon győzött, halleluja: Megváltónk él, mindenek Ura.§
			¶3. Így szólt az angyal: „Ne féljetek!\Tudom, hogy Jézust keresitek.\Üres a sírja, örökre él”,\Jézus feltámadt mindenkiért.\Refrén: Örvendjünk, vigadjunk, élő Úr ő! Harmadnap feltámadt, gördült a kő!\Halálon győzött, halleluja: Megváltónk él, mindenek Ura.§
			¶4. Zengjen az ének: Krisztusunk él!\Önmagát adta mindnyájunkért.\Vérén megváltott emberfia:\szívedből zengjen halleluja!\Refrén: Örvendjünk, vigadjunk, élő Úr ő! Harmadnap feltámadt, gördült a kő!\Halálon győzött, halleluja: Megváltónk él, mindenek Ura.§
		',
		'Tanzánia',
		'Szöveg: Bernard Kyamanywa (1938–), fordította Fábi Bálint és Pap Kinga Marjatta',
		'Dallam: hagyományos egyházi dallam haja népi változata',
		'Mfurahini, haleluya'
)

-- 9 Az életért
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	OriginalTitle) 
values 
(
		'9', 
		'Az életért', 
		@SubChapterId, 
		'	
			¶1. Az életért felfénylik az igazság.\Az életért kisarjad a remény.\Az életért lesz út és világosság:\ha végre lépni mersz – az életért.§
			¶2. Az életért vetik be a mezőket.\Az életért terem még zöld vetés.\Az életért jusson az éhezőnek:\csak így miénk a föld – az életért.§
			¶3. Az életért a gyenge is kiállhat.\Az életért a küzdő célhoz ér.\Az életért öröm forrása árad:\ép lesz a tört világ – az életért.§
			¶4. Az életért, hogy Isten gyermekké lett.\Az életünkért élt, és halt halált.\Egy életért az üdvösség miénk lett:\sugározzuk tovább – az életért.§
		',
		'Svédország',
		'Szöveg és dallam: Per Harling (1948–), fordította PKM',
		'För livets skull'
)

-- ÚRVACSORA
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'ÚRVACSORA' and ChapterId = @ChapterId)

-- 10 Közös az asztal és közös a kenyér
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'10', 
		'Közös az asztal és közös a kenyér', 
		@SubChapterId, 
		'	
			¶1. Közös az asztal és közös a kenyér,\megtörik úgy, mint Krisztusnak teste:\kenyérben, borban, kenyérben, borban\bennünk van elrejtve Isten országa\Krisztus köztünk.§\
			¶2. Közös az asztal és közös a teher,\életnek terhe, tegnapnak árnya,\holnapnak gondja, holnapnak gondja –\bennünk van elrejtve Isten országa,\Krisztus köztünk.§
			¶3. Közös az asztal és közös az öröm,\életnek fénye, világossága,\bátor reménye, bátor reménye-–\bennünk van elrejtve Isten országa,\Krisztus köztünk.§
			¶4. Közös az asztal és közös az egész:\hordozzuk együtt életnek súlyát\tegnapnak gondját, holnap reményét –\így lesz majd teljessé Isten országa,\Krisztus köztünk.§
		',
		'Finnország',
		'Szöveg: Pirjo Vahtola (1950–), fordította PKM',
		'Dallam: Erkki Tuppurainen (1945–)',
		'Saapua yhteiseen pöytään ja jakaa'
)

-- 11 Te kezedből vesszük, Isten
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	OriginalTitle) 
values 
(
		'11', 
		'Te kezedből vesszük, Isten', 
		@SubChapterId, 
		'	
			¶Refrén: Te kezedből vesszük, Isten, a bocsánat asztalát:\öröm ér, vagy kínoz bánat, azt is néked adjuk át.\1. Mint a búzamag beérik, győztes élet hatja át,\a mi életünk tiéd lesz, ha tested formálja át. Refrén§
			¶2. Szőlőszem a prés alá megy,\csak így lesz belőle bor,\e világnak minden terhét\Krisztus hordta el egykor.\Te kezedből vesszük, Isten, a bocsánat asztalát:\öröm ér, vagy kínoz bánat, azt is néked adjuk át.§
			¶3. Borban és kenyérben egyek\a tiéid, Istenünk –\így szolgálhat együtt Néked\a mi teljes életünk.\Te kezedből vesszük, Isten, a bocsánat asztalát:\öröm ér, vagy kínoz bánat, azt is néked adjuk át.§
			¶4. Szabadságra vágyik Földünk,\ami él, Te élteted:\ajándékodért könyörgünk,\adj megújult életet!\Te kezedből vesszük, Isten, a bocsánat asztalát:\öröm ér, vagy kínoz bánat, azt is néked adjuk át.§
			¶5. Dicsőség a szent Atyának,\Fiúnak, ki Megváltó,\és az Isten Szentlelkének,\kitől árad minden jó.\Te kezedből vesszük, Isten, a bocsánat asztalát:\öröm ér, vagy kínoz bánat, azt is néked adjuk át.§
		',
		'Nicaragua',
		'Szöveg és dallam: Manuel Davíla (1924–2014), fordította PKM',
		'Te ofrecemos, Padre nuestro'
)

-- EGYHÁZ, IMÁDSÁG, HITVALLÁS
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'EGYHÁZ, IMÁDSÁG, HITVALLÁS' and ChapterId = @ChapterId)

-- 12 Egy ház, mely nyitva áll
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	OriginalTitle) 
values 
(
		'12', 
		'Egy ház, mely nyitva áll', 
		@SubChapterId, 
		'	
			¶1. Egy ház, mely nyitva áll:\lépj be és érezd: téged vár.\Nem csak kő: teste, lelke van:\el nem suhan,\egy biztos pont talán –\egy ház, hol Isten lelke megtalál.§
			¶2. Egy ház, mely nyitva áll:\lépj be és érezd: téged vár.\Benne az Isten lép közel,\karja ölel,\ha szíved nem remél,\ő nem hagy el, minden nap elkísér.§
			¶3. Egy ház, mely nyitva áll:\lépj be és érezd: téged vár.\Befogad újra, hogyha vonz\a biztos pont,\mit elfeledtél rég:\az ajtó nyitva, tégy egy próbát még.§
			¶4. Egy ház, mely nyitva áll:\akkor is, hogyha nem talál\hozzád a szó, ma nem hat el,\még ne add fel,\mert megszólít talán\egy morzsaszó az Isten asztalán.§
			¶5. Egy ház, mely nyitva áll:\maradj velünk, új élet vár.\Sírhatsz itt bátran könnyeket,\Isten vezet,\magához ő emel:\a hit magvát szívedbe hinti el.§
			¶6. Egy ház, mely nyitva áll:\lépj be és érezd: téged vár.\Együtt vagyunk itt, emberek,\(s) a szeretet\átível mindenen,\mit ember művel másik emberen.§
			¶7. Egyház: szent földön állsz,\nem dől a templom, biztos ház,\mikor az élet terhe sok,\most már tudod:\ha megnyitod magad,\az Úr és népe itt van, s elfogad.§
		',
		'Dánia',
		'Szöveg és dallam: Janne Mark (1973–), fordította PKM',
		'Et hus at komme til'
)

-- 13 Kenyérrel táplálj még ma, Urunk
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	OriginalTitle
) 
values 
(
		'13', 
		'Kenyérrel táplálj még ma, Urunk', 
		@SubChapterId, 
		'	
			¶1. Kenyérrel táplálj még ma, Urunk.\Bőséges étel az új kovász,\hát osszuk széjjel, míg velünk jársz:\kenyérrel táplálj még ma, Urunk.§
			¶2. Reménnyel táplálj még ma, Urunk.\Hadd nőjön nagyra gyenge hitünk,\s mint Mesterünk, majd úgy szeretünk:\reménnyel táplálj még ma, Urunk.§
			¶3. Igéddel éltess még ma, Urunk.\Új élet támad a semmiből,\világunk gyógyul bűneiből:\igéddel éltess még ma, Urunk.§
			¶4. Fényeddel éltess még ma, Urunk.\Mutasd meg tiszta világodat,\ha elsodorna szennyáradat:\fényeddel éltess még ma, Urunk.§
			¶5. És adj kegyelmet, még ma, Urunk\bőségedből, bár nincs érdemünk.\Te nagy csodákat művelsz velünk:\így adj kegyelmet még ma, Urunk.§
		',
		'Svédország',
		'Szöveg és dallam: Janne Mark (1973–), fordította PKM',
		'Ge oss idag vårt dagliga bröd'
)

-- 14 Heyr himna smidur
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'14', 
		'Hallj, ég Kovácsa', 
		@SubChapterId, 
		'	
			¶1. Hallj, ég Kovácsa,\mindenség Ura:formálj gyengéden kegyelmeddel.\Megszólíthatlak,\testem te alkottad.\Szolgád, az vagyok, és te Istenem.§
			¶2. Úrnak szólítlak,\Téged hívtalak:\ne feledkezz el irgalmadról!\Ragyogj ránk, fényes nap,\üdve a világnak,\szívek mélységét betöltő Fény.§
			¶3. Tölts be teljesen,\ó, jöjj, kegyelem.\Teljes életem Téged dicsér.\Szűztől született,\fájdalmat szenvedett:\jöjj a szívembe,\csak Te vagy az Úr.§
		',
		null,
		'Szöveg: Kolbeinn Tumason (1173–1208), ford. PKM',
		'Dallam: Thorkell Sigurbjörnsson (1938–2013)',
		'Heyr himna smidur'
)

-- 15 Hiszem, hogy Ő alkotott
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'15', 
		'Hiszem, hogy Ő alkotott', 
		@SubChapterId, 
		'	
			¶1. Hiszem, hogy Ő alkotott,\és nevéből árad erő,\a lelkéből van életem.\Hiszem, Őt élem.§
			¶2. Hiszem, hogy Ő velem jár,\és nevéből árad erő,\a Krisztusból van életem.\Hiszem, Őt élem.§
			¶3. Hiszem, hogy Ő ad reményt,\és nevéből árad erő,\a hit által van életem.\Hiszem, Őt élem.§
		',
		null,
		'Szöveg és dallam: Per Harling (1948–), fordította PKM',
		null,
		'Vi tror på Skaparen, Gud'
)

-- BIZALOM ISTENBEN, MEGÚJULÓ REMÉNYSÉG
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'BIZALOM ISTENBEN, MEGÚJULÓ REMÉNYSÉG' and ChapterId = @ChapterId)

-- 16 Árad az élet
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'16', 
		'Árad az élet', 
		@SubChapterId, 
		'	
			¶1. Árad az élet, mint tenger árja,\Édennek kertje kezdettől szép:\Isten kezében teljesség várja\vesztes világunk: így lesz majd ép.§
			¶2. Támad az Élet, mint hajnal fénye,\kegyelem árja Krisztustól jő,\halálon áttör megváltó lénye,\világot gyógyít, s feltámaszt Ő.§
			¶3. Szélfútta Élet, lendít a Lélek,\Istennek Lelke bennem is él!\Gyógyító Lélek, járd át egyházad,\újítsd meg néped, mennyei szél.§
			¶4. Újjászült élet szép termőfája\gyógyítja népek minden sebét.\Jöjj, sebzett Isten, s szűnnek a harcok,\formáld át gyarló néped szívét.§
			¶5. Megváltott élet Krisztus testében,\véréért van most szabad utunk,\lüktető élet töltse be lelkünk:\ővele járva mennybe jutunk.§
		',
		'Ausztrália / Anglia',
		'Szöveg: Norman C. Habel (1932–), fordította PKM',
		'Dallam: Hagyományos gael dallam, BUNESSAN (1888)',
		'Healing is flowing'
)

-- 17 Vær sterk, min sjel, i denne tid
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'17', 
		NULL, 
		@SubChapterId, 
		'	
				¶Prózafordítás§
				*¶1. Ma légy erős, lelkem,\amikor terheket kell hordoznod.\Tarts ki a próbás időben, és szenvedd el a rád mért terhet.\Míg egy napon, új hajnalon Isten jövőjének fénye megtöri a sötétséget.§
				¶2. Akkor adj teret a reménységnek,\bármilyen mélységben jársz is.\Isten rejtett módon jelen van azokban, akik elvesztik a csatát.\Krisztus műve által erőt nyersz, és megpihenhetsz Isten reményteljes jövőjében.§
				¶3. Íme, a sötétség javadat munkálja,\várd ki, míg az éjszaka véget ér.\Feledd a félelmet és a belső feszültséget, Isten karja körülölel.\Lásd, szabad vagy, hogy meglásd Isten jövőjének ígéretét.§/*
		',
		'Norvégia',
		'Szöveg: Svein Ellingsen (1929–2020), fordította PKM',
		'Dallam: Egil Hovland (1924–2013)',
		'Vær sterk, min sjel, i denne tid'
)

-- 18 Minden nap az Úr kegyelme tart meg
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'18', 
		'Minden nap az Úr kegyelme tart meg', 
		@SubChapterId, 
		'	
			¶1. Minden nap az Úr kegyelme tart meg,\abból élek, jöjjön bármi vész.\Biztat, bátorít, ha lelkem retteg:\minden reggel új kegyelme kész.\Tenyerében őrzi a világot,\tudja minden élő útjait:\ő ad nékünk terhet, vigasságot,\míg kiméri éltünk napjait.§
			¶2. Minden percben jelen van közöttünk,\nála nyitva áll az új esély.\Ő kezére rábízhatjuk éltünk,\azt ígéri: lesz erőd, ne félj.\Gondot annyit terhel ránk, amennyi\vele együtt elhordozható:\élted végeig erőd kiméri\biztos kézzel a Mindenható.§
			¶3. Hála néked az új szövetségért,\abban bízva megpihenhetünk.\Hála légyen a vigasztalásért,\szent igédben adtad azt nekünk.\Add, hogy tőled is vegyük kezünkbe\minden perc és nap ígéretét,\mígnem elragadsz, hogy mindörökre\zenghessük neved dicséretét.§
		',
		'Svédország',
		'Szöveg: Lina Sandell (1832–1903), fordította PKM',
		'Dallam: Oscar Ahnfelt (1813–1882)',
		'Blott en dag, ett ögonblick i sänder'
)

-- 19 Gyönyörű mind
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'19', 
		'Gyönyörű mind', 
		@SubChapterId, 
		'	
			¶1. Gyönyörű mind, amit az Isten formált.\Csodaszép minden, mit keze alkotott.\Ragyogó színt, rügyező lombnak pompát,\meredek bércnek formát ő adott.\Refrén: Hála, köszönet a sok-sok jóért,\Isten napról napra gondol ránk!\Értünk óvja, védi minden percben égi jó Atyánk.§
			¶[2. Csalogánydal, suhanó fecske röpte,\Millió csillag mind Istenről beszél.\Ölelő kar, szerető szív sok könnye\Üzeni: adjunk hálát mindenér''''.\Hála, köszönet a sok-sok jóért,\Isten napról napra gondol ránk!\Értünk óvja, védi minden percben égi jó Atyánk.]§
			¶3. Kikelet jön, s kivirul minden élet.\Amikor nyár lesz, oly dús az ért kalász.\Ha jön az ősz, s a gyümölcs mind beérett,\Jöhet a tél, mert áldást rejt a ház.\Hála, köszönet a sok-sok jóért,\Isten napról napra gondol ránk!\Értünk óvja, védi minden percben égi jó Atyánk.§
			¶[4. Ugye, mily jó, amit az Úrtól kaptunk:\Szeretet, béke, mit Szent Fia hozott!\Ideje hát valamit önként adnunk,\Ugyanúgy adni, ahogy Ő adott!\Hála, köszönet a sok-sok jóért,\Isten napról napra gondol ránk!\Értünk óvja, védi minden percben égi jó Atyánk.]§
		',
		'Anglia',
		'Szöveg és dallam: John Rutter (1945–), fordította Kulcsár Tibor',
		null,
		'Look at the World'
)

-- 20 Az én életem olyan, mint a szél
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'20', 
		'Az én életem olyan, mint a szél', 
		@SubChapterId, 
		'	
			¶1. Az én életem olyan, mint a szél:\rávisz a rejtett útra, sosem fél.\És elvisz majd magával, hova sosem készültél,\és nyitva áll a világmindenség.§
			¶2. Az én Istenem olyan, mint a szél:\bántásból áldást, bort a vízből mér.\És elvisz majd magával, hova sosem készültél,\és nyitva áll a világmindenség.§
			¶Refrén: Hisz sosem járunk vízen, ha nincs meg a bátorság:\test és a szív megfürödhet a mélyben már.\És mi sosem támadunk fel, hogyha féljük a halált,\pedig nyitva áll most a világmindenség.§
			¶3. Jövőm útja is olyan, mint a szél:\a függöny épp meglebben, s ott a fény!\És elvisz majd magával, hova sosem készültél,\és nyitva áll a világmindenség.§
			¶Hisz sosem járunk vízen, ha nincs meg a bátorság:\test és a szív megfürödhet a mélyben már.\És mi sosem támadunk fel, hogyha féljük a halált,\pedig nyitva áll most a világmindenség.§
		',
		'Kanada',
		'Szöveg és dallam: Gordon Light, fordította PKM',
		'A szerzői utasítás szerint a refrén csak a második és harmadik versszakot követően hangzik.',
		'My love colours outside the lines'
)

-- CIKLIKUS TÉTELEK
set @ChapterId = (select Id from [KFOLD_website].[Chapters] where Name = 'CIKLIKUS TÉTELEK')

-- KÁNONOK
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'KÁNONOK' and ChapterId = @ChapterId)

-- 21 Este jő, Lélek jár
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'21', 
		'Este jő, Lélek jár', 
		@SubChapterId, 
		'	
			¶Este jő, Lélek jár,\nap leszáll, csak az álom vár.\Jézus Úr, a csillagfény:\benne élő hit, remény.§
		',
		'USA',
		'Szöveg: észak-amerikai őslakos szöveg nyomán PKM',
		'Dallam: észak-amerikai őslakos elemekből ismeretlen szerző',
		'Evening rise'
)

-- 22 Ha folyóvíz is volnék
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'22', 
		'Ha folyóvíz is volnék', 
		@SubChapterId, 
		'	
			¶Ha folyóvíz, ha folyóvíz is volnék,\mindig csak sírnék, sírnék, csak sírnék:\óhazámra, szép Sionra, arra emlékeznék.§
		',
		'Ismeretlen eredetű',
		'Szöveg: a 137. zsoltár parafrázisa nyomán PKM',
		'Dallam: Egyes források szerint Philip Hayesnek (1738–1797) tulajdonított',
		'By the waters of Babylon'
)

-- 23 Sok-sok tagból áll az egyház
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1,
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'23', 
		'Sok-sok tagból áll az egyház', 
		@SubChapterId, 
		'	
			¶Sok-sok tagból áll az egyház,\téged is vár a megígért rész.\Sokfélékben ott az egység,\Jézus kezében leszünk egész.§
		',
		'Svédország',
		'Szöveg és dallam: Per Harling (1948–), fordította PKM',
		null,
		'Vi är delar av en helhet'
)

-- IMÁDSÁGVÁLASZOK
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'IMÁDSÁGVÁLASZOK' and ChapterId = @ChapterId)

-- 24 Dicsérünk, Úristen
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		24, 
		'Dicsérünk, Úristen', 
		@SubChapterId, 
		'
			¶1. Dicsérünk, Úristen, dicsérünk, Úristen, dicsérünk, Úristen, dicsérünk, Úristen.§ 
			¶2. Világon egy Isten, világon egy Isten, világon egy Isten: dicsérünk, Úristen.§ 
			¶3. Megváltó, szent Isten, megváltó, szent Isten, megváltó, szent Isten: dicsérünk Úristen.§
		',
		'Botszvána',
		'Szöveg: népi vallásosság, magyar változat PKM',
		'Dallam: Daisy Nshakazongwe adatközlése alapján I-to-Loh',
		'Reamo leboga'
)

-- 25 Dicsérjük: ámen, dicsérjük ő nevét
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		25, 
		'Dicsérjük: ámen, dicsérjük ő nevét', 
		@SubChapterId, 
		'
			¶Dicsérjük: ámen, dicsérjük Ő nevét.\Dicsérjük: ámen, dicsérjük Ő nevét.\Dicsérjük az ő nevét, az ő nevét,\ámen, dicsérjük ő nevét!§
		',
		'Dél-Afrikai Köztársaság',
		'Szöveg és dallam: Stephen Cutbert Molefe (1917–1987), fordította PKM',
		null,
		'Masithi: Amen, siyakudumisa'
)

-- 26a Ásun mán, Dévlá
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'26a', 
		'Ásun mán, Dévlá', 
		@SubChapterId, 
		'
			¶Ásun mán, Dévlá. Ásun mán, Dévlá.\Hallgasd meg az imádságom, ásun mán, Dévlá.§
		',
		'USA',
		'Szöveg: Owen Alstott (1947–), az eredeti spanyol–angol váltakozást lovári–magyar nyelvpárra lokalizálta PKM',
		'Dallam: Bob Hurd (1950–)',
		'Óyenos mi Diós'
)

-- 26b Sun ámén, Dévlá
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'26b', 
		'Ásun mán, Dévlá', 
		@SubChapterId, 
		'
			¶*Többes számú szövegváltozat:/*\Sun ámén, Dévlá(m). Sun ámén, Dévlá(m).\Hallgasd meg az imádságom, sun ámén, Dévlá(m).§
		',
		'USA',
		'Szöveg: Owen Alstott (1947–), az eredeti spanyol–angol váltakozást lovári–magyar nyelvpárra lokalizálta PKM',
		'Dallam: Bob Hurd (1950–)',
		'Óyenos mi Diós'
)

-- 27 Légy kegyelemmel
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'27', 
		'Légy kegyelemmel', 
		@SubChapterId, 
		'
			¶Légy kegyelemmel, hallgass meg!§
		',
		'Nagy-Britannia (Skócia)',
		'Szöveg: hagyományos liturgikus szöveg, magyar változat PKM',
		'Dallam: John L. Bell (1949–)',
		'Lord, in your mercy'
)

-- 28 Békesség
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'28', 
		'Békesség', 
		@SubChapterId, 
		'
			¶Békesség, jöjj, és ezt kérd:\békesség, tedd és reméld,\Isten békéje veled lesz örökké.§
		',
		'Svédország',
		'Szöveg és dallam: Per Harling (1948–), fordította PKM',
		null,
		'Be om fred'
)

-- ZSOLTÁRREFRÉNEK
set @SubChapterId = (select Id from [KFOLD_website].[SubChapters] where Name = 'ZSOLTÁRREFRÉNEK' and ChapterId = @ChapterId)

-- 29 Ízleljétek ő jóságát
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'29', 
		'Ízleljétek ő jóságát', 
		@SubChapterId, 
		'
			¶Ízleljétek ő jóságát: boldog az, ki hozzáléphet!\Ízleljétek és lássátok, érezzétek nagy kegyelmét!§
		',
		'Svédország',
		'Szöveg: Zsolt 34,9 nyomán PKM',
		'Dallam: Per Harling (1948–)',
		'Se och smaka'
)

-- 30 Jó együtt lenni
insert into [KFOLD_website].[SheetMusics]
(
	Number, 
	Title, 
	SubChapterId,
	Lyrics,
	Origin,
	HimnologicalData1, 
	HimnologicalData2,
	OriginalTitle) 
values 
(
		'30', 
		'Jó együtt lenni', 
		@SubChapterId, 
		'
			¶Refrén: Jó együtt lenni testvérekkel, jó együtt lenni testvérekkel.§
			¶1. Milyen jó nekünk együtt Krisztus szent közelségében:\hatalmas ajándék, mint Áronnak a szent kenet.\Jó együtt lenni testvérekkel, jó együtt lenni testvérekkel.§
			¶2. Milyen jó nekünk együtt Krisztus szent közelségében:\olyan biztosan fed, mint harmat Sion szent hegyét.\Jó együtt lenni testvérekkel, jó együtt lenni testvérekkel.§
			¶3: Milyen jó nekünk együtt Krisztus szent közelségében:\csak így áld az Úr minket, így ad örök életet.\Jó együtt lenni testvérekkel, jó együtt lenni testvérekkel.§
		',
		'Argentína',
		'Szöveg: Zsolt 133 nyomán, fordította PKM',
		'Dallam: Pablo Sosa (1933–2020)',
		'Miren qué bueno'
)