CREATE TABLE [lookup].[DischargeEstimatedClass]
(
	[ID] TINYINT NOT NULL,
    [Label] VARCHAR (15) NOT NULL,
	[Sort] TINYINT NULL,
    CONSTRAINT [PK_DischargeEstimatedClass] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeEstimatedClass_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_DischargeEstimatedClass_Label] UNIQUE NONCLUSTERED ([Label] ASC)
)
