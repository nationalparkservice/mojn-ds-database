CREATE TABLE [ref].[RETIRED_Personnel] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [Initials]          VARCHAR (4)   NOT NULL,
    [FirstName]         VARCHAR (50)  NOT NULL,
    [LastName]          VARCHAR (50)  NOT NULL,
    [MiddleInitial]     VARCHAR (1)   NULL,
    [Organization]      VARCHAR (50)  NOT NULL,
    [Notes]             VARCHAR (100) NULL,
    [PersonnelActiveID] TINYINT       NOT NULL,
    [ProtectedStatusID] TINYINT       NOT NULL,
    CONSTRAINT [PK_Personnel] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Personnel_FirstName_DisallowZeroLength] CHECK (len([FirstName])>(0)),
    CONSTRAINT [CK_Personnel_Initials_DisallowZeroLength] CHECK (len([Initials])>(0)),
    CONSTRAINT [CK_Personnel_LastName_DisallowZeroLength] CHECK (len([LastName])>(0)),
    CONSTRAINT [CK_Personnel_MiddleInitial_DisallowZeroLength] CHECK (len([MiddleInitial])>(0)),
    CONSTRAINT [CK_Personnel_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Personnel_Organization_DisallowZeroLength] CHECK (len([Organization])>(0)),
    CONSTRAINT [FK_Personnel_PersonnelActive] FOREIGN KEY ([PersonnelActiveID]) REFERENCES [lookup].[PersonnelActive] ([ID]),
    CONSTRAINT [FK_Personnel_ProtectedStatus] FOREIGN KEY ([ProtectedStatusID]) REFERENCES [lookup].[ProtectedStatus] ([ID]),
    CONSTRAINT [UN_Personnel_Initials] UNIQUE NONCLUSTERED ([Initials] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.ProtectedStatus (protected status of data record)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'ProtectedStatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.PersonnelActive (indicates whether the individual is currently working for/with MOJN)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'PersonnelActiveID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about staff member or participant (e.g. what projects they worked on, if relevant)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Organization the participant is associated with', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'Organization';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Middle initial', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'MiddleInitial';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Last name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'LastName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'First name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'FirstName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique initials of staff or participant. For duplicate initials, a number is added at the end (e.g. JLB2)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'Initials';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Personnel involved in data collection or management', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_Personnel';

