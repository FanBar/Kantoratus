declare @SongsWithPoemsChapterId int = (select Id from [KFOLD_website].Chapters where Name = 'VERSES ÉNEKEK')
declare @CycklicSongsChapterId int = (select Id from [KFOLD_website].Chapters where Name = 'CIKLIKUS TÉTELEK')

-- VERSES ÉNEKEK
insert into 
	[KFOLD_website].SubChapters(ChapterId, Name) 
values 
	(@SongsWithPoemsChapterId, 'ADVENT–KARÁCSONY'), 
	(@SongsWithPoemsChapterId, 'BÖJT'), 
	(@SongsWithPoemsChapterId, 'HÚSVÉT'), 
	(@SongsWithPoemsChapterId, 'ÚRVACSORA'), 
	(@SongsWithPoemsChapterId, 'EGYHÁZ, IMÁDSÁG, HITVALLÁS'), 
	(@SongsWithPoemsChapterId, 'BIZALOM ISTENBEN, MEGÚJULÓ REMÉNYSÉG')

-- CIKLIKUS TÉTELEK
insert into 
	[KFOLD_website].SubChapters(ChapterId, Name) 
values 
	(@CycklicSongsChapterId, 'KÁNONOK'), 
	(@CycklicSongsChapterId, 'IMÁDSÁGVÁLASZOK'), 
	(@CycklicSongsChapterId, 'ZSOLTÁRREFRÉNEK')