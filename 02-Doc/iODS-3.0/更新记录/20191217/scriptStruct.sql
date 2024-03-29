USE [HiODSDB]
GO
/****** Object:  Table [dbo].[SM_PageButtonConfig]    Script Date: 2019/12/17 16:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PageButtonConfig](
	[ID] [nvarchar](50) NOT NULL,
	[SystemResourceDtlCode] [nvarchar](50) NOT NULL,
	[ResourceUrl] [nvarchar](200) NULL,
	[ButtonID] [nvarchar](100) NOT NULL,
	[ButtonName] [nvarchar](100) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[IsSysMenu] [char](1) NULL,
 CONSTRAINT [PK_SM_PAGEBUTTONCONFIG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_PersonSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PersonSysPower](
	[ID] [nvarchar](50) NOT NULL,
	[PersonCode] [nvarchar](50) NOT NULL,
	[SystemResourceDtlCode] [nvarchar](50) NOT NULL,
	[PageButtonConfigID] [int] NOT NULL,
	[IsEnable] [char](1) NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_PERSONSYSPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_GetButtonForCode]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_GetButtonForCode] AS SELECT
            a.PersonCode,
            a.PageButtonConfigID,
            a.SystemResourceDtlCode
            FROM
            SM_PersonSysPower AS a
            LEFT OUTER JOIN SM_PageButtonConfig AS b ON b.ID = a.PageButtonConfigID
GO
/****** Object:  Table [dbo].[SM_RoleSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_RoleSysPower](
	[ID] [nvarchar](50) NOT NULL,
	[RoleCode] [nvarchar](50) NOT NULL,
	[SystemResourceDtlCode] [nvarchar](50) NULL,
	[PageButtonConfigID] [int] NOT NULL,
	[IsEnable] [char](1) NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_ROLESYSPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_GetButtonForRole]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_GetButtonForRole] AS SELECT
            a.PageButtonConfigID,
            a.SystemResourceDtlCode,
            a.RoleCode
            FROM
            SM_RoleSysPower AS a
            LEFT OUTER JOIN SM_PageButtonConfig AS b ON b.ID = a.PageButtonConfigID
GO
/****** Object:  Table [dbo].[SM_RoleDataPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_RoleDataPower](
	[ID] [nvarchar](50) NOT NULL,
	[RoleCode] [nvarchar](50) NULL,
	[SystemResourceDtlCode] [nvarchar](50) NULL,
	[DataPower] [char](1) NULL,
	[CustomPower] [nvarchar](1000) NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_ROLEDATAPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_SystemResource]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_SystemResource](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[PCode] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[EnTitle] [nvarchar](50) NULL,
	[OrderNo] [int] NULL,
	[IsHide] [char](1) NULL,
	[IsSysMenu] [char](1) NULL,
	[Platform] [char](1) NULL,
	[DelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_SYSTEMRESOURCE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_SystemResourceDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_SystemResourceDtl](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[SystemResourceCode] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[EnTitle] [nvarchar](50) NULL,
	[ResourceType] [char](1) NULL,
	[ResourceUrl] [nvarchar](1000) NULL,
	[ResourceUrlApp] [nvarchar](100) NULL,
	[Parameter] [nvarchar](200) NULL,
	[OrderNo] [int] NULL,
	[IsHide] [char](1) NULL,
	[IsSysMenu] [char](1) NULL,
	[Platform] [char](1) NULL,
	[ConfCodeVou] [char](1) NOT NULL,
	[DelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_SYSTEMRESOURCEDTL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_GetPersonResourceForRole]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_GetPersonResourceForRole] AS SELECT
            a.Title,
            b.Title AS subtitle,
            c.RoleCode,
            b.ResourceUrl,
            b.Parameter,
            c.CustomPower,
            c.DataPower,
            a.ID,
            c.SystemResourceDtlCode
            FROM
            SM_SystemResource AS a
            LEFT OUTER JOIN SM_SystemResourceDtl AS b ON a.Code = b.SystemResourceCode
            LEFT OUTER JOIN SM_RoleDataPower AS c ON c.SystemResourceDtlCode = b.Code
GO
/****** Object:  Table [dbo].[SM_SystemResourceRmisDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_SystemResourceRmisDtl](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[SystemResourceCode] [nvarchar](50) NOT NULL,
	[DeployID] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[EnTitle] [nvarchar](50) NULL,
	[ResourceType] [char](1) NULL,
	[Parameter] [nvarchar](200) NULL,
	[OrderNo] [int] NULL,
	[IsHide] [char](1) NULL,
	[IsSysMenu] [char](1) NULL,
	[Platform] [char](1) NULL,
	[ConfCodeVou] [char](1) NOT NULL,
	[DelFlag] [char](1) NOT NULL,
	[ExternalNetwork] [nvarchar](200) NULL,
 CONSTRAINT [PK_SM_SYSTEMRESOURCERMISDTL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_Log]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_Log](
	[ID] [nvarchar](50) NOT NULL,
	[strOperater] [nvarchar](100) NOT NULL,
	[strOperateTime] [datetime] NOT NULL,
	[nLogSource] [int] NOT NULL,
	[nOperateContentKey] [int] NOT NULL,
	[nStatus] [int] NOT NULL,
	[strIP] [nvarchar](50) NOT NULL,
	[strLabelName] [nvarchar](64) NOT NULL,
	[strLabelDescribe] [nvarchar](128) NULL,
	[strArea] [nvarchar](64) NULL,
	[strDevice] [nvarchar](64) NULL,
	[strUnit] [nvarchar](64) NULL,
	[strOperateRoute] [nvarchar](255) NULL,
	[strPreContent] [nvarchar](255) NULL,
	[strafterContent] [nvarchar](255) NULL,
	[strContent] [nvarchar](255) NULL,
 CONSTRAINT [PK_NLOGID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_OperateContent]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_OperateContent](
	[ID] [nvarchar](50) NOT NULL,
	[nOperateContentKey] [nvarchar](50) NOT NULL,
	[strOperateContent] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SM_OperateContent] PRIMARY KEY CLUSTERED 
(
	[nOperateContentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_deply]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_deply](
	[Id] [nvarchar](50) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[description] [varchar](64) NULL,
	[type] [int] NOT NULL,
	[sort] [int] NOT NULL,
	[path] [varchar](128) NOT NULL,
	[pid] [int] NOT NULL,
	[RTDBServer] [nvarchar](64) NULL,
 CONSTRAINT [PK_T_DEPLY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectTag]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectTag](
	[ID] [nvarchar](50) NOT NULL,
	[strID] [nvarchar](80) NULL,
	[strName] [nvarchar](70) NULL,
	[strDescription] [nvarchar](300) NULL,
	[strArea] [nvarchar](128) NULL,
	[strDevice] [nvarchar](128) NULL,
	[strUnit] [nvarchar](128) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[nTagType] [int] NULL,
	[strResourceUrl] [nvarchar](1000) NULL,
	[strGTGuid] [nvarchar](50) NULL,
	[strGTPC] [nvarchar](50) NULL,
	[strGTDomain] [nvarchar](50) NULL,
	[strDelFlag] [char](1) NOT NULL,
	[nTagDataType] [int] NULL,
 CONSTRAINT [PK_SM_ProjectTag] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectTag_C]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_SM_ProjectTag_C] ON [dbo].[SM_ProjectTag]
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_Log]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_Log] AS SELECT
            A.ID,
            A.strOperater,
            A.strOperateTime,
            A.strLabelName,
            A.strLabelDescribe,
            A.nLogSource,
            A.nStatus,
            CASE

            WHEN A.nLogSource = 1 THEN
            'iODS'
            WHEN A.nLogSource = 2 THEN
            '系统日志'
            WHEN A.nLogSource = 3 THEN
            'DCS' ELSE ''
            END AS strLogSourceName,
            A.strOperateRoute,
            CASE

            WHEN A.nLogSource = 1 THEN
            ISNULL( B_1.Title, N'' )
            WHEN A.nLogSource = 2 THEN
            ISNULL( B_1.Title, N'' )
            WHEN A.nLogSource = 3 THEN
            ''
            END AS strOperateRouteName,
            CASE

            WHEN A.nLogSource = 3 THEN
            0 ELSE A.nOperateContentKey
            END AS nOperateContentKey,
            CASE

            WHEN A.nLogSource = 1
            AND nStatus = 0
            AND LEN( A.strContent ) = 0 THEN
            '失败'
            WHEN A.nLogSource = 1
            AND nStatus = 1
            AND ( A.nOperateContentKey = 11 OR A.nOperateContentKey = 12 ) THEN
            ( '由' + A.strPreContent + '改为' + A.strafterContent )
            WHEN A.nLogSource = 1
            AND nStatus = 1
            AND A.nOperateContentKey = 10 THEN
            ( '置为' + A.strafterContent + ',脉冲时间为' + A.strPreContent + '毫秒' ) ELSE A.strContent
            END AS strContent,
            CASE

            WHEN A.nLogSource = 3 THEN
            '其他' ELSE C.strOperateContent
            END AS strOperateContent,
            CASE

            WHEN LEN( A.strArea ) >
            0 THEN
            A.strArea ELSE ISNULL( D.strArea, N'' )
            END AS strArea,
            CASE

            WHEN LEN( A.strDevice ) >
            0 THEN
            A.strDevice ELSE ISNULL( D.strDevice, N'' )
            END AS strDevice,
            CASE

            WHEN LEN( A.strUnit ) >
            0 THEN
            A.strUnit ELSE ISNULL( D.strUnit, N'' )
            END AS strUnit
            FROM
            SM_Log AS A
            LEFT OUTER JOIN (
            SELECT
            ID,
            Code,
            PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            '' AS Type,
            '' AS ResourceUrl,
            '' AS Parameter,
            IsHide,
            '' AS ExternalNetwork
            FROM
            SM_SystemResource UNION
            SELECT
            ID,
            Code,
            SystemResourceCode AS PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            '' AS Type,
            ResourceUrl,
            Parameter,
            IsHide,
            '' AS ExternalNetwork
            FROM
            SM_SystemResourceDtl UNION
            SELECT
            a.ID,
            a.Code,
            a.SystemResourceCode AS PCode,
            a.OrderNo,
            a.Title,
            a.EnTitle,
            a.DelFlag,
            a.IsSysMenu,
            b.type,
            b.path AS ResourceUrl,
            a.Parameter,
            a.IsHide,
            a.ExternalNetwork
            FROM
            SM_SystemResourceRmisDtl AS a
            LEFT OUTER JOIN t_deply AS b ON a.DeployID = b.Id
            ) AS B_1 ON A.strOperateRoute = B_1.Code
            AND A.nLogSource = 2
            LEFT OUTER JOIN SM_OperateContent AS C ON C.nOperateContentKey = A.nOperateContentKey
            LEFT OUTER JOIN SM_ProjectTag AS D ON D.strName = A.strLabelName
GO
/****** Object:  Table [dbo].[SM_MessageInfo]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_MessageInfo](
	[ID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[EndTime] [datetime] NULL,
	[Content] [nvarchar](4000) NULL,
	[Sender] [nvarchar](50) NULL,
	[SendTime] [datetime] NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[MsgType] [int] NULL,
	[nPushStatus] [int] NULL,
	[Client] [int] NULL,
 CONSTRAINT [PK_SM_MESSAGEINFO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_Person]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_Person](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [char](1) NULL,
	[WorkNum] [nvarchar](50) NULL,
	[Account] [nvarchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[Duty] [nvarchar](50) NULL,
	[Position] [int] NULL,
	[Superior] [nvarchar](50) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[OrderNo] [int] NULL,
	[PersonStatus] [char](1) NOT NULL,
	[DelFlag] [char](1) NOT NULL,
	[RandCode] [int] NULL,
	[LastPasswordChangeTime] [datetime] NOT NULL,
 CONSTRAINT [PK_SM_PERSON] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_MessageInfo]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_MessageInfo] AS SELECT
            a.ID,
            a.Sender,
            a.SendTime,
            a.Content,
            a.DelFlag,
            a.EndTime,
            a.Title,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            a.MsgType,
            b.Name,
            a.nPushStatus
            FROM
            SM_MessageInfo AS a
            LEFT OUTER JOIN SM_Person AS b ON a.Sender = b.Code
            WHERE
            ( b.DelFlag = '0' )
            AND (
            b.PersonStatus = '1')
GO
/****** Object:  Table [dbo].[SM_MessageInfoDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_MessageInfoDtl](
	[ID] [nvarchar](50) NOT NULL,
	[PID] [nvarchar](50) NULL,
	[PersonCode] [nvarchar](50) NULL,
	[IsRead] [char](1) NULL,
	[DelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_MESSAGEINFODTL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_MessageInfoAll]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_MessageInfoAll] AS SELECT
            SM_MessageInfoDtl.ID,
            SM_MessageInfo.Title,
            SM_MessageInfo.Content,
            SM_MessageInfoDtl.PersonCode,
            SM_MessageInfoDtl.IsRead,
            SM_MessageInfoDtl.DelFlag,
            SM_MessageInfo.SendTime,
            SM_MessageInfo.Sender,
            SM_Person.Name AS SenderName,
            SM_MessageInfo.ID AS PID,
            SM_MessageInfo.MsgType,
            SM_MessageInfo.nPushStatus,
            SM_MessageInfo.Client
            FROM
            SM_MessageInfo
            INNER JOIN SM_MessageInfoDtl ON SM_MessageInfo.ID = SM_MessageInfoDtl.PID
            INNER JOIN SM_Person ON SM_MessageInfo.Sender = SM_Person.Code
GO
/****** Object:  View [dbo].[V_SM_MessageInfoDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_MessageInfoDtl] AS SELECT
            a.PID,
            a.PersonCode,
            b.Name,
            a.ID
            FROM
            SM_MessageInfoDtl AS a
            LEFT OUTER JOIN SM_Person AS b ON a.PersonCode = b.Code
GO
/****** Object:  Table [dbo].[SM_PersonDataPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PersonDataPower](
	[ID] [nvarchar](50) NOT NULL,
	[PersonCode] [nvarchar](50) NOT NULL,
	[SystemResourceDtlCode] [nvarchar](50) NULL,
	[DataPower] [char](1) NULL,
	[CustomPower] [nvarchar](1000) NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_PERSONDATAPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_PersonRole_Rel]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PersonRole_Rel](
	[ID] [nvarchar](50) NOT NULL,
	[PersonCode] [nvarchar](50) NULL,
	[RoleCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_SM_PERSONROLE_REL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_PersonDataPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonDataPower] AS SELECT
            a.ID,
            PersonCode,
            SystemResourceDtlCode,
            DataPower,
            CustomPower,
            '0' AS strIsEnable
            FROM
            SM_RoleDataPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode
            WHERE
            a.SystemResourceDtlCode IS NOT NULL UNION ALL
            SELECT
            ID,
            PersonCode,
            SystemResourceDtlCode,
            DataPower,
            CustomPower,
            '1' AS strIsEnable
            FROM
            SM_PersonDataPower
            WHERE
            SystemResourceDtlCode IS NOT NULL
GO
/****** Object:  Table [dbo].[SM_RoleDeptPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_RoleDeptPower](
	[ID] [nvarchar](50) NOT NULL,
	[RoleCode] [nvarchar](50) NOT NULL,
	[DeptCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_SM_ROLEDEPTPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_PersonDeptPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PersonDeptPower](
	[ID] [nvarchar](50) NOT NULL,
	[PersonCode] [nvarchar](50) NOT NULL,
	[DeptCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_SM_PERSONDEPTPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_PersonDeptPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonDeptPower] AS SELECT
            a.ID AS Code,
            a.DeptCode,
            b.PersonCode
            FROM
            SM_RoleDeptPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode UNION ALL
            SELECT
            ID AS Code,
            DeptCode,
            PersonCode
            FROM
            SM_PersonDeptPower
GO
/****** Object:  Table [dbo].[SM_Role]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_Role](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Describe] [nvarchar](1000) NULL,
	[DelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_Department]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_Department](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Pcode] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Charge] [nvarchar](50) NULL,
	[OrderNo] [int] NULL,
	[IsCompany] [char](1) NULL,
	[IsProductionDept] [char](1) NULL,
	[DelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_PersonDepart_Rel]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PersonDepart_Rel](
	[ID] [nvarchar](50) NOT NULL,
	[PersonCode] [nvarchar](50) NULL,
	[DepartCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_SM_PERSONDEPART_REL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_PersonInfo]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonInfo] AS SELECT
            c.ID,
            c.Code,
            c.Name,
            c.Sex,
            CASE
            c.Sex
            WHEN '0' THEN
            '男'
            WHEN '1' THEN
            '女'
            END AS SexName,
            c.Account,
            c.WorkNum,
            c.Password AS Pwd,
            c.DeptCode,
            c.Mobile,
            c.Duty,
            c.Position,
            c.Superior,
            h.Name AS SuperiorName,
            d.Name AS DeptName,
            c.CorpCode,
            e.Name AS CorpName,
            ee.RoleCode,
            ee.RoleName,
            ff.DepartCode,
            ff.DepartName,
            c.DelFlag
            FROM
            SM_Person AS c
            LEFT JOIN /*ee【Code1 + RoleCode + RoleName】*/
            (
            SELECT
            Code AS Code1,
            RoleCode = (
            STUFF((
            SELECT
            ',' + RoleCode
            FROM
            (
            SELECT
            a.Code,
            c.Code AS RoleCode,
            c.Name AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN SM_Role AS c ON b.RoleCode = c.Code
            AND c.DelFlag = '0'
            ) AS bb
            WHERE
            Code = aa.Code FOR xml path ( '' )),
            1,
            1,
            ''
            )),
            RoleName = (
            STUFF((
            SELECT
            ',' + RoleName
            FROM
            (
            SELECT
            a.Code,
            c.Code AS RoleCode,
            c.Name AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN SM_Role AS c ON b.RoleCode = c.Code
            AND c.DelFlag = '0'
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            Code = aa.Code
            ORDER BY
            RoleName FOR xml path ( '' )),
            1,
            1,
            ''
            ))
            FROM
            (
            SELECT
            a.Code,
            c.Code AS RoleCode,
            c.Name AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN SM_Role AS c ON b.RoleCode = c.Code
            AND c.DelFlag = '0'
            WHERE
            a.DelFlag = '0'
            ) AS aa
            GROUP BY
            Code
            ) AS ee ON c.Code = ee.Code1
            LEFT JOIN /*ff【Code2 + DepartCode + DepartName】*/
            (
            SELECT
            Code AS Code2,
            DepartCode = (
            STUFF((
            SELECT
            ',' + DepartCode
            FROM
            (
            SELECT
            a.Code,
            c.Code AS DepartCode,
            c.Name AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.Code
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            Code = hh.Code FOR xml path ( '' )),
            1,
            1,
            ''
            )),
            DepartName = (
            STUFF((
            SELECT
            ',' + DepartName
            FROM
            (
            SELECT
            a.Code,
            c.Code AS DepartCode,
            c.Name AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.Code
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            Code = hh.Code
            ORDER BY
            DepartName FOR xml path ( '' )),
            1,
            1,
            ''
            ))
            FROM
            (
            SELECT
            a.Code,
            c.Code AS DepartCode,
            c.Name AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.Code
            WHERE
            a.DelFlag = '0'
            ) AS hh
            GROUP BY
            Code
            ) AS ff ON c.Code = ff.Code2
            LEFT JOIN SM_Department AS d ON c.DeptCode = d.Code
            LEFT JOIN SM_Department AS e ON c.CorpCode = e.Code
            LEFT JOIN SM_Person AS h ON c.Superior = h.Code
GO
/****** Object:  Table [dbo].[SM_RoleProjectPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_RoleProjectPower](
	[ID] [nvarchar](50) NOT NULL,
	[strRoleCode] [nvarchar](50) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[strItem] [nvarchar](50) NULL,
	[strPowerCode] [nvarchar](50) NULL,
	[strDataPower] [char](1) NULL,
	[strCustomPower] [nvarchar](500) NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_RoleProjectPower] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_PersonProjectPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PersonProjectPower](
	[ID] [nvarchar](50) NOT NULL,
	[strPersonCode] [nvarchar](50) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[strItem] [nvarchar](50) NULL,
	[strPowerCode] [nvarchar](50) NULL,
	[strDataPower] [char](1) NULL,
	[strCustomPower] [nvarchar](500) NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_PersonProjectPower] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_PersonProjectPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonProjectPower] AS SELECT
            a.ID,
            PersonCode AS strPersonCode,
            strProjectCode,
            strItem,
            strPowerCode,
            strDataPower,
            strCustomPower,
            '0' AS strIsEnable
            FROM
            SM_RoleProjectPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.strRoleCode = b.RoleCode UNION ALL
            SELECT
            ID,
            strPersonCode,
            strProjectCode,
            strItem,
            strPowerCode,
            strDataPower,
            strCustomPower,
            '1' AS strIsEnable
            FROM
            SM_PersonProjectPower
GO
/****** Object:  Table [dbo].[SM_RoleProjectSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_RoleProjectSysPower](
	[ID] [nvarchar](50) NOT NULL,
	[strRoleCode] [nvarchar](50) NOT NULL,
	[strItemCode] [nvarchar](50) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nPageButtonConfigID] [int] NOT NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_ROLEPROJECTSYSPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_PersonProjectSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_PersonProjectSysPower](
	[ID] [nvarchar](50) NOT NULL,
	[strPersonCode] [nvarchar](50) NOT NULL,
	[strItemCode] [nvarchar](50) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nPageButtonConfigID] [int] NOT NULL,
	[strIsEnable] [char](1) NULL,
 CONSTRAINT [PK_SM_PERSONPROJECTSYSPOWER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectPageButtonConfig]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectPageButtonConfig](
	[ID] [nvarchar](50) NOT NULL,
	[strProjectSysPowerCode] [nvarchar](50) NULL,
	[strButtonID] [nvarchar](50) NULL,
	[strButtonName] [nvarchar](300) NULL,
	[strRemark] [nvarchar](50) NULL,
	[nPowerCodeType] [int] NULL,
 CONSTRAINT [PK_SM_ProjectPageButtonConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_PersonProjectSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonProjectSysPower] AS SELECT
            a.ID,
            b.PersonCode AS strPersonCode,
            c.strButtonID,
            c.strButtonName,
            c.strProjectSysPowerCode,
            c.nPowerCodeType,
            a.strProjectCode,
            a.strItemCode,
            a.nPageButtonConfigID,
            '0' AS strIsEnable
            FROM
            SM_RoleProjectSysPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.strRoleCode = b.RoleCode
            LEFT JOIN SM_ProjectPageButtonConfig AS c ON a.nPageButtonConfigID = c.ID UNION
            SELECT
            a.ID,
            a.strPersonCode,
            b.strButtonID,
            b.strButtonName,
            b.strProjectSysPowerCode,
            b.nPowerCodeType,
            a.strProjectCode,
            a.strItemCode,
            a.nPageButtonConfigID,
            '1' AS strIsEnable
            FROM
            SM_PersonProjectSysPower AS a
            LEFT JOIN SM_ProjectPageButtonConfig AS b ON a.nPageButtonConfigID = b.ID
GO
/****** Object:  View [dbo].[V_SM_PersonResourceForCode]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonResourceForCode] AS SELECT
            a.Title,
            b.Title AS subtitle,
            c.PersonCode,
            b.ResourceUrl,
            b.Parameter,
            c.DataPower,
            b.Code,
            c.CustomPower,
            a.ID
            FROM
            SM_SystemResource AS a
            LEFT OUTER JOIN SM_SystemResourceDtl AS b ON a.Code = b.SystemResourceCode
            LEFT OUTER JOIN SM_PersonDataPower AS c ON c.SystemResourceDtlCode = b.Code
GO
/****** Object:  View [dbo].[V_SM_PersonSuperior]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonSuperior] AS SELECT
            c.ID,
            c.Code,
            c.Name,
            c.Account,
            c.CorpCode,
            c.DelFlag,
            c.DeptCode,
            c.Duty,
            c.Email,
            c.Mobile,
            c.Password,
            c.PersonStatus,
            c.Position,
            c.Sex,
            c.WorkNum,
            c.OrderNo,
            c.Superior,
            d.Name AS SuperiorName,
            b.RoleCode,
            a.Name AS RoleName
            FROM
            SM_Person AS c
            LEFT OUTER JOIN SM_PersonRole_Rel AS b ON c.Code = b.PersonCode
            LEFT OUTER JOIN SM_Role AS a ON a.Code = b.RoleCode
            LEFT OUTER JOIN SM_Person AS d ON c.Superior = d.Code
GO
/****** Object:  View [dbo].[V_SM_PersonSuperiorRole]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonSuperiorRole] AS SELECT
            dd.ID,
            dd.Code,
            dd.Name,
            dd.Account,
            dd.CorpCode,
            dd.DelFlag,
            dd.DeptCode,
            dd.Duty,
            dd.Email,
            dd.Mobile,
            dd.Password,
            dd.PersonStatus,
            dd.Position,
            dd.Sex,
            dd.WorkNum,
            dd.OrderNo,
            dd.Superior,
            dd.SuperiorName,
            dd.DeptName,
            ee.Code1,
            RoleCode,
            RoleName,
            ff.Code2,
            ff.DepartCode,
            ff.DepartName
            FROM
            (
            SELECT
            c.ID,
            c.Code,
            c.Name,
            c.Account,
            c.CorpCode,
            c.DelFlag,
            c.DeptCode,
            c.Duty,
            c.Email,
            c.Mobile,
            c.Password,
            c.PersonStatus,
            c.Position,
            c.Sex,
            c.WorkNum,
            c.OrderNo,
            c.Superior,
            d.Name AS SuperiorName,
            e.Name AS DeptName
            FROM
            (
            SELECT
            ID,
            Code,
            Name,
            Sex,
            WorkNum,
            Account,
            Password,
            DeptCode,
            CorpCode,
            Duty,
            POSITION,
            Superior,
            Mobile,
            Email,
            OrderNo,
            PersonStatus,
            DelFlag,
            RandCode,
            LastPasswordChangeTime
            FROM
            SM_Person
            WHERE
            ( Account <> 'System' )
            OR ( Account IS NULL )) AS c
            LEFT OUTER JOIN SM_Person AS d ON c.Superior = d.Code
            LEFT OUTER JOIN SM_Department AS e ON c.DeptCode = e.Code
            ) AS dd
            LEFT OUTER JOIN /*dd【人员信息 + SuperName + DeptName】*/
            (
            SELECT
            Code AS Code1,
            RoleCode = (
            STUFF((
            SELECT
            ',' + RoleCode
            FROM
            (
            SELECT
            a.Code,
            c.Code AS RoleCode,
            c.Name AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Role WHERE DelFlag = '0' ) AS c ON b.RoleCode = c.Code
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            Code = aa.Code FOR xml path ( '' )),
            1,
            1,
            ''
            )),
            RoleName = (
            STUFF((
            SELECT
            ',' + RoleName
            FROM
            (
            SELECT
            a.Code,
            c.Code AS RoleCode,
            c.Name AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Role WHERE DelFlag = '0' ) AS c ON b.RoleCode = c.Code
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            Code = aa.Code
            ORDER BY
            RoleName FOR xml path ( '' )),
            1,
            1,
            ''
            ))
            FROM
            (
            SELECT
            a.Code,
            c_2.Code AS RoleCode,
            c_2.Name AS RoleName
            FROM
            SM_Person AS a
            LEFT OUTER JOIN SM_PersonRole_Rel AS b ON a.Code = b.PersonCode
            LEFT OUTER JOIN (
            SELECT
            ID,
            Code,
            Name,
            DESCRIBE,
            DelFlag
            FROM
            SM_Role
            WHERE
            ( DelFlag = '0' )) AS c_2 ON b.RoleCode = c_2.Code
            WHERE
            a.DelFlag = '0'
            ) AS aa
            GROUP BY
            Code
            ) AS ee ON dd.Code = ee.Code1
            LEFT OUTER JOIN /*ff【Code2 + DepartCode + DepartName】*/
            (
            SELECT
            Code AS Code2,
            DepartCode = (
            STUFF((
            SELECT
            ',' + DepartCode
            FROM
            (
            SELECT
            a.Code,
            c.Code AS DepartCode,
            c.Name AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.Code
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            Code = hh.Code FOR xml path ( '' )),
            1,
            1,
            ''
            )),
            DepartName = (
            STUFF((
            SELECT
            ',' + DepartName
            FROM
            (
            SELECT
            a.Code,
            c.Code AS DepartCode,
            c.Name AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.Code = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.Code
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            Code = hh.Code
            ORDER BY
            DepartName FOR xml path ( '' )),
            1,
            1,
            ''
            ))
            FROM
            (
            SELECT
            a.Code,
            c_1.Code AS DepartCode,
            c_1.Name AS DepartName
            FROM
            SM_Person AS a
            LEFT OUTER JOIN SM_PersonDepart_Rel AS b ON a.Code = b.PersonCode
            LEFT OUTER JOIN (
            SELECT
            ID,
            Code,
            Pcode,
            Name,
            Charge,
            OrderNo,
            IsCompany,
            IsProductionDept,
            DelFlag
            FROM
            SM_Department
            WHERE
            ( DelFlag = '0' )) AS c_1 ON b.DepartCode = c_1.Code
            WHERE
            a.DelFlag = '0'
            ) AS hh
            GROUP BY
            Code
            ) AS ff ON dd.Code = ff.Code2
GO
/****** Object:  View [dbo].[V_SM_PersonSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonSysPower] AS SELECT
            a.ID,
            a.SystemResourceDtlCode,
            a.PageButtonConfigID,
            b.PersonCode,
            c.strButtonID AS ButtonID,
            c.strButtonName AS ButtonName,
            c.nPowerCodeType,
            '0' AS IsEnable
            FROM
            SM_RoleSysPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode
            LEFT JOIN SM_ProjectPageButtonConfig AS c ON a.PageButtonConfigID = c.ID UNION
            SELECT
            a.ID,
            a.SystemResourceDtlCode,
            a.PageButtonConfigID,
            a.PersonCode,
            b.strButtonID AS ButtonID,
            b.strButtonName AS ButtonName,
            b.nPowerCodeType,
            '1' AS IsEnable
            FROM
            SM_PersonSysPower AS a
            LEFT JOIN SM_ProjectPageButtonConfig AS b ON a.PageButtonConfigID = b.ID
GO
/****** Object:  Table [dbo].[SM_ProjectArchitecture]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectArchitecture](
	[ID] [nvarchar](50) NOT NULL,
	[strProjectCode] [nvarchar](50) NOT NULL,
	[strPProjectCode] [nvarchar](50) NOT NULL,
	[strName] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[strIsFinalLeaf] [char](1) NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ProjectArchitecture] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectArchitecture_C]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_SM_ProjectArchitecture_C] ON [dbo].[SM_ProjectArchitecture]
(
	[strProjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_ProjectArchitectureFullPath]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_ProjectArchitectureFullPath] AS WITH T AS (
            SELECT
            ID,
            strProjectCode,
            strPProjectCode,
            strName,
            CAST (
            strName AS NVARCHAR ( MAX )) AS path,
            CAST (
            strProjectCode AS NVARCHAR ( MAX )) AS projectCode
            FROM
            SM_ProjectArchitecture
            WHERE
            ( strPProjectCode = '-1' )
            AND ( strDelFlag = '0' ) UNION ALL
            SELECT
            B.ID,
            B.strProjectCode,
            B.strPProjectCode,
            B.strName,
            T_2.path + '\' + B.strName AS path,
            T_2.projectCode + '\' + B.strProjectCode AS projectCode
            FROM
            SM_ProjectArchitecture AS B
            INNER JOIN T AS T_2 ON B.strPProjectCode = T_2.strProjectCode
            ) SELECT
            ID,
            strProjectCode,
            strPProjectCode,
            strName,
            path AS namePath,
            projectCode AS codePath
            FROM
            T AS T_1
GO
/****** Object:  Table [dbo].[SM_ProjectReportPlan]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectReportPlan](
	[ID] [nvarchar](50) NOT NULL,
	[strID] [nvarchar](80) NULL,
	[strName] [nvarchar](50) NULL,
	[strDescription] [nvarchar](300) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[strResourceUrl] [nvarchar](1000) NULL,
	[strReportServiceName] [nvarchar](110) NULL,
	[strGTGuid] [nvarchar](50) NULL,
	[strGTProject] [nvarchar](50) NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ProjectReportPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ReportPlan]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ReportPlan](
	[ID] [nvarchar](50) NOT NULL,
	[strInputDate] [datetime] NOT NULL,
	[strModifyDate] [datetime] NOT NULL,
	[strGTName] [nvarchar](64) NOT NULL,
	[strGTGuid] [nvarchar](50) NOT NULL,
	[strReportServiceA] [nvarchar](50) NOT NULL,
	[strReportServiceAName] [nvarchar](64) NOT NULL,
	[strReportServiceB] [nvarchar](50) NULL,
	[strReportServiceBName] [nvarchar](64) NULL,
	[strPlanName] [nvarchar](50) NOT NULL,
	[strPlanDescription] [nvarchar](50) NULL,
	[nPlanAttribute] [int] NOT NULL,
	[nIsSendPrinter] [int] NOT NULL,
	[nPrintCycle] [int] NOT NULL,
	[nMonth] [int] NULL,
	[nDay] [int] NULL,
	[nHour] [int] NULL,
	[nMinute] [int] NULL,
	[nMonthNumber] [int] NULL,
	[nWeekNumber] [int] NULL,
	[strReportTemplateID] [nvarchar](50) NOT NULL,
	[strReportTemplateName] [nvarchar](64) NULL,
	[strReportTemplateResourceUrl] [nvarchar](256) NOT NULL,
	[strDelFlag] [int] NOT NULL,
	[strIsSynchronize] [int] NULL,
 CONSTRAINT [PK_SM_ReportPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_ProjectReportPlan]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_ProjectReportPlan] AS SELECT
            c.ID,
            c.strID,
            c.strGTGuid,
            c.strProjectCode,
            c.nOrderNo,
            d.strPlanName,
            d.strPlanDescription,
            d.strReportTemplateResourceUrl,
            d.strGTName,
            d.strReportServiceAName,
            d.strReportServiceBName,
            c.strDelFlag
            FROM
            SM_ProjectReportPlan AS c
            INNER JOIN SM_ReportPlan AS d ON c.strID = d.ID
            AND c.strGTGuid = d.strGTGuid
GO
/****** Object:  Table [dbo].[SM_VideoAccount]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_VideoAccount](
	[ID] [nvarchar](50) NULL,
	[strAccountName] [nvarchar](50) NULL,
	[strAppKey] [nvarchar](50) NULL,
	[strAppSecret] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectVideo]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectVideo](
	[ID] [nvarchar](50) NOT NULL,
	[strGTGuid] [nvarchar](50) NULL,
	[strName] [nvarchar](50) NULL,
	[strDescription] [nvarchar](300) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[strResourceUrl] [nvarchar](1000) NULL,
	[strDevType] [nvarchar](50) NULL,
	[strUserName] [nvarchar](50) NULL,
	[strPassword] [nvarchar](50) NULL,
	[strDelFlag] [char](1) NOT NULL,
	[strAccountID] [nvarchar](50) NULL,
	[strSerialNum] [nvarchar](50) NULL,
 CONSTRAINT [PK_SM_ProjectVideo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_ProjectVideo]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_ProjectVideo] AS SELECT
            SM_ProjectVideo.ID,
            SM_ProjectVideo.strGTGuid,
            SM_ProjectVideo.strName,
            SM_ProjectVideo.strDescription,
            SM_ProjectVideo.strProjectCode,
            SM_ProjectVideo.nOrderNo,
            SM_ProjectVideo.strResourceUrl,
            SM_ProjectVideo.strDevType,
            SM_ProjectVideo.strUserName,
            SM_ProjectVideo.strPassword,
            SM_ProjectVideo.strDelFlag,
            SM_ProjectVideo.strAccountID,
            SM_ProjectVideo.strSerialNum,
            SM_VideoAccount.strAccountName
            FROM
            SM_ProjectVideo
            LEFT OUTER JOIN SM_VideoAccount ON SM_ProjectVideo.strAccountID = SM_VideoAccount.ID
GO
/****** Object:  Table [dbo].[SM_ReceiverGroupDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ReceiverGroupDtl](
	[ID] [nvarchar](50) NOT NULL,
	[PCode] [nvarchar](50) NOT NULL,
	[PersonCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_SM_RECEIVERGROUPDTL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_ReceiverGroupDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_ReceiverGroupDtl] AS SELECT
            a.PCode AS GroupCode,
            a.PersonCode,
            b.WorkNum,
            b.Sex,
            b.Name AS PersonName,
            b.Position,
            b.Mobile,
            b.Email,
            c.Name AS DeptName
            FROM
            SM_ReceiverGroupDtl AS a
            INNER JOIN SM_Person AS b ON a.PersonCode = b.Code
            INNER JOIN SM_Department AS c ON b.DeptCode = c.Code
            WHERE
            ( b.DelFlag = '0' )
            AND (
            c.DelFlag = '0')
GO
/****** Object:  View [dbo].[V_SM_RolePerson]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_RolePerson] AS SELECT
            a.Code AS RoleCode,
            c.Code,
            c.Name,
            c.Sex,
            c.WorkNum,
            c.Account,
            c.Duty,
            c.Position,
            c.Superior,
            (
            SELECT
            Name
            FROM
            SM_Person AS d
            WHERE
            ( Code = c.Superior )) AS SuperiorName,
            c.Mobile,
            c.Email,
            c.OrderNo,
            b.ID
            FROM
            SM_PersonRole_Rel AS b
            LEFT OUTER JOIN SM_Role AS a ON a.Code = b.RoleCode
            LEFT OUTER JOIN SM_Person AS c ON c.Code = b.PersonCode
            WHERE
            ( a.DelFlag = 0 )
            AND (
            c.DelFlag = 0)
GO
/****** Object:  View [dbo].[V_SM_RoleProjectSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_RoleProjectSysPower] AS SELECT
            a.ID,
            a.strRoleCode,
            b.strButtonID,
            b.strButtonName,
            b.strProjectSysPowerCode,
            b.nPowerCodeType,
            a.strProjectCode,
            a.strItemCode,
            a.nPageButtonConfigID,
            '1' AS strIsEnable
            FROM
            SM_RoleProjectSysPower AS a
            LEFT OUTER JOIN SM_ProjectPageButtonConfig AS b ON a.nPageButtonConfigID = b.ID
GO
/****** Object:  View [dbo].[V_SM_RoleSysPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_RoleSysPower] AS SELECT
            a.ID,
            a.RoleCode,
            a.SystemResourceDtlCode,
            a.PageButtonConfigID,
            b.strButtonID AS ButtonID,
            b.strButtonName AS ButtonName,
            b.nPowerCodeType,
            '1' AS IsEnable
            FROM
            SM_RoleSysPower AS a
            LEFT OUTER JOIN SM_ProjectPageButtonConfig AS b ON a.PageButtonConfigID = b.ID
GO
/****** Object:  View [dbo].[V_SM_SystemResourceAll]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_SystemResourceAll] AS SELECT
            id,
            Code,
            PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            '' AS Type,
            '' AS ResourceUrl,
            '' AS Parameter,
            IsHide,
            '' AS ExternalNetwork
            FROM
            SM_SystemResource UNION
            SELECT
            id,
            Code,
            SystemResourceCode AS PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            '' AS Type,
            ResourceUrl,
            Parameter,
            IsHide,
            '' AS ExternalNetwork
            FROM
            SM_SystemResourceDtl UNION
            SELECT
            a.id,
            Code,
            SystemResourceCode AS PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            Type,
            path AS ResourceUrl,
            Parameter,
            IsHide,
            ExternalNetwork
            FROM
            SM_SystemResourceRmisDtl AS a
            LEFT JOIN t_deply b ON a.DeployID = b.id
GO
/****** Object:  View [dbo].[V_SM_SystemResourceRmisDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_SystemResourceRmisDtl] AS SELECT
            a.Code,
            a.DelFlag,
            a.ID,
            a.IsHide,
            a.IsSysMenu,
            a.OrderNo,
            a.Parameter,
            a.ResourceType,
            a.SystemResourceCode,
            a.Title,
            a.EnTitle,
            a.Platform,
            a.ConfCodeVou,
            b.path AS ResourceUrl,
            b.Id AS DeployID,
            '' AS ResourceUrlApp
            FROM
            SM_SystemResourceRmisDtl AS a
            LEFT OUTER JOIN t_deply AS b ON a.DeployID = b.Id
GO
/****** Object:  View [dbo].[V_SM_SystemResourceDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_SystemResourceDtl] AS SELECT
            ID,
            Code,
            SystemResourceCode,
            Title,
            EnTitle,
            ResourceType,
            ResourceUrl,
            ResourceUrlApp,
            Parameter,
            OrderNo,
            IsHide,
            IsSysMenu,
            Platform,
            ConfCodeVou,
            DelFlag,
            '' AS DeployID
            FROM
            SM_SystemResourceDtl UNION
            SELECT
            ID,
            Code,
            SystemResourceCode,
            Title,
            EnTitle,
            ResourceType,
            ResourceUrl,
            ResourceUrlApp,
            Parameter,
            OrderNo,
            IsHide,
            IsSysMenu,
            Platform,
            ConfCodeVou,
            DelFlag,
            DeployID
            FROM
            V_SM_SystemResourceRmisDtl
GO
/****** Object:  View [dbo].[V_SM_SystemResourcePowerDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_SystemResourcePowerDtl] AS SELECT DISTINCT
            b.PersonCode,
            a.ID,
            a.Code,
            a.SystemResourceCode,
            a.Title,
            a.EnTitle,
            a.ResourceType,
            a.ResourceUrl,
            a.ResourceUrlApp,
            a.Parameter,
            a.OrderNo,
            a.IsHide,
            a.IsSysMenu,
            a.Platform,
            a.DeployID,
            a.ConfCodeVou,
            a.DelFlag
            FROM
            V_SM_SystemResourceDtl AS a
            CROSS JOIN V_SM_PersonDataPower AS b
            WHERE
            (
            a.Code IN (
            SELECT
            SystemResourceDtlCode
            FROM
            V_SM_PersonDataPower AS c
            WHERE
            ( a.Code = SystemResourceDtlCode )))
            OR (
            a.IsSysMenu <> '1')
GO
/****** Object:  Table [dbo].[t_BD_ArrangePeriod]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_ArrangePeriod](
	[ID] [nvarchar](50) NOT NULL,
	[WorkDate] [date] NULL,
	[ShiftCode] [nvarchar](50) NULL,
	[TeamCode] [nvarchar](50) NULL,
	[Dept] [nvarchar](50) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_BD_ArrangePeriod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_BD_Team]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_Team](
	[ID] [nvarchar](50) NOT NULL,
	[TeamCode] [nvarchar](50) NOT NULL,
	[TeamName] [nvarchar](50) NULL,
	[Leader] [nvarchar](50) NULL,
	[Dept] [nvarchar](50) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_Team] PRIMARY KEY CLUSTERED 
(
	[TeamCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_BD_WorkShift]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_WorkShift](
	[ID] [nvarchar](50) NOT NULL,
	[ShiftCode] [nvarchar](50) NOT NULL,
	[ShiftName] [nvarchar](50) NOT NULL,
	[BeginTime] [char](5) NULL,
	[EndTime] [char](5) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_WorkShift] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_ArrangePeriod]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_ArrangePeriod] AS SELECT
            a.ID,
            CONVERT ( VARCHAR ( 10 ), a.WorkDate, 121 ) AS WorkDate,
            a.ShiftCode,
            a.TeamCode,
            a.Dept,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            b.BeginTime,
            b.EndTime,
            b.ShiftName,
            c.TeamName
            FROM
            t_BD_ArrangePeriod AS a
            LEFT OUTER JOIN t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode
            AND b.DelFlag = 0
            LEFT OUTER JOIN t_BD_Team AS c ON a.TeamCode = c.TeamCode
            AND c.DelFlag = 0
GO
/****** Object:  Table [dbo].[t_BD_ArrangeResult]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_ArrangeResult](
	[ID] [nvarchar](50) NOT NULL,
	[WorkDate] [date] NOT NULL,
	[ShiftCode] [nvarchar](50) NOT NULL,
	[TeamCode] [nvarchar](50) NOT NULL,
	[Dept] [nvarchar](50) NOT NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_ArrangeResult] PRIMARY KEY CLUSTERED 
(
	[WorkDate] ASC,
	[ShiftCode] ASC,
	[TeamCode] ASC,
	[Dept] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_ArrangeResult]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_ArrangeResult] AS SELECT
            a.ID,
            CONVERT ( VARCHAR ( 10 ), a.WorkDate, 121 ) AS WorkDate,
            a.ShiftCode,
            a.TeamCode,
            a.Dept,
            a.InputCode,
            a.InputDate,
            a.DelFlag,
            b.BeginTime,
            b.EndTime,
            b.ShiftName,
            c.TeamName,
            c.Leader,
            d.Name AS LeaderName,
            e.Name AS DeptName
            FROM
            t_BD_ArrangeResult AS a
            LEFT OUTER JOIN t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode
            AND b.DelFlag = '0'
            LEFT OUTER JOIN t_BD_Team AS c ON a.TeamCode = c.TeamCode
            AND c.DelFlag = '0'
            LEFT OUTER JOIN SM_Person AS d ON c.Leader = d.Code
            AND d.DelFlag = '0'
            LEFT OUTER JOIN SM_Department AS e ON a.DeptCode = e.Code
            AND e.DelFlag = '0'
GO
/****** Object:  Table [dbo].[t_BD_Dict]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_Dict](
	[ID] [nvarchar](50) NOT NULL,
	[DictCode] [nvarchar](50) NOT NULL,
	[DictName] [nvarchar](50) NOT NULL,
	[TypeCode] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[Inputcode] [nvarchar](50) NULL,
	[Inputdate] [datetime] NULL,
	[Deptcode] [nvarchar](50) NULL,
	[Corpcode] [nvarchar](50) NULL,
	[Modifycode] [nvarchar](50) NULL,
	[Modifydate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_Dict] PRIMARY KEY CLUSTERED 
(
	[DictCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_BD_DictDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_DictDtl](
	[ID] [nvarchar](50) NOT NULL,
	[DictDtlCode] [nvarchar](50) NOT NULL,
	[DictDtlName] [nvarchar](50) NOT NULL,
	[DictCode] [nvarchar](50) NOT NULL,
	[SeqNo] [int] NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[Inputcode] [nvarchar](50) NULL,
	[Inputdate] [datetime] NULL,
	[Deptcode] [nvarchar](50) NULL,
	[Corpcode] [nvarchar](50) NULL,
	[Modifycode] [nvarchar](50) NULL,
	[Modifydate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_DictDtl] PRIMARY KEY CLUSTERED 
(
	[DictDtlCode] ASC,
	[DictCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_Dict]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Dict] AS SELECT
            d.ID,
            d.DictCode,
            d.DictName,
            d.TypeCode,
            d.Remark,
            d.DelFlag,
            dd.ID AS dtlId,
            dd.DictDtlName AS dtlName,
            dd.DictDtlCode AS dtlCode,
            dd.SeqNo,
            dd.Remark AS dtlRemark
            FROM
            t_BD_Dict AS d
            INNER JOIN t_BD_DictDtl AS dd ON d.DictCode = dd.DictCode
            AND dd.DelFlag = 0
GO
/****** Object:  View [dbo].[V_BD_GetTeamInfo]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_GetTeamInfo] AS SELECT
            a.WorkDate,
            a.ShiftCode,
            a.TeamCode,
            a.Dept,
            a.DelFlag,
            b.ShiftName,
            b.BeginTime,
            b.EndTime,
            c.TeamName,
            c.Leader,
            CONVERT ( VARCHAR ( 100 ), a.WorkDate, 23 ) + ' ' + b.BeginTime + ':00' AS BeginDate,
            CASE

            WHEN BeginTime > EndTime THEN
            CONVERT ( VARCHAR ( 100 ), DATEADD ( DAY, 1, WorkDate ), 23 ) + ' ' + EndTime + ':00' ELSE CONVERT ( VARCHAR ( 100 ), WorkDate, 23 ) + ' ' + EndTime + ':00'
            END AS EndDate
            FROM
            t_BD_ArrangeResult AS a
            INNER JOIN t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode
            AND b.DelFlag = '0'
            INNER JOIN t_BD_Team AS c ON a.TeamCode = c.TeamCode
            AND c.DelFlag = '0'
            WHERE
            ( a.DelFlag = '0' )
GO
/****** Object:  Table [dbo].[t_BD_Material]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_Material](
	[ID] [nvarchar](50) NOT NULL,
	[MatCode] [nvarchar](50) NOT NULL,
	[MatName] [nvarchar](200) NOT NULL,
	[Spec] [nvarchar](200) NULL,
	[Model] [nvarchar](200) NULL,
	[FirstUnitCode] [nvarchar](50) NULL,
	[SecondUnitCode] [nvarchar](50) NULL,
	[PYCode] [nvarchar](50) NULL,
	[UseFlag] [nchar](1) NULL,
	[MatType] [nvarchar](50) NULL,
	[MaxInventory] [decimal](22, 6) NULL,
	[MinInventory] [decimal](22, 6) NULL,
	[SafeInventory] [decimal](22, 6) NULL,
	[IsSetBatch] [int] NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [nchar](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_Material] PRIMARY KEY CLUSTERED 
(
	[MatCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_BD_UnitDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_UnitDtl](
	[ID] [nvarchar](50) NOT NULL,
	[UnitDtlCode] [nvarchar](50) NOT NULL,
	[UnitDtlName] [nvarchar](50) NOT NULL,
	[UnitCode] [nvarchar](50) NOT NULL,
	[Symbol] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[Inputcode] [nvarchar](50) NULL,
	[Inputdate] [datetime] NULL,
	[Deptcode] [nvarchar](50) NULL,
	[Corpcode] [nvarchar](50) NULL,
	[Modifycode] [nvarchar](50) NULL,
	[Modifydate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_UnitDtl] PRIMARY KEY CLUSTERED 
(
	[UnitDtlCode] ASC,
	[UnitCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_Mat]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Mat] AS SELECT
            a.ID,
            a.MatName,
            a.MatCode,
            a.Spec,
            a.Model,
            a.FirstUnitCode,
            a.SecondUnitCode,
            a.PYCode,
            a.UseFlag,
            a.MaxInventory,
            a.MinInventory,
            a.SafeInventory,
            a.Remark,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            a.IsSetBatch,
            b.UnitDtlName AS FirstUnitName,
            c.UnitDtlName AS SecondUnitName
            FROM
            t_BD_Material AS a
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON a.FirstUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS c ON a.SecondUnitCode = c.UnitDtlCode
            AND c.DelFlag = 0
GO
/****** Object:  Table [dbo].[t_BD_MaterialRelType]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_MaterialRelType](
	[ID] [nvarchar](50) NOT NULL,
	[TypeCode] [nvarchar](50) NOT NULL,
	[MatCode] [nvarchar](50) NOT NULL,
	[DelFlag] [char](1) NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_MaterialRelType] PRIMARY KEY CLUSTERED 
(
	[TypeCode] ASC,
	[MatCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_Material]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Material] AS SELECT
            a.ID,
            a.MatName,
            a.MatCode,
            a.Spec,
            a.Model,
            a.FirstUnitCode,
            a.SecondUnitCode,
            a.PYCode,
            a.UseFlag,
            a.MaxInventory,
            a.MinInventory,
            a.SafeInventory,
            a.Remark,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            b.UnitDtlName AS FirstUnitName,
            c.UnitDtlName AS SecondUnitName,
            t.TypeCode
            FROM
            t_BD_Material AS a
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON a.FirstUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS c ON a.SecondUnitCode = c.UnitDtlCode
            AND c.DelFlag = 0
            LEFT OUTER JOIN t_BD_MaterialRelType AS t ON a.MatCode = t.MatCode
            AND t.DelFlag = 0
GO
/****** Object:  Table [dbo].[t_BD_MaterialAttr]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_MaterialAttr](
	[ID] [nvarchar](50) NOT NULL,
	[AttrCode] [nvarchar](50) NOT NULL,
	[MatCode] [nvarchar](50) NOT NULL,
	[AttrName] [nvarchar](50) NOT NULL,
	[AttrValue] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_MaterialAttr] PRIMARY KEY CLUSTERED 
(
	[AttrCode] ASC,
	[MatCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_MaterialAttr]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_MaterialAttr] AS SELECT
            b.ID,
            b.MatCode,
            b.AttrCode,
            b.AttrName,
            b.AttrValue,
            b.Remark,
            b.InputCode,
            b.InputDate,
            a.DelFlag,
            a.Spec
            FROM
            t_BD_Material AS a
            INNER JOIN t_BD_MaterialAttr AS b ON a.MatCode = b.MatCode
            AND b.DelFlag = 0
GO
/****** Object:  View [dbo].[V_BD_MaterialType]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_MaterialType] AS SELECT
            t.ID,
            m.MatName,
            m.MatCode,
            m.Spec,
            m.Model,
            m.FirstUnitCode,
            m.SecondUnitCode,
            v.DelFlag,
            v.TypeCode,
            v.dtlId,
            v.dtlCode,
            a.UnitDtlName AS FirstUnitName,
            b.UnitDtlName AS SecondUnitName,
            v.dtlCode AS MatType
            FROM
            V_BD_Dict AS v
            INNER JOIN t_BD_MaterialRelType AS t ON v.dtlCode = t.TypeCode
            AND t.DelFlag = 0
            INNER JOIN t_BD_Material AS m ON t.MatCode = m.MatCode
            AND m.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS a ON m.FirstUnitCode = a.UnitDtlCode
            AND a.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON m.SecondUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0
            WHERE
            ( v.DictCode = 'MatType' )
            AND (
            m.UseFlag = '1')
GO
/****** Object:  View [dbo].[V_BD_Team]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Team] AS SELECT
            a.ID,
            a.TeamCode,
            a.TeamName,
            a.Leader,
            a.Dept,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            b.Name AS LeaderName
            FROM
            t_BD_Team AS a
            LEFT OUTER JOIN SM_Person AS b ON a.Leader = b.Code
GO
/****** Object:  View [dbo].[V_BD_PersonDeptInfo]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_PersonDeptInfo] AS SELECT
            a.PersonCode,
            a.DeptCode,
            b.Name
            FROM
            SM_PersonDeptPower a
            INNER JOIN SM_Department b ON a.DeptCode = b.Code
            AND b.DelFlag = '0' UNION
            SELECT
            b.Code AS PersonCode,
            b.DeptCode,
            a.Name
            FROM
            SM_Department a
            INNER JOIN SM_Person b ON a.Code = b.DeptCode
GO
/****** Object:  View [dbo].[V_BD_StartDate]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_StartDate] AS SELECT CONVERT
            ( VARCHAR ( 10 ), MIN ( t.WorkDate ), 121 ) AS WorkDate,
            t.Dept
            FROM
            t_BD_ArrangePeriod t
            WHERE
            t.DelFlag = '0'
            GROUP BY
            t.Dept
GO
/****** Object:  Table [dbo].[t_BD_Supplier]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_Supplier](
	[ID] [nvarchar](50) NOT NULL,
	[SupplierCode] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[ContactInfo] [nvarchar](100) NULL,
	[ShortName] [nvarchar](50) NULL,
	[Place] [nvarchar](200) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_BD_SupplierMaterialDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_SupplierMaterialDtl](
	[ID] [nvarchar](50) NOT NULL,
	[SupplierCode] [nvarchar](50) NOT NULL,
	[MatCode] [nvarchar](50) NOT NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_SupplierMaterialDtl] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC,
	[MatCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_SupplierMaterialDtl]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_SupplierMaterialDtl] AS SELECT
            dtl.ID,
            dtl.SupplierCode,
            sup.SupplierName,
            mat.MatName,
            mat.MatCode,
            mat.Spec,
            mat.Model,
            mat.FirstUnitCode,
            mat.SecondUnitCode,
            mat.DelFlag,
            a.UnitDtlName AS FirstUnitName,
            b.UnitDtlName AS SecondUnitName
            FROM
            t_BD_SupplierMaterialDtl AS dtl
            INNER JOIN t_BD_Material AS mat ON dtl.MatCode = mat.MatCode
            AND mat.DelFlag = 0
            INNER JOIN t_BD_Supplier AS sup ON dtl.SupplierCode = sup.SupplierCode
            AND sup.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS a ON mat.FirstUnitCode = a.UnitDtlCode
            AND a.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON mat.SecondUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0
GO
/****** Object:  Table [dbo].[t_clctr]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_clctr](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](16) NULL,
	[description] [nvarchar](32) NULL,
	[version] [int] NULL,
	[idletimeout] [int] NULL,
	[syncrate] [int] NULL,
	[updaterate] [int] NULL,
	[compensation] [int] NULL,
 CONSTRAINT [PK_T_CLCTR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_tag]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_tag](
	[id] [nvarchar](50) NOT NULL,
	[clctr] [int] NULL,
	[name] [nvarchar](60) NULL,
	[ioaddr] [nvarchar](76) NULL,
	[type] [tinyint] NULL,
	[version] [int] NULL,
	[arcmode] [int] NULL,
	[arcto] [int] NULL,
	[arcoff] [int] NULL,
	[clctrate] [int] NULL,
	[clctto] [int] NULL,
	[description] [nvarchar](32) NULL,
	[unit] [nvarchar](16) NULL,
	[arcddbnd] [float] NULL,
	[clctddbnd] [float] NULL,
	[minimal] [float] NULL,
	[maximal] [float] NULL,
	[lowlimit] [float] NULL,
	[highlimit] [float] NULL,
	[lololimit] [float] NULL,
	[hihilimit] [float] NULL,
 CONSTRAINT [PK_T_TAG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_Tag]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Tag] AS SELECT
            t_tag.id,
            t_tag.clctr,
            t_tag.name,
            t_tag.ioaddr,
            t_tag.type,
            t_tag.version,
            t_tag.arcmode,
            t_tag.arcto,
            t_tag.arcoff,
            t_tag.clctrate,
            t_tag.clctto,
            t_tag.description,
            t_tag.unit,
            t_tag.arcddbnd,
            t_tag.clctddbnd,
            t_tag.minimal,
            t_tag.maximal,
            t_tag.lowlimit,
            t_tag.highlimit,
            t_tag.lololimit,
            t_tag.hihilimit,
            t_clctr.name AS clctrname,
            t_clctr.name + '.' + t_tag.name AS fullname
            FROM
            t_clctr
            INNER JOIN t_tag ON t_clctr.id = t_tag.clctr
GO
/****** Object:  Table [dbo].[t_BD_Member]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_Member](
	[ID] [nvarchar](50) NOT NULL,
	[TeamCode] [nvarchar](50) NOT NULL,
	[PersonCode] [nvarchar](50) NOT NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_Member] PRIMARY KEY CLUSTERED 
(
	[PersonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_Member]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Member] AS SELECT
            a.ID,
            a.TeamCode,
            a.PersonCode,
            a.DelFlag,
            b.Name AS PersonName,
            b.Sex,
            b.WorkNum,
            b.Account,
            b.DeptCode,
            b.CorpCode,
            b.Duty,
            b.Position,
            b.Superior,
            b.Mobile,
            b.Email,
            b.PersonStatus,
            c.TeamName
            FROM
            t_BD_Member AS a
            LEFT OUTER JOIN SM_Person AS b ON a.PersonCode = b.Code
            LEFT OUTER JOIN V_BD_Team AS c ON a.TeamCode = c.TeamCode
GO
/****** Object:  Table [dbo].[t_BD_UnitConv]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_UnitConv](
	[ID] [nvarchar](50) NOT NULL,
	[MatCode] [nvarchar](50) NOT NULL,
	[BeforeConvCode] [nvarchar](50) NOT NULL,
	[AfterConvCode] [nvarchar](50) NOT NULL,
	[ScaledValue] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[DeptCode] [nvarchar](50) NULL,
	[CorpCode] [nvarchar](50) NULL,
	[ModifyCode] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_UnitConv] PRIMARY KEY CLUSTERED 
(
	[MatCode] ASC,
	[BeforeConvCode] ASC,
	[AfterConvCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_UnitConv]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_UnitConv] AS SELECT
            a.ID,
            a.MatCode,
            a.BeforeConvCode,
            a.AfterConvCode,
            a.ScaledValue,
            a.Remark,
            a.DelFlag,
            b.UnitDtlName AS BeforeConvName,
            c.UnitDtlName AS AfterConvName
            FROM
            t_BD_UnitConv AS a
            INNER JOIN t_BD_Material AS m ON a.MatCode = m.MatCode
            AND m.DelFlag = 0
            INNER JOIN t_BD_UnitDtl AS b ON a.BeforeConvCode = b.UnitDtlCode
            AND b.DelFlag = 0
            INNER JOIN t_BD_UnitDtl AS c ON a.AfterConvCode = c.UnitDtlCode
            AND c.DelFlag = 0
GO
/****** Object:  Table [dbo].[CF_Alarm]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_Alarm](
	[ID] [nvarchar](50) NOT NULL,
	[nAlarmType] [int] NULL,
	[nAlarmState] [int] NULL,
	[nAlarmlevel] [int] NULL,
	[strEventTime] [datetime] NULL,
	[strTagName] [nvarchar](100) NULL,
	[strTagDes] [nvarchar](128) NULL,
	[strArea] [nvarchar](64) NOT NULL,
	[strDevice] [nvarchar](64) NOT NULL,
	[strUnit] [nvarchar](64) NOT NULL,
	[strMsgDes] [nvarchar](100) NULL,
	[fAlarmlimit] [float] NULL,
	[strAlarmValue] [nvarchar](30) NULL,
	[strRecoveryTime] [datetime] NULL,
	[strAckedTime] [datetime] NULL,
	[strAckedComment] [nvarchar](255) NULL,
	[nSource] [int] NULL,
	[strIsHide] [char](1) NULL,
	[strNodeDomain] [nvarchar](255) NULL,
	[strTypeName] [nvarchar](10) NULL,
	[strAlarmTypeDes] [nvarchar](60) NULL,
	[nPushStatus] [int] NULL,
	[strAlarmLevelDes] [nvarchar](30) NULL,
	[nDomainNum] [int] NULL,
 CONSTRAINT [PK_CF_Alarm] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CF_Alarm_C]    Script Date: 2019/12/17 16:46:14 ******/
CREATE CLUSTERED INDEX [IX_CF_Alarm_C] ON [dbo].[CF_Alarm]
(
	[strTagName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CF_Alarm]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CF_Alarm] AS SELECT
            SM_ProjectArchitecture.strProjectCode,
            SM_ProjectArchitecture.strName AS strProjectName,
            CF_Alarm.ID,
            CF_Alarm.nAlarmType,
            CF_Alarm.nAlarmState,
            CF_Alarm.nAlarmlevel,
            CF_Alarm.strEventTime,
            CF_Alarm.strTagName,
            CF_Alarm.strTagDes,
            CF_Alarm.strArea,
            CF_Alarm.strDevice,
            CF_Alarm.strUnit,
            CF_Alarm.strMsgDes,
            CF_Alarm.fAlarmlimit,
            CF_Alarm.strAlarmValue,
            CF_Alarm.strRecoveryTime,
            CF_Alarm.strAckedTime,
            CF_Alarm.strAckedComment,
            CF_Alarm.nSource,
            CF_Alarm.strIsHide,
            CF_Alarm.strNodeDomain,
            CF_Alarm.strTypeName,
            CF_Alarm.strAlarmTypeDes,
            CF_Alarm.nPushStatus,
            CF_Alarm.strAlarmLevelDes,
            CF_Alarm.nDomainNum
            FROM
            SM_ProjectArchitecture
            INNER JOIN SM_ProjectTag ON SM_ProjectArchitecture.strDelFlag = '0'
            AND SM_ProjectArchitecture.strProjectCode = SM_ProjectTag.strProjectCode
            INNER JOIN CF_Alarm ON SM_ProjectTag.strName = CF_Alarm.strTagName
            OR SM_ProjectTag.strName = CF_Alarm.strNodeDomain
GO
/****** Object:  Table [dbo].[CF_NodeState]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_NodeState](
	[ID] [nvarchar](50) NOT NULL,
	[nCPULoad] [int] NOT NULL,
	[fTemperature] [float] NOT NULL,
	[nMemoryLoad] [int] NOT NULL,
	[nState] [int] NOT NULL,
	[nNodeType] [int] NOT NULL,
	[nNodePCID] [int] NULL,
	[strStateTime] [datetime] NOT NULL,
	[strSerialNum] [nvarchar](20) NULL,
	[fNetworkALoad] [float] NULL,
	[fNetworkBLoad] [float] NULL,
 CONSTRAINT [PK_NODESTATEID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CF_ProcessState]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_ProcessState](
	[ID] [nvarchar](50) NOT NULL,
	[nProcessID] [int] NOT NULL,
	[nNodePCID] [int] NOT NULL,
	[nState] [int] NOT NULL,
	[strProcessName] [nvarchar](100) NOT NULL,
	[strStateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PROCESSSTATEID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CF_NodeState]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CF_NodeState] AS SELECT
            ID,
            CASE

            WHEN nNodeType = 3 THEN
            strSerialNum ELSE CAST (
            nNodePCID AS nvarchar ( 20 ))
            END AS nNodePCID,
            nCPULoad,
            fTemperature,
            nMemoryLoad,
            nState,
            CASE

            WHEN nState = 1 THEN
            '正常' ELSE '不正常'
            END AS StateName,
            nNodeType,
            CASE

            WHEN nNodeType = 0 THEN
            '普通节点'
            WHEN nNodeType = 1 THEN
            '网闸安全侧'
            WHEN nNodeType = 2 THEN
            '网闸开放侧'
            WHEN nNodeType = 3 THEN
            '云卡'
            END AS NodeTypeName,
            strStateTime,
            (
            SELECT COUNT
            ( 0 ) AS Expr1
            FROM
            CF_ProcessState
            WHERE
            ( nNodePCID = A.nNodePCID )) AS IsHaveDetail
            FROM
            CF_NodeState AS A
GO
/****** Object:  Table [dbo].[CF_ServiceState]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_ServiceState](
	[ID] [nvarchar](50) NOT NULL,
	[nNodePCID] [int] NOT NULL,
	[nState] [int] NOT NULL,
	[strServiceName] [nvarchar](100) NOT NULL,
	[strProcessName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SERVICESTATEID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CF_ProcessState]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CF_ProcessState] AS SELECT
            ID,
            nNodePCID,
            nProcessID,
            strProcessName,
            nState,
            CASE

            WHEN nState = 1 THEN
            '正常' ELSE '不正常'
            END AS StateName,
            strStateTime,
            (
            SELECT COUNT
            ( 0 ) AS Expr1
            FROM
            CF_ServiceState
            WHERE
            ( strProcessName = A.strProcessName )
            AND ( nNodePCID = A.nNodePCID )
            AND ( A.strProcessName LIKE '%IOSERVER%' )) AS IsHaveDetail
            FROM
            CF_ProcessState AS A
GO
/****** Object:  View [dbo].[V_CF_ServiceState]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CF_ServiceState] AS SELECT
            ID,
            nNodePCID,
            strProcessName,
            strServiceName,
            nState,
            CASE

            WHEN nState = 1 THEN
            '正常' ELSE '不正常'
            END AS StateName
            FROM
            CF_ServiceState AS A
GO
/****** Object:  Table [dbo].[SM_Biz]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_Biz](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[CodeLength] [int] NULL,
	[Prefix] [nvarchar](20) NULL,
	[Suffix] [nvarchar](10) NULL,
	[CodeOrder] [nvarchar](10) NULL,
	[ModuleCode] [nvarchar](50) NULL,
	[ValueSource] [nvarchar](10) NULL,
	[ISYMD] [char](1) NULL,
	[MaxCode] [nvarchar](10) NULL,
	[MinCode] [nvarchar](10) NULL,
	[SerialEntity] [nvarchar](10) NULL,
	[SerialTimeGran] [nvarchar](10) NULL,
	[PolishChar] [nvarchar](1) NULL,
	[PolishRule] [nvarchar](10) NULL,
	[Name] [nvarchar](20) NULL,
	[Radix] [nvarchar](10) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[DeptCode] [nvarchar](50) NOT NULL,
	[CorpCode] [nvarchar](50) NOT NULL,
	[ModifyCode] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BD_BIZ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_Biz]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_Biz] AS SELECT
            a.Code,
            a.CodeLength,
            a.CodeOrder,
            a.CorpCode,
            a.DelFlag,
            a.DeptCode,
            a.ID,
            a.InputCode,
            a.InputDate,
            a.ISYMD,
            ( CASE a.ISYMD WHEN '0' THEN '否' WHEN '1' THEN '是' END ) AS ISYMDName,
            a.MaxCode,
            a.MinCode,
            a.ModifyCode,
            a.ModifyDate,
            a.ModuleCode,
            a.Name,
            a.PolishChar,
            a.PolishRule,
            ( CASE a.PolishRule WHEN '0' THEN '左补' WHEN '1' THEN '右补' WHEN '2' THEN '不补' END ) AS PolishRuleName,
            a.Prefix,
            a.Radix,
            ( CASE a.Radix WHEN '0' THEN '二进制' WHEN '1' THEN '八进制' WHEN '2' THEN '十进制' WHEN '3' THEN '十六进制' END ) AS RadixName,
            a.Remark,
            a.SerialEntity,
            a.SerialTimeGran,
            ( CASE a.SerialTimeGran WHEN '0' THEN '日' WHEN '1' THEN '月' WHEN '2' THEN '年' ELSE '无' END ) AS SerialTimeGranName,
            a.Suffix,
            a.ValueSource,
            b.Title
            FROM
            SM_Biz AS a
            LEFT OUTER JOIN SM_SystemResourceDtl AS b ON a.ModuleCode = b.Code
GO
/****** Object:  View [dbo].[V_SM_Department]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_Department] AS SELECT
            ID,
            Code,
            Pcode,
            Name,
            Charge,
            OrderNo,
            IsCompany,
            IsProductionDept,
            DelFlag,
            '' AS hasAuthority
            FROM
            SM_Department
GO
/****** Object:  View [dbo].[V_SM_DepartmentPerson]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_DepartmentPerson] AS SELECT
            c.ID,
            c.Code,
            c.Name,
            c.Pcode,
            c.Charge AS PersonCode,
            d.Name AS Charge,
            c.OrderNo,
            c.IsCompany,
            c.IsProductionDept,
            c.DelFlag
            FROM
            SM_Department AS c
            LEFT OUTER JOIN SM_Person AS d ON c.Charge = d.Code
GO
/****** Object:  View [dbo].[V_SM_DeployDataPower]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_DeployDataPower] AS SELECT
            b.Parameter,
            b.DeployID,
            c.path,
            c.type,
            c.pid,
            a.PersonCode
            FROM
            SM_PersonDataPower AS a
            INNER JOIN SM_SystemResourceRmisDtl AS b ON a.SystemResourceDtlCode = b.Code
            AND b.DelFlag = '0'
            INNER JOIN t_deply AS c ON b.DeployID = c.Id
GO
/****** Object:  View [dbo].[V_SM_DeptPerson]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_DeptPerson] AS SELECT
            c.ID,
            c.Code,
            c.Name,
            c.DeptCode,
            d.Name AS DeptName,
            c.WorkNum,
            c.Account,
            c.OrderNo
            FROM
            (
            SELECT
            ID,
            Code,
            Name,
            Sex,
            WorkNum,
            Account,
            Password,
            DeptCode,
            CorpCode,
            Duty,
            POSITION,
            Superior,
            Mobile,
            Email,
            OrderNo,
            PersonStatus,
            DelFlag
            FROM
            SM_Person
            WHERE
            ( Code <> 'System' )) AS c
            LEFT OUTER JOIN SM_Department AS d ON c.DeptCode = d.Code
            WHERE
            ( d.DelFlag = '0' )
            AND (
            c.DelFlag = '0')
GO
/****** Object:  View [dbo].[V_SM_GetAllRoleForCode]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_GetAllRoleForCode] AS SELECT
            a.Code AS RoleCode,
            b.ID,
            c.Code
            FROM
            SM_PersonRole_Rel AS b
            LEFT OUTER JOIN SM_Role AS a ON a.Code = b.RoleCode
            LEFT OUTER JOIN SM_Person AS c ON c.Code = b.PersonCode
GO
/****** Object:  Table [dbo].[CF_AlarmHis]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_AlarmHis](
	[ID] [nvarchar](50) NOT NULL,
	[nAlarmType] [int] NULL,
	[nAlarmState] [int] NULL,
	[nAlarmlevel] [int] NULL,
	[strEventTime] [datetime] NULL,
	[strTagName] [nvarchar](100) NULL,
	[strTagDes] [nvarchar](128) NOT NULL,
	[strArea] [nvarchar](64) NOT NULL,
	[strDevice] [nvarchar](64) NOT NULL,
	[strUnit] [nvarchar](64) NOT NULL,
	[strMsgDes] [nvarchar](100) NULL,
	[fAlarmlimit] [float] NULL,
	[strAlarmValue] [nvarchar](30) NULL,
	[strRecoveryTime] [datetime] NULL,
	[strAckedTime] [datetime] NULL,
	[strAckedComment] [nvarchar](255) NULL,
	[nSource] [int] NULL,
	[strIsHide] [char](1) NULL,
	[strNodeDomain] [nvarchar](255) NULL,
	[strTypeName] [nvarchar](10) NULL,
	[strAlarmTypeDes] [nvarchar](60) NULL,
	[nPushStatus] [int] NULL,
	[strAlarmLevelDes] [nvarchar](30) NULL,
	[nDomainNum] [int] NULL,
 CONSTRAINT [PK_CF_AlarmHis] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CF_ForbidAlarm]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_ForbidAlarm](
	[ID] [nvarchar](50) NOT NULL,
	[nAlarmType] [int] NOT NULL,
	[strTagName] [nvarchar](100) NOT NULL,
	[strTagDes] [nvarchar](100) NOT NULL,
	[strOperater] [nvarchar](100) NOT NULL,
	[strForbidTime] [datetime] NOT NULL,
	[TAG_AREA] [nvarchar](128) NULL,
	[TAG_DEVICE] [nvarchar](128) NULL,
	[TAG_UNIT] [nvarchar](128) NULL,
 CONSTRAINT [PK_FBALARMID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CF_HideAlarm]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_HideAlarm](
	[ID] [nvarchar](50) NOT NULL,
	[nAlarmType] [int] NOT NULL,
	[strTagName] [nvarchar](100) NOT NULL,
	[strTagDes] [nvarchar](100) NOT NULL,
	[strOperater] [nvarchar](100) NOT NULL,
	[strHideTime] [datetime] NOT NULL,
	[TAG_AREA] [nvarchar](128) NULL,
	[TAG_DEVICE] [nvarchar](128) NULL,
	[TAG_UNIT] [nvarchar](128) NULL,
 CONSTRAINT [PK_HDALARMID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CF_SysAlarm]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CF_SysAlarm](
	[ID] [nvarchar](50) NOT NULL,
	[nAlarmType] [int] NULL,
	[nAlarmState] [int] NULL,
	[nAlarmlevel] [int] NULL,
	[strEventTime] [datetime] NULL,
	[strTagName] [nvarchar](100) NULL,
	[strTagDes] [nvarchar](100) NULL,
	[strArea] [nvarchar](64) NULL,
	[strDevice] [nvarchar](64) NULL,
	[strUnit] [nvarchar](64) NULL,
	[strMsgDes] [nvarchar](100) NULL,
	[fAlarmlimit] [float] NULL,
	[strAlarmValue] [nvarchar](30) NULL,
	[strRecoveryTime] [datetime] NULL,
	[strAckedTime] [datetime] NULL,
	[strAckedComment] [nvarchar](255) NULL,
	[nSource] [int] NULL,
	[strIsHide] [char](1) NULL,
	[strTypeName] [nvarchar](10) NULL,
	[strAlarmTypeDes] [nvarchar](60) NULL,
	[strAlarmLevelDes] [nvarchar](30) NULL,
 CONSTRAINT [PK_HIDENALERMID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_TrendGroup]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_TrendGroup](
	[ID] [nvarchar](50) NOT NULL,
	[strInputCode] [nvarchar](50) NOT NULL,
	[strInputDate] [datetime] NOT NULL,
	[strDeptCode] [nvarchar](50) NULL,
	[strCorpCode] [nvarchar](50) NULL,
	[strModifyCode] [nvarchar](50) NOT NULL,
	[strModifyDate] [datetime] NOT NULL,
	[strTrendGroupName] [nvarchar](50) NOT NULL,
	[nTrendGroupType] [int] NOT NULL,
	[strProjectCode] [nvarchar](50) NOT NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_PM_TrendGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_TrendGroupAndTag]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_TrendGroupAndTag](
	[ID] [nvarchar](50) NOT NULL,
	[strInputCode] [nvarchar](50) NOT NULL,
	[strInputDate] [datetime] NOT NULL,
	[strDeptCode] [nvarchar](50) NULL,
	[strCorpCode] [nvarchar](50) NULL,
	[strModifyCode] [nvarchar](50) NOT NULL,
	[strModifyDate] [datetime] NOT NULL,
	[strTrendGroupID] [nvarchar](50) NOT NULL,
	[strTagName] [nvarchar](64) NOT NULL,
	[strTagDes] [nvarchar](128) NOT NULL,
	[strTagColor] [nvarchar](50) NOT NULL,
	[nLowest] [int] NOT NULL,
	[nHighest] [int] NOT NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_PM_TrendGroupAndTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ALARM_LEVEL_COLOUR]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ALARM_LEVEL_COLOUR](
	[ID] [varchar](50) NOT NULL,
	[LEVEL1_COLOUR] [bigint] NULL,
	[LEVEL2_COLOUR] [bigint] NULL,
	[LEVEL3_COLOUR] [bigint] NULL,
	[LEVEL4_COLOUR] [bigint] NULL,
	[LEVEL5_COLOUR] [bigint] NULL,
	[LEVEL6_COLOUR] [bigint] NULL,
	[LEVEL7_COLOUR] [bigint] NULL,
	[LEVEL8_COLOUR] [bigint] NULL,
	[LEVEL9_COLOUR] [bigint] NULL,
	[LEVEL10_COLOUR] [bigint] NULL,
 CONSTRAINT [PK_SM_ALARM_LEVEL_COLOUR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_Attachment]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_Attachment](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[EntityName] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Path] [nvarchar](1000) NULL,
	[Size] [nvarchar](50) NULL,
	[UploadTime] [datetime] NULL,
	[DelFlag] [char](1) NOT NULL,
	[PersonCode] [nvarchar](50) NULL,
	[ModuleId] [nvarchar](50) NULL,
 CONSTRAINT [PK_SM_ATTACHMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_CodeVou]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_CodeVou](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[FiscalYear] [nvarchar](4) NULL,
	[CurrNo] [int] NULL,
	[LastUpdateDay] [nvarchar](2) NULL,
	[FiscalMonth] [nvarchar](2) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[DeptCode] [nvarchar](50) NOT NULL,
	[CorpCode] [nvarchar](50) NOT NULL,
	[ModifyCode] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BD_CODEVOU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_GeneralSettings]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_GeneralSettings](
	[ID] [nvarchar](50) NOT NULL,
	[AlarmVoiceCycleNum] [int] NOT NULL,
	[ConnInterruptTime] [int] NOT NULL,
	[LogoutTime] [int] NOT NULL,
	[PassWordInValidTime] [int] NOT NULL,
	[NetworkRecordNumber] [nvarchar](256) NOT NULL,
	[LoginBackGroundPicture] [image] NULL,
	[MainLogoPicture] [image] NULL,
	[CreateTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[HomeBackgroundPicture] [image] NULL,
 CONSTRAINT [PK_SM_GeneralSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ListFieldConfig]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ListFieldConfig](
	[ID] [nvarchar](50) NOT NULL,
	[SystemResourceDtlCode] [nvarchar](50) NOT NULL,
	[ResourceUrl] [nvarchar](200) NULL,
	[ResorceFile] [nvarchar](200) NULL,
	[FieldID] [nvarchar](100) NOT NULL,
	[FieldName] [nvarchar](100) NOT NULL,
	[IsHide] [char](1) NULL,
	[IsSysMenu] [char](1) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_SM_LISTFIELDCONFIG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ONLINE_USER]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ONLINE_USER](
	[ID] [varchar](50) NOT NULL,
	[GROUP_NAME] [varchar](50) NOT NULL,
	[USERNAME] [varchar](50) NOT NULL,
	[NODE_ID] [int] NULL,
	[LOGIN_TIME] [datetime] NULL,
 CONSTRAINT [PK_SM_ONLINE_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectFlowChart]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectFlowChart](
	[ID] [nvarchar](50) NOT NULL,
	[strGTGuid] [nvarchar](50) NULL,
	[strGTProject] [nvarchar](50) NULL,
	[strID] [nvarchar](80) NULL,
	[strName] [nvarchar](50) NULL,
	[strDescription] [nvarchar](300) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[strResourceUrl] [nvarchar](1000) NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ProjectFlowChart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectGIS]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectGIS](
	[ID] [nvarchar](50) NOT NULL,
	[strProjectCode] [nvarchar](50) NOT NULL,
	[nLon] [decimal](18, 6) NOT NULL,
	[nLat] [decimal](18, 6) NOT NULL,
	[strIcon] [nvarchar](50) NULL,
	[nDisplaySet] [int] NULL,
	[strTagNames] [nvarchar](max) NULL,
	[strRemark] [nvarchar](500) NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ProjectGIS_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectPowerItem]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectPowerItem](
	[ID] [nvarchar](50) NOT NULL,
	[strCode] [nvarchar](50) NULL,
	[strName] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[nVirtualItemType] [int] NULL,
	[nIsCanPowerItem] [int] NULL,
 CONSTRAINT [PK_SM_ProjectPowerCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectReportTemplet]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectReportTemplet](
	[ID] [nvarchar](50) NOT NULL,
	[strID] [nvarchar](80) NULL,
	[strName] [nvarchar](50) NULL,
	[strDescription] [nvarchar](300) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[strResourceUrl] [nvarchar](1000) NULL,
	[strGTGuid] [nvarchar](50) NULL,
	[strGTProject] [nvarchar](50) NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ProjectReportTemplet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectSuperReport]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectSuperReport](
	[ID] [nvarchar](50) NOT NULL,
	[strGTGuid] [nvarchar](50) NULL,
	[strName] [nvarchar](50) NULL,
	[strDescription] [nvarchar](300) NULL,
	[strProjectCode] [nvarchar](50) NULL,
	[nOrderNo] [int] NULL,
	[strResourceUrl] [nvarchar](1000) NULL,
	[strCompanyID] [nvarchar](50) NULL,
	[strUserName] [nvarchar](50) NULL,
	[strPassword] [nvarchar](200) NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ProjectSuperReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_QueryFieldConfig]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_QueryFieldConfig](
	[ID] [nvarchar](50) NOT NULL,
	[SystemResourceDtlCode] [nvarchar](50) NOT NULL,
	[ResourceUrl] [nvarchar](200) NULL,
	[ResorceFile] [nvarchar](200) NULL,
	[FieldID] [nvarchar](100) NOT NULL,
	[FieldName] [nvarchar](100) NOT NULL,
	[FieldType] [char](1) NULL,
	[Remark] [nvarchar](500) NULL,
	[IsHide] [char](1) NULL,
	[IsSysMenu] [char](1) NULL,
 CONSTRAINT [PK_SM_QUERYFIELDCONFIG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ReceiverGroup]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ReceiverGroup](
	[ID] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[InputCode] [nvarchar](50) NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[DeptCode] [nvarchar](50) NOT NULL,
	[CorpCode] [nvarchar](50) NOT NULL,
	[ModifyCode] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SM_RECEIVERGROUP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ReportRecord]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ReportRecord](
	[ID] [nvarchar](50) NOT NULL,
	[PID] [nvarchar](50) NOT NULL,
	[strInputDate] [datetime] NOT NULL,
	[strModifyDate] [datetime] NOT NULL,
	[strReportNameAndTime] [nvarchar](128) NOT NULL,
	[strOperatorAccount] [nvarchar](50) NULL,
	[strDelFlag] [int] NOT NULL,
 CONSTRAINT [PK_SM_ReportRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_SyncObject]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_SyncObject](
	[ID] [nvarchar](50) NOT NULL,
	[strObjectName] [nvarchar](50) NOT NULL,
	[nStatus] [int] NULL,
	[dtLastLockTime] [datetime] NULL,
	[dtLastUnlockTime] [datetime] NULL,
	[ts] [datetime] NOT NULL,
 CONSTRAINT [PK_SM_SyncObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__SM_SyncO__96439D4DAC4FD534] UNIQUE NONCLUSTERED 
(
	[strObjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_SysSetting]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_SysSetting](
	[ID] [nvarchar](50) NOT NULL,
	[strKey] [nvarchar](50) NOT NULL,
	[strValue] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SM_SysSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_TREND_GROUP]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_TREND_GROUP](
	[ID] [varchar](50) NOT NULL,
	[TREND_GROUP_NAME] [varchar](50) NOT NULL,
	[USERNAME] [varchar](50) NULL,
	[GROUP_INFO] [varchar](max) NULL,
	[VERSION] [int] NULL,
 CONSTRAINT [PK_SM_TREND_GROUP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_USER]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_USER](
	[ID] [varchar](50) NOT NULL,
	[GROUP_NAME] [varchar](50) NOT NULL,
	[USERNAME] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NULL,
	[CREATE_BY] [varchar](50) NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[MODIFY_BY] [varchar](50) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[REMARK] [nvarchar](128) NULL,
 CONSTRAINT [PK_SM_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_USER_GROUP]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_USER_GROUP](
	[ID] [varchar](50) NOT NULL,
	[GROUP_NAME] [varchar](50) NOT NULL,
	[CREATE_BY] [varchar](50) NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[MODIFY_BY] [varchar](50) NULL,
	[MODIFY_TIME] [datetime] NULL,
	[ACCREDIT1] [int] NULL,
	[ACCREDIT2] [int] NULL,
	[ACCREDIT3] [int] NULL,
	[ACCREDIT4] [int] NULL,
	[ACCREDIT5] [int] NULL,
	[ACCREDIT6] [int] NULL,
	[ACCREDIT7] [int] NULL,
	[ACCREDIT8] [int] NULL,
	[ACCREDIT9] [int] NULL,
	[ACCREDIT10] [int] NULL,
 CONSTRAINT [PK_SM_USER_GROUP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_USER_GROUP_GRAPH]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_USER_GROUP_GRAPH](
	[ID] [varchar](50) NOT NULL,
	[GROUP_NAME] [varchar](50) NOT NULL,
	[GRAPH_NAME] [varchar](50) NOT NULL,
	[WRITE_AUTHORITY] [int] NULL,
 CONSTRAINT [PK_SM_USER_GROUP_GRAPH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_UserConfig]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_UserConfig](
	[ID] [nvarchar](50) NOT NULL,
	[strPersonCode] [nvarchar](50) NULL,
	[strAlarmVoiceOff] [char](1) NULL,
	[strAlarmLightTime] [datetime] NULL,
 CONSTRAINT [PK_SM_UserConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_UserLogin]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_UserLogin](
	[ID] [nvarchar](50) NOT NULL,
	[strAccount] [nvarchar](50) NULL,
	[strUID] [nvarchar](50) NULL,
	[strLogTime] [nvarchar](50) NULL,
	[strLastReqTime] [nvarchar](50) NULL,
	[IsOrNotLogin] [int] NOT NULL,
 CONSTRAINT [PK_SM_UserLogin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_UserPushConfig]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_UserPushConfig](
	[ID] [nvarchar](50) NOT NULL,
	[strPersonCode] [nvarchar](50) NOT NULL,
	[dtAlarmPushLastTime] [datetime] NULL,
	[dtNotifyPushLastTime] [datetime] NULL,
 CONSTRAINT [PK_SM_UserPushConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__SM_UserP__4AE80FD304D4B198] UNIQUE NONCLUSTERED 
(
	[strPersonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_UserSession]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_UserSession](
	[ID] [nvarchar](50) NOT NULL,
	[strAccount] [nvarchar](50) NOT NULL,
	[strSessionID] [nvarchar](50) NULL,
	[strLastUpdateTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SM_UserSession] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_UserSetting]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_UserSetting](
	[ID] [nvarchar](50) NOT NULL,
	[strAccount] [nvarchar](50) NOT NULL,
	[bEnablePush] [bit] NULL,
	[bEnableAlarmPush] [bit] NULL,
	[nAlarmPushLevel] [int] NULL,
 CONSTRAINT [PK_SM_UserSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__SM_UserS__9C0CF01868C968C4] UNIQUE NONCLUSTERED 
(
	[strAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_VideoDevDict]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_VideoDevDict](
	[ID] [nvarchar](50) NULL,
	[strDeviceType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_BD_Unit]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_BD_Unit](
	[ID] [nvarchar](50) NOT NULL,
	[UnitCode] [nvarchar](50) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[DelFlag] [char](1) NOT NULL,
	[Inputcode] [nvarchar](50) NULL,
	[Inputdate] [datetime] NULL,
	[Deptcode] [nvarchar](50) NULL,
	[Corpcode] [nvarchar](50) NULL,
	[Modifycode] [nvarchar](50) NULL,
	[Modifydate] [datetime] NULL,
	[FlowSts] [int] NULL,
 CONSTRAINT [PK_t_BD_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_tag_mobile]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_tag_mobile](
	[id] [nvarchar](50) NOT NULL,
	[sortid] [int] NULL,
	[sortname] [nvarchar](50) NULL,
	[secondname] [nvarchar](50) NULL,
	[clctrname] [nvarchar](50) NULL,
	[tagname] [nvarchar](50) NULL,
	[tagdesc] [nvarchar](50) NULL,
	[unit] [nvarchar](50) NULL,
	[sortby] [int] NULL,
 CONSTRAINT [PK_t_tag_mobile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tagtest]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tagtest](
	[id] [nvarchar](50) NOT NULL,
	[projectcode] [nvarchar](50) NOT NULL,
	[tagname] [nvarchar](50) NOT NULL,
	[tagdes] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tagtest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VC_CHANGE_LOG]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VC_CHANGE_LOG](
	[ID] [nvarchar](255) NOT NULL,
	[AUTHOR] [nvarchar](255) NOT NULL,
	[FILENAME] [nvarchar](255) NOT NULL,
	[DATEEXECUTED] [datetime2](3) NOT NULL,
	[ORDEREXECUTED] [int] NOT NULL,
	[EXECTYPE] [nvarchar](10) NOT NULL,
	[MD5SUM] [nvarchar](35) NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[COMMENTS] [nvarchar](255) NULL,
	[TAG] [nvarchar](255) NULL,
	[LIQUIBASE] [nvarchar](20) NULL,
	[CONTEXTS] [nvarchar](255) NULL,
	[LABELS] [nvarchar](255) NULL,
	[DEPLOYMENT_ID] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VC_CHANGE_LOG_LOCK]    Script Date: 2019/12/17 16:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VC_CHANGE_LOG_LOCK](
	[ID] [int] NOT NULL,
	[LOCKED] [bit] NOT NULL,
	[LOCKGRANTED] [datetime2](3) NULL,
	[LOCKEDBY] [nvarchar](255) NULL,
 CONSTRAINT [PK_VC_CHANGE_LOG_LOCK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_CF_Alarm_Soft]    Script Date: 2019/12/17 16:46:14 ******/
CREATE NONCLUSTERED INDEX [IX_CF_Alarm_Soft] ON [dbo].[CF_Alarm]
(
	[nAlarmState] ASC,
	[nAlarmlevel] ASC,
	[strEventTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CF_ALARMHIS_strEventTime]    Script Date: 2019/12/17 16:46:14 ******/
CREATE NONCLUSTERED INDEX [IX_CF_ALARMHIS_strEventTime] ON [dbo].[CF_AlarmHis]
(
	[strEventTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CF_SysAlarm]    Script Date: 2019/12/17 16:46:14 ******/
CREATE NONCLUSTERED INDEX [IX_CF_SysAlarm] ON [dbo].[CF_SysAlarm]
(
	[nAlarmState] ASC,
	[nAlarmlevel] ASC,
	[strEventTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_Department_Name]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_Department_Name] ON [dbo].[SM_Department]
(
	[Name] ASC,
	[Pcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SM_Log]    Script Date: 2019/12/17 16:46:14 ******/
CREATE NONCLUSTERED INDEX [IX_SM_Log] ON [dbo].[SM_Log]
(
	[strOperateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_Person_Account]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_Person_Account] ON [dbo].[SM_Person]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectArchitecture_Name]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectArchitecture_Name] ON [dbo].[SM_ProjectArchitecture]
(
	[strPProjectCode] ASC,
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectArchitecture_PP]    Script Date: 2019/12/17 16:46:14 ******/
CREATE NONCLUSTERED INDEX [IX_SM_ProjectArchitecture_PP] ON [dbo].[SM_ProjectArchitecture]
(
	[strPProjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectFlowChart_strID]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectFlowChart_strID] ON [dbo].[SM_ProjectFlowChart]
(
	[strID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectReportPlan]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectReportPlan] ON [dbo].[SM_ProjectReportPlan]
(
	[strID] ASC,
	[strDelFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectSuperReport_Name]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectSuperReport_Name] ON [dbo].[SM_ProjectSuperReport]
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectVideo_Name]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectVideo_Name] ON [dbo].[SM_ProjectVideo]
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_Role_Name]    Script Date: 2019/12/17 16:46:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_Role_Name] ON [dbo].[SM_Role]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_InputDate]  DEFAULT (getdate()) FOR [strInputDate]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_ModifyDate]  DEFAULT (getdate()) FOR [strModifyDate]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_TrendGroupType]  DEFAULT ((0)) FOR [nTrendGroupType]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_InputDate]  DEFAULT (getdate()) FOR [strInputDate]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_ModifyDate]  DEFAULT (getdate()) FOR [strModifyDate]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_nLowest]  DEFAULT ((0)) FOR [nLowest]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_nHighest]  DEFAULT ((0)) FOR [nHighest]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_Attachment] ADD  CONSTRAINT [DF__SM_Attach__DelFl__3E52440B]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_Department] ADD  CONSTRAINT [DF__SM_Depart__DelFl__1B0907CE]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_AlarmVoiceCycleNum]  DEFAULT ((3)) FOR [AlarmVoiceCycleNum]
GO
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_ConnInterruptTime]  DEFAULT ((0)) FOR [ConnInterruptTime]
GO
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_LogoutTime]  DEFAULT ((0)) FOR [LogoutTime]
GO
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strOperateTime]  DEFAULT (getdate()) FOR [strOperateTime]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_nLogSource]  DEFAULT ((2)) FOR [nLogSource]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_nOperateContentKey]  DEFAULT ((0)) FOR [nOperateContentKey]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_nStatus]  DEFAULT ((1)) FOR [nStatus]
GO
ALTER TABLE [dbo].[SM_MessageInfo] ADD  CONSTRAINT [DF__SM_Messag__DelFl__108B795B]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_MessageInfoDtl] ADD  CONSTRAINT [DF__SM_Messag__DelFl__1367E606]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_Person] ADD  CONSTRAINT [DF_SM_Person_OrderNo]  DEFAULT (NEXT VALUE FOR [SQ_PERSON_ORDERNO]) FOR [OrderNo]
GO
ALTER TABLE [dbo].[SM_Person] ADD  CONSTRAINT [DF__SM_Person__DelFl__21B6055D]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_Person] ADD  CONSTRAINT [DF__SM_Person__LastP__2DB1C7EE]  DEFAULT (getdate()) FOR [LastPasswordChangeTime]
GO
ALTER TABLE [dbo].[SM_ProjectArchitecture] ADD  CONSTRAINT [DF_SM_ProjectStruct_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectFlowChart] ADD  CONSTRAINT [DF_SM_ProjectFlowChart_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_nLon]  DEFAULT ((0)) FOR [nLon]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_nLat]  DEFAULT ((0)) FOR [nLat]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_nDisplaySet]  DEFAULT ((1)) FOR [nDisplaySet]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_strDelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectReportTemplet] ADD  CONSTRAINT [DF_SM_ProjectReportTemplet_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectSuperReport] ADD  CONSTRAINT [DF_SM_ProjectSuperReport_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectTag] ADD  CONSTRAINT [DF_SM_ProjectTag_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectVideo] ADD  CONSTRAINT [DF_SM_ProjectVideo_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ReceiverGroup] ADD  CONSTRAINT [DF__SM_Receiv__DelFl__164452B1]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_strInputDate]  DEFAULT (getdate()) FOR [strInputDate]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_strModifyDate]  DEFAULT (getdate()) FOR [strModifyDate]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nPlanAttribute]  DEFAULT ((1)) FOR [nPlanAttribute]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nIsSendPrinter]  DEFAULT ((0)) FOR [nIsSendPrinter]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nMonth]  DEFAULT ((0)) FOR [nMonth]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nDay]  DEFAULT ((0)) FOR [nDay]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nHour]  DEFAULT ((0)) FOR [nHour]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nMinute]  DEFAULT ((0)) FOR [nMinute]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nMonthNumber]  DEFAULT ((0)) FOR [nMonthNumber]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_nWeekNumber]  DEFAULT ((0)) FOR [nWeekNumber]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_strDelFlag]  DEFAULT ((0)) FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_strIsSynchronize]  DEFAULT ((1)) FOR [strIsSynchronize]
GO
ALTER TABLE [dbo].[SM_ReportRecord] ADD  CONSTRAINT [DF_SM_ReportRecord_strInputDate]  DEFAULT (getdate()) FOR [strInputDate]
GO
ALTER TABLE [dbo].[SM_ReportRecord] ADD  CONSTRAINT [DF_SM_ReportRecord_strModifyDate]  DEFAULT (getdate()) FOR [strModifyDate]
GO
ALTER TABLE [dbo].[SM_ReportRecord] ADD  CONSTRAINT [DF_SM_ReportRecord_strDelFlag]  DEFAULT ((0)) FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_Role] ADD  CONSTRAINT [DF__SM_Role__DelFlag__2E1BDC42]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_SystemResource] ADD  CONSTRAINT [DF__SM_System__DelFl__36B12243]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_SystemResourceDtl] ADD  CONSTRAINT [DF__SM_System__DelFl__398D8EEE]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_USER_GROUP_GRAPH] ADD  CONSTRAINT [DF_SM_USER_GROUP_GRAPH_WRITE_AUTHORITY]  DEFAULT ((0)) FOR [WRITE_AUTHORITY]
GO
ALTER TABLE [dbo].[SM_UserLogin] ADD  CONSTRAINT [DF_SM_UserLogin_IsOrNotLogin]  DEFAULT ((0)) FOR [IsOrNotLogin]
GO
ALTER TABLE [dbo].[t_BD_ArrangePeriod] ADD  CONSTRAINT [DF_t_BD_ArrangePeriod_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_ArrangeResult] ADD  CONSTRAINT [DF_t_BD_ArrangeResult_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Dict] ADD  CONSTRAINT [DF_t_BD_Dict_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_DictDtl] ADD  CONSTRAINT [DF_t_BD_DictDtl_SeqNo]  DEFAULT ((0)) FOR [SeqNo]
GO
ALTER TABLE [dbo].[t_BD_DictDtl] ADD  CONSTRAINT [DF_t_BD_DictDtl_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Material] ADD  CONSTRAINT [DF_t_BD_Material_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_MaterialAttr] ADD  CONSTRAINT [DF_t_BD_MaterialAttr_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_MaterialRelType] ADD  CONSTRAINT [DF_t_BD_MaterialRelType_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Member] ADD  CONSTRAINT [DF_t_BD_Member_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Supplier] ADD  CONSTRAINT [DF_t_BD_Supplier_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_SupplierMaterialDtl] ADD  CONSTRAINT [DF_t_BD_SupplierMaterialDtl_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Team] ADD  CONSTRAINT [DF_t_BD_Team_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Unit] ADD  CONSTRAINT [DF_t_BD_Unit_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_UnitConv] ADD  CONSTRAINT [DF_t_BD_UnitConv_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_UnitDtl] ADD  CONSTRAINT [DF_t_BD_UnitDtl_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_WorkShift] ADD  CONSTRAINT [DF_t_BD_Trains_DelFlag]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[PM_TrendGroup]  WITH CHECK ADD  CONSTRAINT [FK_PM_TrendGroup_SM_ProjectArchitecture] FOREIGN KEY([strProjectCode])
REFERENCES [dbo].[SM_ProjectArchitecture] ([strProjectCode])
GO
ALTER TABLE [dbo].[PM_TrendGroup] CHECK CONSTRAINT [FK_PM_TrendGroup_SM_ProjectArchitecture]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型（上限，上上限......）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'nAlarmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'nAlarmState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'nAlarmlevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strEventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strTagName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strTagDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元,为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strMsgDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警阀值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'fAlarmlimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警实时值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strAlarmValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'恢复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strRecoveryTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strAckedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'恢复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strAckedComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'nSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏后产生0：非隐藏后生产 1：隐藏后生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strIsHide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strAlarmTypeDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警级别描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm', @level2type=N'COLUMN',@level2name=N'strAlarmLevelDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产报警信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_Alarm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型（上限，上上限......）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'nAlarmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'nAlarmState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'nAlarmlevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strEventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strTagName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strTagDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元,为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strMsgDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警阀值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'fAlarmlimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警实时值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strAlarmValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'恢复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strRecoveryTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strAckedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'恢复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strAckedComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'nSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏后产生0：非隐藏后生产 1：隐藏后生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strIsHide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strAlarmTypeDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警级别描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis', @level2type=N'COLUMN',@level2name=N'strAlarmLevelDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产报警信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_AlarmHis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型（上限，上上限......）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'nAlarmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'strTagName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'strTagDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'strOperater'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抑制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'strForbidTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签所属区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'TAG_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签所属装置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'TAG_DEVICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签所属单元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm', @level2type=N'COLUMN',@level2name=N'TAG_UNIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抑制报警设置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ForbidAlarm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型（上限，上上限......）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'nAlarmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'strTagName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'strTagDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'strOperater'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐藏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'strHideTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签所属区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'TAG_AREA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签所属装置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'TAG_DEVICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签所属单元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm', @level2type=N'COLUMN',@level2name=N'TAG_UNIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐藏报警设置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_HideAlarm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CPU负荷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'nCPULoad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'温度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'fTemperature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内存负荷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'nMemoryLoad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 -1:初始化  0：不正常  1:正常' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'nState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点类型（0普通节点，1网闸安全侧，2网闸开放侧，3云卡）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'nNodeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PC号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'nNodePCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'strStateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网闸序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'strSerialNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组态节点状态信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ProcessState', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ProcessState', @level2type=N'COLUMN',@level2name=N'nProcessID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PC号	关联表CF_NodeState' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ProcessState', @level2type=N'COLUMN',@level2name=N'nNodePCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 -1:初始化  0：不正常  1:正常' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ProcessState', @level2type=N'COLUMN',@level2name=N'nState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进程名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ProcessState', @level2type=N'COLUMN',@level2name=N'strProcessName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ProcessState', @level2type=N'COLUMN',@level2name=N'strStateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点PC下的进程状态信息，非主表，无UUID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ProcessState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ServiceState', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PC号	关联CF_ProcessState' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ServiceState', @level2type=N'COLUMN',@level2name=N'nNodePCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 -1:初始化  0：不正常  1:正常  2:部分正常' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ServiceState', @level2type=N'COLUMN',@level2name=N'nState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ServiceState', @level2type=N'COLUMN',@level2name=N'strServiceName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进程名称	关联CF_ProcessState' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ServiceState', @level2type=N'COLUMN',@level2name=N'strProcessName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PC节点进程下的驱动服务信息 ，非主表，无UUID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_ServiceState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型（上限，上上限......）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'nAlarmType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'nAlarmState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'nAlarmlevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件发生事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strEventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strTagName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strTagDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元,为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件信息描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strMsgDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'fAlarmlimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警时刻值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strAlarmValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'恢复事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strRecoveryTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strAckedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警确认信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strAckedComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源 1:DCS 2:ODS生产 3:ODS设备' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'nSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏后产生0：非隐藏后生产 1：隐藏后生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strIsHide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警类型描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strAlarmTypeDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警级别描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm', @level2type=N'COLUMN',@level2name=N'strAlarmLevelDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统报警信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_SysAlarm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strInputCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strInputDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strCorpCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strModifyCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strTrendGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组类型，0公共趋势组   1自定义趋势组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'nTrendGroupType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志 1删除  0未删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strInputCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strInputDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strDeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strCorpCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strModifyCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strTrendGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strTagName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签点描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strTagDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签点颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strTagColor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最低值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'nLowest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'nHighest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志，1删除  0未删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组和标签点关系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PM_TrendGroupAndTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键，guid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警声音轮询条数设置，默认3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'AlarmVoiceCycleNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接中断时间设置，单位分钟' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'ConnInterruptTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无操作注销时间设置，单位分钟' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'LogoutTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码失效时间设置，单位月' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'PassWordInValidTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版权和网络备案号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'NetworkRecordNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆页背景图设置，存储文件流' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'LoginBackGroundPicture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主界面logo设置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'MainLogoPicture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改设置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'ModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主页背景图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_GeneralSettings', @level2type=N'COLUMN',@level2name=N'HomeBackgroundPicture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strOperater'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strOperateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志来源 生产日志 = 1,系统日志 = 2,DCS日志 = 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'nLogSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他0，登录注销1、新增2、删除3、修改4，置位 = 10,写模拟量值 = 11,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'nOperateContentKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 1成功  0失败' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'nStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strLabelName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strLabelDescribe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元,为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页面编码或者流程图id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strOperateRoute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改前值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strPreContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改后值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strafterContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'strContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线用户信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ONLINE_USER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型的key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_OperateContent', @level2type=N'COLUMN',@level2name=N'nOperateContentKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型key对应的汉字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_OperateContent', @level2type=N'COLUMN',@level2name=N'strOperateContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型key,value对应表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_OperateContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonDepart_Rel', @level2type=N'COLUMN',@level2name=N'PersonCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'归属部门编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonDepart_Rel', @level2type=N'COLUMN',@level2name=N'DepartCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构用户权限项ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectPower', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构关联用户编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectPower', @level2type=N'COLUMN',@level2name=N'strPersonCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构叶子节点项编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectPower', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构权限项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectPower', @level2type=N'COLUMN',@level2name=N'strItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构权限项父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectPower', @level2type=N'COLUMN',@level2name=N'strPowerCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectPower', @level2type=N'COLUMN',@level2name=N'strDataPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectPower', @level2type=N'COLUMN',@level2name=N'strCustomPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectSysPower', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectSysPower', @level2type=N'COLUMN',@level2name=N'strPersonCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权项编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectSysPower', @level2type=N'COLUMN',@level2name=N'strItemCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目结构节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectSysPower', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作按钮ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectSysPower', @level2type=N'COLUMN',@level2name=N'nPageButtonConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectSysPower', @level2type=N'COLUMN',@level2name=N'strIsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户项目架构树操作权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_PersonProjectSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目节点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目父项节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture', @level2type=N'COLUMN',@level2name=N'strPProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目节点序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为最终叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture', @level2type=N'COLUMN',@level2name=N'strIsFinalLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构管理树' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectArchitecture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图节点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图归属工程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strGTGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图归属工程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strGTProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图组态ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图节点描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图节点序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图节点关联资源地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strResourceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectFlowChart', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'nLon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'nLat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标的名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'strIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'始终显示1  鼠标放上显示2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'nDisplaySet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签名称集合' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'strTagNames'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'strRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志 1删除  0未删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构GIS组态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectGIS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPageButtonConfig', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'归属操作权限Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPageButtonConfig', @level2type=N'COLUMN',@level2name=N'strProjectSysPowerCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPageButtonConfig', @level2type=N'COLUMN',@level2name=N'strButtonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPageButtonConfig', @level2type=N'COLUMN',@level2name=N'strButtonName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPageButtonConfig', @level2type=N'COLUMN',@level2name=N'strRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作权限类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPageButtonConfig', @level2type=N'COLUMN',@level2name=N'nPowerCodeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构项ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPowerItem', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构项编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPowerItem', @level2type=N'COLUMN',@level2name=N'strCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构项名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPowerItem', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构项序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPowerItem', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'虚拟项类型（0：非虚拟项， 1： 普通单虚拟项， 2： 组虚拟项）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPowerItem', @level2type=N'COLUMN',@level2name=N'nVirtualItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可以设置对应权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectPowerItem', @level2type=N'COLUMN',@level2name=N'nIsCanPowerItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划组态ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划关联资源地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strResourceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表服务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strReportServiceName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划归属工程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strGTGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表计划归属工程标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strGTProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportPlan', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板组态ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板关联资源地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strResourceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板归属工程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strGTGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板归属工程标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strGTProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectReportTemplet', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表节点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表归属工程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strGTGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表节点描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表节点父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表节点序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表节点关联服务器地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strResourceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表厂商ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strCompanyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表服务器用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高级报表服务器访问密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectSuperReport', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签节点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签组态ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签节点描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置，为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单元,为DCS日志设计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签节点父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签节点序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签节点类型（0：普通标签，1：特殊标签）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'nTagType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签节点资源地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strResourceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签归属工程标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strGTGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签归属PC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strGTPC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签归属MACS域号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strGTDomain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签数据类型：开关，模拟' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectTag', @level2type=N'COLUMN',@level2name=N'nTagDataType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频节点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频归属工程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strGTGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频节点描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频节点父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频节点序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'nOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频节点关联视频服务器地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strResourceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频设备类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strDevType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频服务器用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频服务器访问密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频帐户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strAccountID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ProjectVideo', @level2type=N'COLUMN',@level2name=N'strSerialNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strInputDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strGTName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GTPlus工程id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strGTGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表服务A系统号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strReportServiceA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表服务A系统名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strReportServiceAName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表服务B系统号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strReportServiceB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表服务B系统名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strReportServiceBName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表打印计划名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strPlanName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表服务描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strPlanDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划属性 1自动  2手动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nPlanAttribute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动发送打印机 1发送  0不发送' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nIsSendPrinter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打印周期 1按小时，2按天，3按周，4按月，5按季度，6按年' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nPrintCycle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份，1到12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nMonth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日，1到31' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时，0到23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nHour'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分 0到59' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nMinute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第几个月，为季度报表用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nMonthNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周几，1到7，为周报用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'nWeekNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strReportTemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strReportTemplateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表模板文件磁盘地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strReportTemplateResourceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志  1删除  0未删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重新下装后数据是否同步了，1是同步  0是未同步' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportPlan', @level2type=N'COLUMN',@level2name=N'strIsSynchronize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportRecord', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportRecord', @level2type=N'COLUMN',@level2name=N'strInputDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportRecord', @level2type=N'COLUMN',@level2name=N'strModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表名称(带生成时间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportRecord', @level2type=N'COLUMN',@level2name=N'strReportNameAndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行人（自动报表为空）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportRecord', @level2type=N'COLUMN',@level2name=N'strOperatorAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志  1删除  0未删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_ReportRecord', @level2type=N'COLUMN',@level2name=N'strDelFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构角色权限项ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectPower', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构关联角色编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectPower', @level2type=N'COLUMN',@level2name=N'strRoleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构叶子节点项编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectPower', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构权限项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectPower', @level2type=N'COLUMN',@level2name=N'strItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目架构权限项父节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectPower', @level2type=N'COLUMN',@level2name=N'strPowerCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectPower', @level2type=N'COLUMN',@level2name=N'strDataPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectPower', @level2type=N'COLUMN',@level2name=N'strCustomPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectSysPower', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectSysPower', @level2type=N'COLUMN',@level2name=N'strRoleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权项编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectSysPower', @level2type=N'COLUMN',@level2name=N'strItemCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目结构节点编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectSysPower', @level2type=N'COLUMN',@level2name=N'strProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作按钮ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectSysPower', @level2type=N'COLUMN',@level2name=N'nPageButtonConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectSysPower', @level2type=N'COLUMN',@level2name=N'strIsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色项目架构树操作权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_RoleProjectSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_TREND_GROUP', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'趋势组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_TREND_GROUP', @level2type=N'COLUMN',@level2name=N'TREND_GROUP_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名，可以为NULL，为NULL则为公共趋势组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_TREND_GROUP', @level2type=N'COLUMN',@level2name=N'USERNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Json串，存储趋势组内标签名、曲线颜色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_TREND_GROUP', @level2type=N'COLUMN',@level2name=N'GROUP_INFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_TREND_GROUP', @level2type=N'COLUMN',@level2name=N'VERSION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'GROUP_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'USERNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'PASSWORD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'CREATE_BY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'MODIFY_BY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER', @level2type=N'COLUMN',@level2name=N'REMARK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'GROUP_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'CREATE_BY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'MODIFY_BY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'MODIFY_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT9'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP', @level2type=N'COLUMN',@level2name=N'ACCREDIT10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP_GRAPH', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP_GRAPH', @level2type=N'COLUMN',@level2name=N'GROUP_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程图名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP_GRAPH', @level2type=N'COLUMN',@level2name=N'GRAPH_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'写权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP_GRAPH', @level2type=N'COLUMN',@level2name=N'WRITE_AUTHORITY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组下挂接的流程图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_USER_GROUP_GRAPH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户配置项ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserConfig', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置关联用户编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserConfig', @level2type=N'COLUMN',@level2name=N'strPersonCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警消音开关（0：开启， 1：关闭）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserConfig', @level2type=N'COLUMN',@level2name=N'strAlarmVoiceOff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警灯时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserConfig', @level2type=N'COLUMN',@level2name=N'strAlarmLightTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserConfig'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserLogin', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserLogin', @level2type=N'COLUMN',@level2name=N'strAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录唯一标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserLogin', @level2type=N'COLUMN',@level2name=N'strUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserLogin', @level2type=N'COLUMN',@level2name=N'strLogTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端最近请求时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserLogin', @level2type=N'COLUMN',@level2name=N'strLastReqTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否登陆，1登陆，0未登录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_UserLogin', @level2type=N'COLUMN',@level2name=N'IsOrNotLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频帐户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_VideoAccount', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频帐户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_VideoAccount', @level2type=N'COLUMN',@level2name=N'strAccountName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AppKey' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_VideoAccount', @level2type=N'COLUMN',@level2name=N'strAppKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AppSecret' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_VideoAccount', @level2type=N'COLUMN',@level2name=N'strAppSecret'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频设备类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_VideoDevDict', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频设备类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_VideoDevDict', @level2type=N'COLUMN',@level2name=N'strDeviceType'
GO
