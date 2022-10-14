CREATE DATABASE SchoolDB
GO
USE SchoolDB
GO
CREATE TABLE Specialities(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(16) NOT NULL,
[Description] NVARCHAR(1024),
[GraduatesTitle] VARCHAR(32) NOT NULL,
[StartGrade] INT CONSTRAINT StartGrade CHECK (StartGrade BETWEEN 1 and 12) NOT NULL,
[EndGrade] INT CONSTRAINT EndGrade CHECK (EndGrade BETWEEN 1 and 12) NOT NULL,
)
GO
CREATE TABLE Classes(
Id INT PRIMARY KEY IDENTITY,
[Grade] INT CONSTRAINT Grade CHECK (Grade BETWEEN 1 and 12) NOT NULL,
[GradeLetter] VARCHAR(1),
CONSTRAINT letter CHECK (GradeLetter='A' OR GradeLetter='B' OR GradeLetter='C' OR GradeLetter='D'),
[SpecialityID] INT CONSTRAINT FK_Classes_Speciality
FOREIGN KEY REFERENCES Specialities(Id),
)
GO
CREATE TABLE Students(
Id UNIQUEIDENTIFIER PRIMARY KEY default NEWID(),
[FirstName] VARCHAR(16) NOT NULL,
[SurName] VARCHAR(16),
[LastName] VARCHAR(16) NOT NULL,
[GSM] INT NOT NULL ,
[Email] NVARCHAR(32) NOT NULL,
[Address] NVARCHAR(64) NOT NULL,
[Age] INT CONSTRAINT age CHECK (Age BETWEEN 8 and 20) NOT NULL,
[Gender] BIT NOT NULL,
[ClassID] INT CONSTRAINT FK_Students_Classes
FOREIGN KEY REFERENCES Classes(Id),
)--
GO
CREATE TABLE Teachers(
Id UNIQUEIDENTIFIER PRIMARY KEY default NEWID(),
[FirstName] VARCHAR(16) NOT NULL,
[LastName] VARCHAR(16) NOT NULL,
[Gender] BIT NOT NULL,
[Email] NVARCHAR(32) NOT NULL UNIQUE,
[Subjects] VARCHAR(64) NOT NULL,
[ManagedClassID] INT CONSTRAINT FK_ManagedClass_Classes
FOREIGN KEY REFERENCES Classes(Id),
)
GO


INSERT INTO Specialities(Name, Description,GraduatesTitle,StartGrade,EndGrade) VALUES
('programist','rabota s C# i SQL(SMSS)','Programist',8,12),
('МЕХАТРОНИКА','изучаването на механичните, електронните и информационните системи на автомобила.','Механик',8,12),	
('АВТОТРАНСПОРТНА','обучението по професията е придобиване на професионални компетенции за безопасно техническо обслужване, ремонт и експлоатация на транспортната техника.','Механик',8,12)


INSERT INTO Students (FirstName,SurName,LastName,GSM,Email,Gender,Address,Age)VALUES
('Asha','Haji ','Mbita ', 0855738606 , 'littlekity44@gmail.com',1,'657 Miller Overpass', 11),
('Kanu', 'Zuberi ', 'Asante ', 0829601715 , 'bokonoko66@gmail.com',1, '39771 Imelda Parkway', 14),
('Kheri','Siwatu ', 'Hasani ',0852100417 , 'childpredator@gmail.com',1, '67276 Vinnie Ports', 9),
('Khary', 'Tamu ', 'Kijana ',0857957421 , 'gfxguy@gmail.com', 1,'261 Magnus Corner', 15),
('Jamba','Ohakim','Mhina ',0833434052 , 'paina@gmail.com',1 ,'1958 Buck Drive',16),
('Amaziah', 'Fagbure', 'Haji ',0824482703 , 'ozawa@gmail.com',1, '9353 Barrows Hills',18),
('Okonjo', 'Ayim', 'Rashid ', 0827291278 , 'smeier@gmail.com',1, '4245 Millie Forest', 14),
('Mosiya', 'Mbadinuju', 'Hamisi ',0846436516 , 'research@gmail.com',1, '308 Carson Squares', 16),
('Mbwana ', 'Ezekwesili', 'Mosi ',0842393547 , 'jrifkin@gmail.com',1, '42489 Wunsch Drive', 17),
('Mia', 'Anjela', 'Malkova',0839401960,'haddawy@gmail.com',0, '448 Shannon Port', 19)

INSERT INTO Teachers(FirstName,LastName,Gender,Email,Subjects,ManagedClassID) VALUES
('Ongombo', 'Kotar', 0, 'kmself@optonline.net', 'програмиране',1),
('Abram', 'Bakula', 1, 'uncle@outlook.com', 'МЕХАТРОНИКА',2),
('Sofia','Zubia', 0, 'dgatwood@aol.com', 'physical education',NULL)



SELECT * FROM Teachers
SELECT * FROM Students
SELECT * FROM Specialities
EXEC sp_rename 'Specialities.Destination', 'Description'