USE [HiODSDB]
GO
/****** Object:  Table [dbo].[SM_ReportPlan]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectReportPlan]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_ProjectReportPlan]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_ProjectReportPlan]
AS
SELECT   c.ID, c.strID, c.strGTGuid, c.strProjectCode, c.nOrderNo, d.strPlanName, d.strPlanDescription, 
                d.strReportTemplateResourceUrl, d.strGTName, d.strReportServiceAName, d.strReportServiceBName, 
                c.strDelFlag
FROM      dbo.SM_ProjectReportPlan AS c INNER JOIN
                dbo.SM_ReportPlan AS d ON c.strID = d.ID AND c.strGTGuid = d.strGTGuid
GO
/****** Object:  Table [dbo].[SM_PersonProjectSysPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_RoleProjectSysPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_PersonRole_Rel]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectPageButtonConfig]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_PersonProjectSysPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonProjectSysPower]
AS
SELECT   a.ID, b.PersonCode AS strPersonCode, c.strButtonID, c.strButtonName, c.strProjectSysPowerCode, c.nPowerCodeType, 
                a.strProjectCode, a.strItemCode, a.nPageButtonConfigID, '0' AS strIsEnable
FROM      SM_RoleProjectSysPower AS a LEFT JOIN
                SM_PersonRole_Rel AS b ON a.strRoleCode = b.RoleCode LEFT JOIN
                SM_ProjectPageButtonConfig AS c ON a.nPageButtonConfigID = c.ID
UNION
SELECT   a.ID, a.strPersonCode, b.strButtonID, b.strButtonName, b.strProjectSysPowerCode, b.nPowerCodeType, 
                a.strProjectCode, a.strItemCode, a.nPageButtonConfigID, '1' AS strIsEnable
FROM      SM_PersonProjectSysPower AS a LEFT JOIN
                SM_ProjectPageButtonConfig AS b ON a.nPageButtonConfigID = b.ID
GO
/****** Object:  Table [dbo].[CF_ProcessState]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[CF_ServiceState]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_CF_ProcessState]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_CF_ProcessState]
AS
SELECT   ID, nNodePCID, nProcessID, strProcessName, nState, 
                CASE WHEN nState = 1 THEN '正常' ELSE '不正常' END AS StateName, strStateTime,
                    (SELECT   COUNT(0) AS Expr1
                     FROM      dbo.CF_ServiceState
                     WHERE   (strProcessName = A.strProcessName) AND (nNodePCID = A.nNodePCID) AND 
                                     (A.strProcessName LIKE '%IOSERVER%')) AS IsHaveDetail
FROM      dbo.CF_ProcessState AS A

GO
/****** Object:  View [dbo].[V_CF_ServiceState]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_CF_ServiceState]
AS
SELECT  ID, 
		nNodePCID,
		strProcessName,
		strServiceName,
		nState, 
		CASE WHEN nState = 1 THEN '正常' ELSE '不正常' END AS StateName        
FROM    dbo.CF_ServiceState AS A

GO
/****** Object:  Table [dbo].[SM_SystemResourceRmisDtl]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[t_deply]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_deply](
	[Id] [nvarchar](50) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[desc] [varchar](64) NULL,
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
/****** Object:  View [dbo].[V_SM_SystemResourceRmisDtl]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_SystemResourceRmisDtl                             
==============================================================*/
CREATE VIEW [dbo].[V_SM_SystemResourceRmisDtl]
AS
SELECT   a.Code, a.DelFlag, a.ID, a.IsHide, a.IsSysMenu, a.OrderNo, a.Parameter, a.ResourceType, a.SystemResourceCode, 
                a.Title, a.EnTitle, a.Platform, a.ConfCodeVou, b.path AS ResourceUrl, b.Id AS DeployID, '' AS ResourceUrlApp
FROM      dbo.SM_SystemResourceRmisDtl AS a LEFT OUTER JOIN
                dbo.t_deply AS b ON a.DeployID = b.Id

GO
/****** Object:  Table [dbo].[t_BD_Dict]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[t_BD_DictDtl]    Script Date: 2019/6/13 20:53:16 ******/
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
	[DictCode] ASC,
	[DictDtlCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_BD_Dict]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Dict]
AS
SELECT   d.ID, d.DictCode, d.DictName, d.TypeCode, d.Remark, d.DelFlag, dd.ID AS dtlId, dd.DictDtlName AS dtlName, 
                dd.DictDtlCode AS dtlCode, dd.SeqNo, dd.Remark AS dtlRemark
FROM      dbo.t_BD_Dict AS d INNER JOIN
                dbo.t_BD_DictDtl AS dd ON d.DictCode = dd.DictCode AND dd.DelFlag = 0

GO
/****** Object:  Table [dbo].[CF_SysAlarm]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[CF_NodeState]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_CF_NodeState]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CF_NodeState]
AS
SELECT   ID, nNodePCID, nCPULoad, fTemperature, nMemoryLoad, nState, 
                CASE WHEN nState = 1 THEN '正常' ELSE '不正常' END AS StateName, nNodeType, 
                CASE WHEN nNodeType = 0 THEN '普通节点' WHEN nNodeType = 1 THEN '网闸安全侧' WHEN nNodeType = 2 THEN '网闸开放侧'
                 END AS NodeTypeName, strStateTime,
                    (SELECT   COUNT(0) AS Expr1
                     FROM      dbo.CF_ProcessState
                     WHERE   (nNodePCID = A.nNodePCID)) AS IsHaveDetail,
                    (SELECT   COUNT(0) AS Expr1
                     FROM      dbo.CF_SysAlarm
                     WHERE   (strTagName LIKE 'SYS_NODE' + CONVERT(NVARCHAR(32), A.nNodePCID) + '%')) AS IsHaveHistory
FROM      dbo.CF_NodeState AS A
GO
/****** Object:  Table [dbo].[SM_SystemResourceDtl]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_SystemResourceDtl]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_SystemResourceDtl]
AS
SELECT   ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, 
                IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag, '' AS DeployID
FROM      SM_SystemResourceDtl
UNION
SELECT   ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, 
                IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag, DeployID
FROM      V_SM_SystemResourceRmisDtl 

GO
/****** Object:  Table [dbo].[SM_PersonDataPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_RoleDataPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_PersonDataPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonDataPower]
AS
SELECT   a.ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, '0' AS strIsEnable
FROM      SM_RoleDataPower AS a LEFT JOIN
                SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode
WHERE   a.SystemResourceDtlCode IS NOT NULL
UNION ALL
SELECT   ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, '1' AS strIsEnable
FROM      SM_PersonDataPower
WHERE   SystemResourceDtlCode IS NOT NULL
GO
/****** Object:  Table [dbo].[t_BD_MaterialRelType]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[t_BD_Material]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[t_BD_UnitDtl]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_MaterialType]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_MaterialType]
AS
SELECT   t.ID, m.MatName, m.MatCode, m.Spec, m.Model, m.FirstUnitCode, m.SecondUnitCode, v.DelFlag, v.TypeCode, v.dtlId, 
                v.dtlCode, a.UnitDtlName AS FirstUnitName, b.UnitDtlName AS SecondUnitName, v.dtlCode AS MatType
FROM      dbo.V_BD_Dict AS v INNER JOIN
                dbo.t_BD_MaterialRelType AS t ON v.dtlCode = t.TypeCode AND t.DelFlag = 0 INNER JOIN
                dbo.t_BD_Material AS m ON t.MatCode = m.MatCode AND m.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS a ON m.FirstUnitCode = a.UnitDtlCode AND a.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS b ON m.SecondUnitCode = b.UnitDtlCode AND b.DelFlag = 0
WHERE   (v.DictCode = 'MatType') AND (m.UseFlag = '1')

GO
/****** Object:  View [dbo].[V_SM_SystemResourcePowerDtl]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_SystemResourcePowerDtl                                       
==============================================================*/
CREATE VIEW [dbo].[V_SM_SystemResourcePowerDtl]
AS
SELECT DISTINCT 
                b.PersonCode, a.ID, a.Code, a.SystemResourceCode, a.Title, a.EnTitle, a.ResourceType, a.ResourceUrl, 
                a.ResourceUrlApp, a.Parameter, a.OrderNo, a.IsHide, a.IsSysMenu, a.Platform, a.DeployID, a.ConfCodeVou, 
                a.DelFlag
FROM      dbo.V_SM_SystemResourceDtl AS a CROSS JOIN
                dbo.V_SM_PersonDataPower AS b
WHERE   (a.Code IN
                    (SELECT   SystemResourceDtlCode
                     FROM      dbo.V_SM_PersonDataPower AS c
                     WHERE   (a.Code = SystemResourceDtlCode))) OR
                (a.IsSysMenu <> '1')

GO
/****** Object:  Table [dbo].[t_BD_Team]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_Person]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_Team]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Team]
AS
SELECT   a.ID, a.TeamCode, a.TeamName, a.Leader, a.Dept, a.DelFlag, a.InputCode, a.InputDate, a.DeptCode, a.CorpCode, 
                a.ModifyCode, a.ModifyDate, b.Name AS LeaderName
FROM      dbo.t_BD_Team AS a LEFT OUTER JOIN
                dbo.SM_Person AS b ON a.Leader = b.Code

GO
/****** Object:  Table [dbo].[SM_ProjectArchitecture]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Index [IX_SM_ProjectArchitecture_C]    Script Date: 2019/6/13 20:53:16 ******/
CREATE CLUSTERED INDEX [IX_SM_ProjectArchitecture_C] ON [dbo].[SM_ProjectArchitecture]
(
	[strProjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_ProjectArchitectureFullPath]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_ProjectArchitectureFullPath]
AS
WITH T AS (SELECT   ID, strProjectCode, strPProjectCode, strName, CAST(strName AS NVARCHAR(MAX)) AS path, 
                                   CAST(strProjectCode AS NVARCHAR(MAX)) AS projectCode
                   FROM      dbo.SM_ProjectArchitecture
                   WHERE   (strPProjectCode = '-1') AND (strDelFlag = '0')
                   UNION ALL
                   SELECT   B.ID, B.strProjectCode, B.strPProjectCode, B.strName, T_2.path + '\' + B.strName AS path, 
                                   T_2.projectCode + '\' + B.strProjectCode AS projectCode
                   FROM      dbo.SM_ProjectArchitecture AS B INNER JOIN
                                   T AS T_2 ON B.strPProjectCode = T_2.strProjectCode)
    SELECT   ID, strProjectCode, strPProjectCode, strName, path AS namePath, projectCode AS codePath
    FROM      T AS T_1
GO
/****** Object:  Table [dbo].[t_BD_Member]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_Member]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Member]
AS
SELECT   a.ID, a.TeamCode, a.PersonCode, a.DelFlag, b.Name AS PersonName, b.Sex, b.WorkNum, b.Account, b.DeptCode, 
                b.CorpCode, b.Duty, b.Position, b.Superior, b.Mobile, b.Email, b.PersonStatus, c.TeamName
FROM      dbo.t_BD_Member AS a LEFT OUTER JOIN
                dbo.SM_Person AS b ON a.PersonCode = b.Code LEFT OUTER JOIN
                dbo.V_BD_Team AS c ON a.TeamCode = c.TeamCode

GO
/****** Object:  Table [dbo].[SM_MessageInfo]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_MessageInfo]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_MessageInfo                                       
==============================================================*/
CREATE VIEW [dbo].[V_SM_MessageInfo]
AS
SELECT   a.ID, a.Sender, a.SendTime, a.[Content], a.DelFlag, a.EndTime, a.Title, a.InputCode, a.InputDate, a.DeptCode, 
                a.CorpCode, a.ModifyCode, a.ModifyDate, a.MsgType, b.Name, a.nPushStatus
FROM      dbo.SM_MessageInfo AS a LEFT OUTER JOIN
                dbo.SM_Person AS b ON a.Sender = b.Code
WHERE   (b.DelFlag = '0') AND (b.PersonStatus = '1')
GO
/****** Object:  Table [dbo].[SM_MessageInfoDtl]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_MessageInfoAll]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_MessageInfoAll                                       
==============================================================*/
CREATE VIEW [dbo].[V_SM_MessageInfoAll]
AS
SELECT   dbo.SM_MessageInfoDtl.ID, dbo.SM_MessageInfo.Title, dbo.SM_MessageInfo.[Content], 
                dbo.SM_MessageInfoDtl.PersonCode, dbo.SM_MessageInfoDtl.IsRead, dbo.SM_MessageInfoDtl.DelFlag, 
                dbo.SM_MessageInfo.SendTime, dbo.SM_MessageInfo.Sender, dbo.SM_Person.Name AS SenderName, 
                dbo.SM_MessageInfo.ID AS PID, dbo.SM_MessageInfo.MsgType, dbo.SM_MessageInfo.nPushStatus, 
                dbo.SM_MessageInfo.Client
FROM      dbo.SM_MessageInfo INNER JOIN
                dbo.SM_MessageInfoDtl ON dbo.SM_MessageInfo.ID = dbo.SM_MessageInfoDtl.PID INNER JOIN
                dbo.SM_Person ON dbo.SM_MessageInfo.Sender = dbo.SM_Person.Code
GO
/****** Object:  Table [dbo].[SM_PersonDeptPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_Department]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_PersonDeptInfo]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_PersonDeptInfo]
AS
SELECT   a.PersonCode, a.DeptCode, b.Name
FROM      SM_PersonDeptPower a INNER JOIN
                SM_Department b ON a.DeptCode = b.Code AND b.DelFlag = '0'
UNION
SELECT   b.Code AS PersonCode, b.DeptCode, a.Name
FROM      SM_Department a INNER JOIN
                SM_Person b ON a.Code = b.DeptCode

GO
/****** Object:  Table [dbo].[SM_PersonDepart_Rel]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_Role]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_PersonInfo]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonInfo]
AS
SELECT   c.ID, c.Code, c.Name, c.Sex, CASE c.Sex WHEN '0' THEN '男' WHEN '1' THEN '女' END AS SexName, c.Account, 
                c.WorkNum, c.[Password] AS Pwd, c.DeptCode, c.Mobile, c.Duty, c.Position, c.Superior, h.Name AS SuperiorName, 
                d .Name AS DeptName, c.CorpCode, e.Name AS CorpName, ee.RoleCode, ee.RoleName, ff.DepartCode, ff.DepartName, 
                c.DelFlag
FROM      dbo.SM_Person AS c LEFT JOIN
                    /*ee【Code1 + RoleCode + RoleName】*/ (SELECT   Code AS Code1, RoleCode = (STUFF
                                                                                                             ((SELECT   ',' + RoleCode
                                                                                                               FROM      (SELECT   a.Code, c.Code AS RoleCode, 
                                                                                                                                                c.Name AS RoleName
                                                                                                                                FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                dbo.SM_PersonRole_Rel AS b ON 
                                                                                                                                                a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                dbo.SM_Role AS c ON 
                                                                                                                                                b.RoleCode = c.Code AND c.DelFlag = '0') 
                                                                                                                               AS bb
                                                                                                               WHERE   Code = aa.Code FOR xml path('')), 1, 1, '')), 
                                                                                                         RoleName = (STUFF
                                                                                                             ((SELECT   ',' + RoleName
                                                                                                               FROM      (SELECT   a.Code, c.Code AS RoleCode, 
                                                                                                                                                c.Name AS RoleName
                                                                                                                                FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                dbo.SM_PersonRole_Rel AS b ON 
                                                                                                                                                a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                dbo.SM_Role AS c ON 
                                                                                                                                                b.RoleCode = c.Code AND c.DelFlag = '0' WHERE   a.DelFlag = '0') 
                                                                                                                               AS bb
                                                                                                               WHERE   Code = aa.Code FOR xml path('')), 1, 1, ''))
                                                                                         FROM      (SELECT   a.Code, c.Code AS RoleCode, 
                                                                                                                          c.Name AS RoleName
                                                                                                          FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                          dbo.SM_PersonRole_Rel AS b ON 
                                                                                                                          a.Code = b.PersonCode LEFT JOIN
                                                                                                                          dbo.SM_Role AS c ON b.RoleCode = c.Code AND 
                                                                                                                          c.DelFlag = '0'
                                                                                                          WHERE   a.DelFlag = '0') AS aa
                                                                                         GROUP BY Code) AS ee ON c.Code = ee.Code1 LEFT JOIN
                    /*ff【Code2 + DepartCode + DepartName】*/ (SELECT   Code AS Code2, DepartCode = (STUFF
                                                                                                                  ((SELECT   ',' + DepartCode
                                                                                                                    FROM      (SELECT   a.Code, c.Code AS DepartCode, 
                                                                                                                                                     c.Name AS DepartName
                                                                                                                                     FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                     dbo.SM_PersonDepart_Rel AS b ON 
                                                                                                                                                     a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                         (SELECT   *
                                                                                                                                                          FROM      dbo.SM_Department
                                                                                                                                                          WHERE   DelFlag = '0') AS c ON 
                                                                                                                                                     b.DepartCode = c.Code WHERE   a.DelFlag = '0') AS bb
                                                                                                                    WHERE   Code = hh.Code FOR xml path('')), 1, 1, '')), 
                                                                                                              DepartName = (STUFF
                                                                                                                  ((SELECT   ',' + DepartName
                                                                                                                    FROM      (SELECT   a.Code, c.Code AS DepartCode, 
                                                                                                                                                     c.Name AS DepartName
                                                                                                                                     FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                     dbo.SM_PersonDepart_Rel AS b ON 
                                                                                                                                                     a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                         (SELECT   *
                                                                                                                                                          FROM      dbo.SM_Department
                                                                                                                                                          WHERE   DelFlag = '0') AS c ON 
                                                                                                                                                     b.DepartCode = c.Code WHERE   a.DelFlag = '0') AS bb
                                                                                                                    WHERE   Code = hh.Code FOR xml path('')), 1, 1, ''))
                                                                                              FROM      (SELECT   a.Code, c.Code AS DepartCode, 
                                                                                                                               c.Name AS DepartName
                                                                                                               FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                               dbo.SM_PersonDepart_Rel AS b ON 
                                                                                                                               a.Code = b.PersonCode LEFT JOIN
                                                                                                                                   (SELECT   *
                                                                                                                                    FROM      dbo.SM_Department
                                                                                                                                    WHERE   DelFlag = '0') AS c ON 
                                                                                                                               b.DepartCode = c.Code
                                                                                                               WHERE   a.DelFlag = '0') AS hh
                                                                                              GROUP BY Code) AS ff ON c.Code = ff.Code2 LEFT JOIN
                dbo.SM_Department AS d ON c.DeptCode = d .Code LEFT JOIN
                dbo.SM_Department AS e ON c.CorpCode = e.Code LEFT JOIN
                dbo.SM_Person AS h ON c.Superior = h.Code
GO
/****** Object:  Table [dbo].[t_BD_ArrangePeriod]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_StartDate]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_BD_StartDate] AS
SELECT
	CONVERT (
		VARCHAR (10),
		MIN (t.WorkDate),
		121
	) AS WorkDate,
	t.Dept
FROM
	t_BD_ArrangePeriod t
WHERE
	t.DelFlag = '0'
GROUP BY
	t.Dept

GO
/****** Object:  Table [dbo].[t_BD_WorkShift]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_ArrangePeriod]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_ArrangePeriod]
AS
SELECT   a.ID, CONVERT(VARCHAR(10), a.WorkDate, 121) AS WorkDate, a.ShiftCode, a.TeamCode, a.Dept, a.DelFlag, a.InputCode, 
                a.InputDate, b.BeginTime, b.EndTime, b.ShiftName, c.TeamName
FROM      dbo.t_BD_ArrangePeriod AS a LEFT OUTER JOIN
                dbo.t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode AND b.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_Team AS c ON a.TeamCode = c.TeamCode AND c.DelFlag = 0

GO
/****** Object:  View [dbo].[V_SM_PersonSuperiorRole]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonSuperiorRole]
AS
SELECT   dd.ID, dd.Code, dd.Name, dd.Account, dd.CorpCode, dd.DelFlag, dd.DeptCode, dd.Duty, dd.Email, dd.Mobile, 
                dd.Password, dd.PersonStatus, dd.Position, dd.Sex, dd.WorkNum, dd.OrderNo, dd.Superior, dd.SuperiorName, 
                dd.DeptName, ee.Code1, RoleCode, RoleName, ff.Code2, ff.DepartCode, ff.DepartName
FROM      (SELECT   c.ID, c.Code, c.Name, c.Account, c.CorpCode, c.DelFlag, c.DeptCode, c.Duty, c.Email, c.Mobile, c.Password, 
                                 c.PersonStatus, c.Position, c.Sex, c.WorkNum, c.OrderNo, c.Superior, d .Name AS SuperiorName, 
                                 e.Name AS DeptName
                 FROM      (SELECT   ID, Code, Name, Sex, WorkNum, Account, Password, DeptCode, CorpCode, Duty, Position, Superior, 
                                                  Mobile, Email, OrderNo, PersonStatus, DelFlag, RandCode, LastPasswordChangeTime
                                  FROM      dbo.SM_Person
                                  WHERE   (Account <> 'System') OR
                                                  (Account IS NULL)) AS c LEFT OUTER JOIN
                                 dbo.SM_Person AS d ON c.Superior = d .Code LEFT OUTER JOIN
                                 dbo.SM_Department AS e ON c.DeptCode = e.Code) AS dd LEFT OUTER JOIN
                    /*dd【人员信息 + SuperName + DeptName】*/ (SELECT   Code AS Code1, RoleCode = (STUFF
                                                                                                                     ((SELECT   ',' + RoleCode
                                                                                                                       FROM      (SELECT   a.Code, c.Code AS RoleCode, 
                                                                                                                                                        c.Name AS RoleName
                                                                                                                                        FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                        dbo.SM_PersonRole_Rel AS b ON 
                                                                                                                                                        a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                            (SELECT   *
                                                                                                                                                             FROM      dbo.SM_Role
                                                                                                                                                             WHERE   DelFlag = '0') AS c ON 
                                                                                                                                                        b.RoleCode = c.Code
                                                                                                                                        WHERE a.DelFlag = '0') AS bb
                                                                                                                       WHERE   Code = aa.Code FOR xml path('')), 1, 1, '')), 
                                                                                                                 RoleName = (STUFF
                                                                                                                     ((SELECT   ',' + RoleName
                                                                                                                       FROM      (SELECT   a.Code, c.Code AS RoleCode, 
                                                                                                                                                        c.Name AS RoleName
                                                                                                                                        FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                        dbo.SM_PersonRole_Rel AS b ON 
                                                                                                                                                        a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                            (SELECT   *
                                                                                                                                                             FROM      dbo.SM_Role
                                                                                                                                                             WHERE   DelFlag = '0') AS c ON 
                                                                                                                                                        b.RoleCode = c.Code
                                                                                                                                        WHERE a.DelFlag = '0') AS bb
                                                                                                                       WHERE   Code = aa.Code FOR xml path('')), 1, 1, ''))
                                                                                                 FROM      (SELECT   a.Code, c_2.Code AS RoleCode, 
                                                                                                                                  c_2.Name AS RoleName
                                                                                                                  FROM      dbo.SM_Person AS a LEFT OUTER JOIN
                                                                                                                                  dbo.SM_PersonRole_Rel AS b ON 
                                                                                                                                  a.Code = b.PersonCode LEFT OUTER JOIN
                                                                                                                                      (SELECT   ID, Code, Name, Describe, 
                                                                                                                                                       DelFlag
                                                                                                                                       FROM      dbo.SM_Role
                                                                                                                                       WHERE   (DelFlag = '0')) AS c_2 ON 
                                                                                                                                  b.RoleCode = c_2.Code
                                                                                                                  WHERE a.DelFlag = '0') AS aa
                                                                                                 GROUP BY Code) AS ee ON dd.Code = ee.Code1 LEFT OUTER JOIN
                    /*ff【Code2 + DepartCode + DepartName】*/ (SELECT   Code AS Code2, DepartCode = (STUFF
                                                                                                                  ((SELECT   ',' + DepartCode
                                                                                                                    FROM      (SELECT   a.Code, c.Code AS DepartCode, 
                                                                                                                                                     c.Name AS DepartName
                                                                                                                                     FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                     dbo.SM_PersonDepart_Rel AS b ON 
                                                                                                                                                     a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                         (SELECT   *
                                                                                                                                                          FROM      dbo.SM_Department
                                                                                                                                                          WHERE   DelFlag = '0') AS c ON 
                                                                                                                                                     b.DepartCode = c.Code WHERE a.DelFlag = '0') AS bb
                                                                                                                    WHERE   Code = hh.Code FOR xml path('')), 1, 1, '')), 
                                                                                                              DepartName = (STUFF
                                                                                                                  ((SELECT   ',' + DepartName
                                                                                                                    FROM      (SELECT   a.Code, c.Code AS DepartCode, 
                                                                                                                                                     c.Name AS DepartName
                                                                                                                                     FROM      dbo.SM_Person AS a LEFT JOIN
                                                                                                                                                     dbo.SM_PersonDepart_Rel AS b ON 
                                                                                                                                                     a.Code = b.PersonCode LEFT JOIN
                                                                                                                                                         (SELECT   *
                                                                                                                                                          FROM      dbo.SM_Department
                                                                                                                                                          WHERE   DelFlag = '0') AS c ON 
                                                                                                                                                     b.DepartCode = c.Code WHERE a.DelFlag = '0') AS bb
                                                                                                                    WHERE   Code = hh.Code FOR xml path('')), 1, 1, ''))
                                                                                              FROM      (SELECT   a.Code, c_1.Code AS DepartCode, 
                                                                                                                               c_1.Name AS DepartName
                                                                                                               FROM      dbo.SM_Person AS a LEFT OUTER JOIN
                                                                                                                               dbo.SM_PersonDepart_Rel AS b ON 
                                                                                                                               a.Code = b.PersonCode LEFT OUTER JOIN
                                                                                                                                   (SELECT   ID, Code, Pcode, Name, Charge, 
                                                                                                                                                    OrderNo, IsCompany, 
                                                                                                                                                    IsProductionDept, DelFlag
                                                                                                                                    FROM      dbo.SM_Department
                                                                                                                                    WHERE   (DelFlag = '0')) AS c_1 ON 
                                                                                                                               b.DepartCode = c_1.Code WHERE a.DelFlag = '0') AS hh
                                                                                              GROUP BY Code) AS ff ON dd.Code = ff.Code2
GO
/****** Object:  Table [dbo].[t_BD_ArrangeResult]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_ArrangeResult]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_ArrangeResult]
AS
SELECT   a.ID, CONVERT(VARCHAR(10), a.WorkDate, 121) AS WorkDate, a.ShiftCode, a.TeamCode, a.Dept, a.InputCode, 
                a.InputDate, a.DelFlag, b.BeginTime, b.EndTime, b.ShiftName, c.TeamName, c.Leader, d.Name AS LeaderName, 
                e.Name AS DeptName
FROM      dbo.t_BD_ArrangeResult AS a LEFT OUTER JOIN
                dbo.t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode AND b.DelFlag = '0' LEFT OUTER JOIN
                dbo.t_BD_Team AS c ON a.TeamCode = c.TeamCode AND c.DelFlag = '0' LEFT OUTER JOIN
                dbo.SM_Person AS d ON c.Leader = d.Code AND d.DelFlag = '0' LEFT OUTER JOIN
                dbo.SM_Department AS e ON a.DeptCode = e.Code AND e.DelFlag = '0'

GO
/****** Object:  View [dbo].[V_BD_GetTeamInfo]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_GetTeamInfo]
AS
SELECT   a.WorkDate, a.ShiftCode, a.TeamCode, a.Dept, a.DelFlag, b.ShiftName, b.BeginTime, b.EndTime, c.TeamName, c.Leader, 
                CONVERT(VARCHAR(100), a.WorkDate, 23) + ' ' + b.BeginTime + ':00' AS BeginDate, 
                CASE WHEN BeginTime > EndTime THEN CONVERT(VARCHAR(100), DATEADD(DAY, 1, WorkDate), 23) 
                + ' ' + EndTime + ':00' ELSE CONVERT(VARCHAR(100), WorkDate, 23) + ' ' + EndTime + ':00' END AS EndDate
FROM      dbo.t_BD_ArrangeResult AS a INNER JOIN
                dbo.t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode AND b.DelFlag = '0' INNER JOIN
                dbo.t_BD_Team AS c ON a.TeamCode = c.TeamCode AND c.DelFlag = '0'
WHERE   (a.DelFlag = '0')

GO
/****** Object:  View [dbo].[V_BD_Mat]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Mat]
AS
SELECT   a.ID, a.MatName, a.MatCode, a.Spec, a.Model, a.FirstUnitCode, a.SecondUnitCode, a.PYCode, a.UseFlag, 
                a.MaxInventory, a.MinInventory, a.SafeInventory, a.Remark, a.DelFlag, a.InputCode, a.InputDate, a.DeptCode, 
                a.CorpCode, a.ModifyCode, a.ModifyDate, a.IsSetBatch, b.UnitDtlName AS FirstUnitName, 
                c.UnitDtlName AS SecondUnitName
FROM      dbo.t_BD_Material AS a LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS b ON a.FirstUnitCode = b.UnitDtlCode AND b.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS c ON a.SecondUnitCode = c.UnitDtlCode AND c.DelFlag = 0

GO
/****** Object:  View [dbo].[V_BD_Material]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Material]
AS
SELECT   a.ID, a.MatName, a.MatCode, a.Spec, a.Model, a.FirstUnitCode, a.SecondUnitCode, a.PYCode, a.UseFlag, 
                a.MaxInventory, a.MinInventory, a.SafeInventory, a.Remark, a.DelFlag, a.InputCode, a.InputDate, a.DeptCode, 
                a.CorpCode, a.ModifyCode, a.ModifyDate, b.UnitDtlName AS FirstUnitName, c.UnitDtlName AS SecondUnitName, 
                t.TypeCode
FROM      dbo.t_BD_Material AS a LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS b ON a.FirstUnitCode = b.UnitDtlCode AND b.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS c ON a.SecondUnitCode = c.UnitDtlCode AND c.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_MaterialRelType AS t ON a.MatCode = t.MatCode AND t.DelFlag = 0

GO
/****** Object:  Table [dbo].[SM_VideoAccount]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectVideo]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_ProjectVideo]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_ProjectVideo]
AS
SELECT   dbo.SM_ProjectVideo.ID, dbo.SM_ProjectVideo.strGTGuid, dbo.SM_ProjectVideo.strName, 
                dbo.SM_ProjectVideo.strDescription, dbo.SM_ProjectVideo.strProjectCode, dbo.SM_ProjectVideo.nOrderNo, 
                dbo.SM_ProjectVideo.strResourceUrl, dbo.SM_ProjectVideo.strDevType, dbo.SM_ProjectVideo.strUserName, 
                dbo.SM_ProjectVideo.strPassword, dbo.SM_ProjectVideo.strDelFlag, dbo.SM_ProjectVideo.strAccountID, 
                dbo.SM_ProjectVideo.strSerialNum, dbo.SM_VideoAccount.strAccountName
FROM      dbo.SM_ProjectVideo LEFT OUTER JOIN
                dbo.SM_VideoAccount ON dbo.SM_ProjectVideo.strAccountID = dbo.SM_VideoAccount.ID
GO
/****** Object:  Table [dbo].[t_BD_MaterialAttr]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_MaterialAttr]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_MaterialAttr]
AS
SELECT   b.ID, b.MatCode, b.AttrCode, b.AttrName, b.AttrValue, b.Remark, b.InputCode, b.InputDate, a.DelFlag, a.Spec
FROM      dbo.t_BD_Material AS a INNER JOIN
                dbo.t_BD_MaterialAttr AS b ON a.MatCode = b.MatCode AND b.DelFlag = 0

GO
/****** Object:  Table [dbo].[SM_OperateContent]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_Log]    Script Date: 2019/6/13 20:53:16 ******/
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
	[strLabelDescribe] [nvarchar](128) NOT NULL,
	[strArea] [nvarchar](64) NOT NULL,
	[strDevice] [nvarchar](64) NOT NULL,
	[strUnit] [nvarchar](64) NOT NULL,
	[strOperateRoute] [nvarchar](255) NOT NULL,
	[strPreContent] [nvarchar](255) NOT NULL,
	[strafterContent] [nvarchar](255) NOT NULL,
	[strContent] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_NLOGID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_SystemResource]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectTag]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectTag](
	[ID] [nvarchar](50) NOT NULL,
	[strID] [nvarchar](80) NULL,
	[strName] [nvarchar](70) NULL,
	[strDescription] [nvarchar](300) NOT NULL,
	[strArea] [nvarchar](64) NOT NULL,
	[strDevice] [nvarchar](64) NOT NULL,
	[strUnit] [nvarchar](64) NOT NULL,
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
/****** Object:  Index [IX_SM_ProjectTag_C]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_SM_ProjectTag_C] ON [dbo].[SM_ProjectTag]
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_SM_Log]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_Log]
AS
SELECT   A.ID, A.strOperater, A.strOperateTime, A.strLabelName, A.strLabelDescribe, A.nLogSource, A.nStatus, 
                CASE WHEN A.nLogSource = 1 THEN 'IODS流程图' WHEN A.nLogSource = 2 THEN '系统日志' WHEN A.nLogSource = 3 THEN
                 'DCS日志' ELSE '' END AS strLogSourceName, A.strOperateRoute, 
                CASE WHEN A.nLogSource = 1 THEN ISNULL(B_1.Title, N'') WHEN A.nLogSource = 2 THEN ISNULL(B_1.Title, N'') 
                WHEN A.nLogSource = 3 THEN '' END AS strOperateRouteName, 
                CASE WHEN A.nLogSource = 3 THEN 0 ELSE A.nOperateContentKey END AS nOperateContentKey, 
                CASE WHEN A.nLogSource = 1 AND nStatus = 0 THEN '失败' WHEN A.nLogSource = 1 AND nStatus = 1 AND 
                (A.nOperateContentKey = 11 OR
                A.nOperateContentKey = 12) THEN ('由' + A.strPreContent + '改为' + A.strafterContent) WHEN A.nLogSource = 1 AND 
                nStatus = 1 AND A.nOperateContentKey = 10 THEN ('置为' + A.strafterContent + ',脉冲时间为' + A.strPreContent + '毫秒') 
                ELSE A.strContent END AS strContent, 
                CASE WHEN A.nLogSource = 3 THEN '其他' ELSE C.strOperateContent END AS strOperateContent, 
                CASE WHEN LEN(A.strArea) > 0 THEN A.strArea ELSE ISNULL(D .strArea, N'') END AS strArea, ISNULL(D.strDevice, N'') 
                AS strDevice, ISNULL(D.strUnit, N'') AS strUnit
FROM      dbo.SM_Log AS A LEFT OUTER JOIN
                    (SELECT   ID, Code, PCode, OrderNo, Title, EnTitle, DelFlag, IsSysMenu, '' AS Type, '' AS ResourceUrl, 
                                     '' AS Parameter, IsHide, '' AS ExternalNetwork
                     FROM      dbo.SM_SystemResource
                     UNION
                     SELECT   ID, Code, SystemResourceCode AS PCode, OrderNo, Title, EnTitle, DelFlag, IsSysMenu, '' AS Type, 
                                     ResourceUrl, Parameter, IsHide, '' AS ExternalNetwork
                     FROM      dbo.SM_SystemResourceDtl
                     UNION
                     SELECT   a.ID, a.Code, a.SystemResourceCode AS PCode, a.OrderNo, a.Title, a.EnTitle, a.DelFlag, a.IsSysMenu, 
                                     b.type, b.path AS ResourceUrl, a.Parameter, a.IsHide, a.ExternalNetwork
                     FROM      dbo.SM_SystemResourceRmisDtl AS a LEFT OUTER JOIN
                                     dbo.t_deply AS b ON a.DeployID = b.Id) AS B_1 ON A.strOperateRoute = B_1.Code AND 
                A.nLogSource = 2 LEFT OUTER JOIN
                dbo.SM_OperateContent AS C ON C.nOperateContentKey = A.nOperateContentKey LEFT OUTER JOIN
                dbo.SM_ProjectTag AS D ON D.strName = A.strLabelName
GO
/****** Object:  View [dbo].[V_SM_RoleProjectSysPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_RoleProjectSysPower]
AS
SELECT   a.ID, a.strRoleCode, b.strButtonID, b.strButtonName, b.strProjectSysPowerCode, b.nPowerCodeType, a.strProjectCode, 
                a.strItemCode, a.nPageButtonConfigID, '1' AS strIsEnable
FROM      dbo.SM_RoleProjectSysPower AS a LEFT OUTER JOIN
                dbo.SM_ProjectPageButtonConfig AS b ON a.nPageButtonConfigID = b.ID
GO
/****** Object:  Table [dbo].[t_BD_UnitConv]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_UnitConv]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_UnitConv]
AS
SELECT   a.ID, a.MatCode, a.BeforeConvCode, a.AfterConvCode, a.ScaledValue, a.Remark, a.DelFlag, 
                b.UnitDtlName AS BeforeConvName, c.UnitDtlName AS AfterConvName
FROM      dbo.t_BD_UnitConv AS a INNER JOIN
                dbo.t_BD_Material AS m ON a.MatCode = m.MatCode AND m.DelFlag = 0 INNER JOIN
                dbo.t_BD_UnitDtl AS b ON a.BeforeConvCode = b.UnitDtlCode AND b.DelFlag = 0 INNER JOIN
                dbo.t_BD_UnitDtl AS c ON a.AfterConvCode = c.UnitDtlCode AND c.DelFlag = 0

GO
/****** Object:  Table [dbo].[t_BD_Supplier]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[t_BD_SupplierMaterialDtl]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_BD_SupplierMaterialDtl]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_SupplierMaterialDtl]
AS
SELECT   dtl.ID, dtl.SupplierCode, sup.SupplierName, mat.MatName, mat.MatCode, mat.Spec, mat.Model, mat.FirstUnitCode, 
                mat.SecondUnitCode, mat.DelFlag, a.UnitDtlName AS FirstUnitName, b.UnitDtlName AS SecondUnitName
FROM      dbo.t_BD_SupplierMaterialDtl AS dtl INNER JOIN
                dbo.t_BD_Material AS mat ON dtl.MatCode = mat.MatCode AND mat.DelFlag = 0 INNER JOIN
                dbo.t_BD_Supplier AS sup ON dtl.SupplierCode = sup.SupplierCode AND sup.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS a ON mat.FirstUnitCode = a.UnitDtlCode AND a.DelFlag = 0 LEFT OUTER JOIN
                dbo.t_BD_UnitDtl AS b ON mat.SecondUnitCode = b.UnitDtlCode AND b.DelFlag = 0

GO
/****** Object:  Table [dbo].[SM_Biz]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_Biz]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_Biz                                               
==============================================================*/
CREATE VIEW [dbo].[V_SM_Biz]
AS
SELECT   a.Code, a.CodeLength, a.CodeOrder, a.CorpCode, a.DelFlag, a.DeptCode, a.ID, a.InputCode, a.InputDate, a.ISYMD, 
                (CASE a.ISYMD WHEN '0' THEN '否' WHEN '1' THEN '是' END) AS ISYMDName, a.MaxCode, a.MinCode, a.ModifyCode, 
                a.ModifyDate, a.ModuleCode, a.Name, a.PolishChar, a.PolishRule, 
                (CASE a.PolishRule WHEN '0' THEN '左补' WHEN '1' THEN '右补' WHEN '2' THEN '不补' END) AS PolishRuleName, 
                a.Prefix, a.Radix, 
                (CASE a.Radix WHEN '0' THEN '二进制' WHEN '1' THEN '八进制' WHEN '2' THEN '十进制' WHEN '3' THEN '十六进制' END)
                 AS RadixName, a.Remark, a.SerialEntity, a.SerialTimeGran, 
                (CASE a.SerialTimeGran WHEN '0' THEN '日' WHEN '1' THEN '月' WHEN '2' THEN '年' ELSE '无' END) 
                AS SerialTimeGranName, a.Suffix, a.ValueSource, b.Title
FROM      dbo.SM_Biz AS a LEFT OUTER JOIN
                dbo.SM_SystemResourceDtl AS b ON a.ModuleCode = b.Code

GO
/****** Object:  Table [dbo].[t_clctr]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_clctr](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](16) NULL,
	[desc] [nvarchar](32) NULL,
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
/****** Object:  Table [dbo].[t_tag]    Script Date: 2019/6/13 20:53:16 ******/
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
	[desc] [nvarchar](32) NULL,
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
/****** Object:  View [dbo].[V_BD_Tag]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_BD_Tag]
AS
SELECT   dbo.t_tag.id, dbo.t_tag.clctr, dbo.t_tag.name, dbo.t_tag.ioaddr, dbo.t_tag.type, dbo.t_tag.version, dbo.t_tag.arcmode, 
                dbo.t_tag.arcto, dbo.t_tag.arcoff, dbo.t_tag.clctrate, dbo.t_tag.clctto, dbo.t_tag.[desc], dbo.t_tag.unit, dbo.t_tag.arcddbnd, 
                dbo.t_tag.clctddbnd, dbo.t_tag.minimal, dbo.t_tag.maximal, dbo.t_tag.lowlimit, dbo.t_tag.highlimit, dbo.t_tag.lololimit, 
                dbo.t_tag.hihilimit, dbo.t_clctr.name AS clctrname, dbo.t_clctr.name + '.' + dbo.t_tag.name AS fullname
FROM      dbo.t_clctr INNER JOIN
                dbo.t_tag ON dbo.t_clctr.id = dbo.t_tag.clctr

GO
/****** Object:  View [dbo].[V_SM_Department]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_Department                                        
==============================================================*/
CREATE VIEW [dbo].[V_SM_Department]
AS
SELECT   ID, Code, Pcode, Name, Charge, OrderNo, IsCompany, IsProductionDept, DelFlag, '' AS hasAuthority
FROM      dbo.SM_Department

GO
/****** Object:  View [dbo].[V_SM_DepartmentPerson]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_DepartmentPerson                                  
==============================================================*/
CREATE VIEW [dbo].[V_SM_DepartmentPerson]
AS
SELECT   c.ID, c.Code, c.Name, c.Pcode, c.Charge AS PersonCode, d.Name AS Charge, c.OrderNo, c.IsCompany, 
                c.IsProductionDept, c.DelFlag
FROM      dbo.SM_Department AS c LEFT OUTER JOIN
                dbo.SM_Person AS d ON c.Charge = d.Code

GO
/****** Object:  View [dbo].[V_SM_DeployDataPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_DeployDataPower                                 
==============================================================*/
CREATE VIEW [dbo].[V_SM_DeployDataPower]
AS
SELECT   b.Parameter, b.DeployID, c.path, c.type, c.pid, a.PersonCode
FROM      dbo.SM_PersonDataPower AS a INNER JOIN
                dbo.SM_SystemResourceRmisDtl AS b ON a.SystemResourceDtlCode = b.Code AND b.DelFlag = '0' INNER JOIN
                dbo.t_deply AS c ON b.DeployID = c.Id

GO
/****** Object:  View [dbo].[V_SM_DeptPerson]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_DeptPerson                                        
==============================================================*/
CREATE VIEW [dbo].[V_SM_DeptPerson]
AS
SELECT   c.ID, c.Code, c.Name, c.DeptCode, d.Name AS DeptName, c.WorkNum, c.Account, c.OrderNo
FROM      (SELECT   ID, Code, Name, Sex, WorkNum, Account, Password, DeptCode, CorpCode, Duty, Position, Superior, Mobile, 
                                 Email, OrderNo, PersonStatus, DelFlag
                 FROM      dbo.SM_Person
                 WHERE   (Code <> 'System')) AS c LEFT OUTER JOIN
                dbo.SM_Department AS d ON c.DeptCode = d.Code
WHERE   (d.DelFlag = '0') AND (c.DelFlag = '0')

GO
/****** Object:  View [dbo].[V_SM_GetAllRoleForCode]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_GetAllRoleForCode                                 
==============================================================*/
CREATE VIEW [dbo].[V_SM_GetAllRoleForCode]
AS
SELECT   a.Code AS RoleCode, b.ID, c.Code
FROM      dbo.SM_PersonRole_Rel AS b LEFT OUTER JOIN
                dbo.SM_Role AS a ON a.Code = b.RoleCode LEFT OUTER JOIN
                dbo.SM_Person AS c ON c.Code = b.PersonCode

GO
/****** Object:  Table [dbo].[SM_PageButtonConfig]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_PersonSysPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_GetButtonForCode]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_GetButtonForCode                                  
==============================================================*/
CREATE VIEW [dbo].[V_SM_GetButtonForCode]
AS
SELECT   a.PersonCode, a.PageButtonConfigID, a.SystemResourceDtlCode
FROM      dbo.SM_PersonSysPower AS a LEFT OUTER JOIN
                dbo.SM_PageButtonConfig AS b ON b.ID = a.PageButtonConfigID

GO
/****** Object:  Table [dbo].[SM_RoleSysPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_GetButtonForRole]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_GetButtonForRole                                  
==============================================================*/
CREATE VIEW [dbo].[V_SM_GetButtonForRole]
AS
SELECT   a.PageButtonConfigID, a.SystemResourceDtlCode, a.RoleCode
FROM      dbo.SM_RoleSysPower AS a LEFT OUTER JOIN
                dbo.SM_PageButtonConfig AS b ON b.ID = a.PageButtonConfigID

GO
/****** Object:  View [dbo].[V_SM_GetPersonResourceForRole]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_GetPersonResourceForRole                          
==============================================================*/
CREATE VIEW [dbo].[V_SM_GetPersonResourceForRole]
AS
SELECT   a.Title, b.Title AS subtitle, c.RoleCode, b.ResourceUrl, b.Parameter, c.CustomPower, c.DataPower, a.ID, 
                c.SystemResourceDtlCode
FROM      dbo.SM_SystemResource AS a LEFT OUTER JOIN
                dbo.SM_SystemResourceDtl AS b ON a.Code = b.SystemResourceCode LEFT OUTER JOIN
                dbo.SM_RoleDataPower AS c ON c.SystemResourceDtlCode = b.Code

GO
/****** Object:  Table [dbo].[SM_RoleDeptPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_PersonDeptPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonDeptPower]
AS
SELECT   a.ID AS Code, a.DeptCode, b.PersonCode
FROM      SM_RoleDeptPower AS a LEFT JOIN
                SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode
UNION ALL
SELECT   ID AS Code, DeptCode, PersonCode
FROM      SM_PersonDeptPower

GO
/****** Object:  View [dbo].[V_SM_MessageInfoDtl]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_MessageInfoDtl                                    
==============================================================*/
CREATE VIEW [dbo].[V_SM_MessageInfoDtl]
AS
SELECT   a.PID, a.PersonCode, b.Name, a.ID
FROM      dbo.SM_MessageInfoDtl AS a LEFT OUTER JOIN
                dbo.SM_Person AS b ON a.PersonCode = b.Code

GO
/****** Object:  View [dbo].[V_SM_PersonResourceForCode]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_PersonResourceForCode                             
==============================================================*/
CREATE VIEW [dbo].[V_SM_PersonResourceForCode]
AS
SELECT   a.Title, b.Title AS subtitle, c.PersonCode, b.ResourceUrl, b.Parameter, c.DataPower, b.Code, c.CustomPower, a.ID
FROM      dbo.SM_SystemResource AS a LEFT OUTER JOIN
                dbo.SM_SystemResourceDtl AS b ON a.Code = b.SystemResourceCode LEFT OUTER JOIN
                dbo.SM_PersonDataPower AS c ON c.SystemResourceDtlCode = b.Code

GO
/****** Object:  View [dbo].[V_SM_PersonSuperior]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_PersonSuperior                                    
==============================================================*/
CREATE VIEW [dbo].[V_SM_PersonSuperior]
AS
SELECT   c.ID, c.Code, c.Name, c.Account, c.CorpCode, c.DelFlag, c.DeptCode, c.Duty, c.Email, c.Mobile, c.Password, 
                c.PersonStatus, c.Position, c.Sex, c.WorkNum, c.OrderNo, c.Superior, d.Name AS SuperiorName, b.RoleCode, 
                a.Name AS RoleName
FROM      dbo.SM_Person AS c LEFT OUTER JOIN
                dbo.SM_PersonRole_Rel AS b ON c.Code = b.PersonCode LEFT OUTER JOIN
                dbo.SM_Role AS a ON a.Code = b.RoleCode LEFT OUTER JOIN
                dbo.SM_Person AS d ON c.Superior = d.Code

GO
/****** Object:  View [dbo].[V_SM_PersonSysPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonSysPower]
AS
SELECT   a.ID AS Code, b.PersonCode, a.IsEnable, c.ButtonID, c.ButtonName, c.SystemResourceDtlCode, c.IsSysMenu, 
                a.PageButtonConfigID, '0' AS strIsEnable
FROM      SM_RoleSysPower AS a LEFT JOIN
                SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode LEFT JOIN
                SM_PageButtonConfig AS c ON a.PageButtonConfigID = c.ID
UNION
SELECT   a.ID AS Code, a.PersonCode, a.IsEnable, b.ButtonID, b.ButtonName, b.SystemResourceDtlCode, b.IsSysMenu, 
                a.PageButtonConfigID, '1' AS strIsEnable
FROM      SM_PersonSysPower AS a LEFT JOIN
                SM_PageButtonConfig AS b ON a.PageButtonConfigID = b.ID
GO
/****** Object:  Table [dbo].[SM_RoleProjectPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_PersonProjectPower]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_PersonProjectPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_PersonProjectPower]
AS
SELECT   a.ID, PersonCode AS strPersonCode, strProjectCode, strItem, strPowerCode, strDataPower, strCustomPower, 
                '0' AS strIsEnable
FROM      dbo.SM_RoleProjectPower AS a LEFT JOIN
                dbo.SM_PersonRole_Rel AS b ON a.strRoleCode = b.RoleCode
UNION ALL
SELECT   ID, strPersonCode, strProjectCode, strItem, strPowerCode, strDataPower, strCustomPower, '1' AS strIsEnable
FROM      dbo.SM_PersonProjectPower
GO
/****** Object:  Table [dbo].[CF_Alarm]    Script Date: 2019/6/13 20:53:16 ******/
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
 CONSTRAINT [PK_CF_Alarm] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CF_Alarm_C]    Script Date: 2019/6/13 20:53:16 ******/
CREATE CLUSTERED INDEX [IX_CF_Alarm_C] ON [dbo].[CF_Alarm]
(
	[strTagName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_CF_Alarm]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CF_Alarm]
AS
SELECT   dbo.SM_ProjectArchitecture.strProjectCode, dbo.SM_ProjectArchitecture.strName AS strProjectName, dbo.CF_Alarm.ID, 
                dbo.CF_Alarm.nAlarmType, dbo.CF_Alarm.nAlarmState, dbo.CF_Alarm.nAlarmlevel, dbo.CF_Alarm.strEventTime, 
                dbo.CF_Alarm.strTagName, dbo.CF_Alarm.strTagDes, dbo.CF_Alarm.strArea, dbo.CF_Alarm.strDevice, 
                dbo.CF_Alarm.strUnit, dbo.CF_Alarm.strMsgDes, dbo.CF_Alarm.fAlarmlimit, dbo.CF_Alarm.strAlarmValue, 
                dbo.CF_Alarm.strRecoveryTime, dbo.CF_Alarm.strAckedTime, dbo.CF_Alarm.strAckedComment, dbo.CF_Alarm.nSource, 
                dbo.CF_Alarm.strIsHide, dbo.CF_Alarm.strNodeDomain, dbo.CF_Alarm.strTypeName, dbo.CF_Alarm.strAlarmTypeDes, 
                dbo.CF_Alarm.nPushStatus, dbo.CF_Alarm.strAlarmLevelDes
FROM      dbo.SM_ProjectArchitecture INNER JOIN
                dbo.SM_ProjectTag ON dbo.SM_ProjectArchitecture.strDelFlag = '0' AND 
                dbo.SM_ProjectArchitecture.strProjectCode = dbo.SM_ProjectTag.strProjectCode INNER JOIN
                dbo.CF_Alarm ON dbo.SM_ProjectTag.strName = dbo.CF_Alarm.strTagName OR 
                dbo.SM_ProjectTag.strName = dbo.CF_Alarm.strNodeDomain
GO
/****** Object:  Table [dbo].[SM_ReceiverGroupDtl]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  View [dbo].[V_SM_ReceiverGroupDtl]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_ReceiverGroupDtl                                  
==============================================================*/
CREATE VIEW [dbo].[V_SM_ReceiverGroupDtl]
AS
SELECT   a.PCode AS GroupCode, a.PersonCode, b.WorkNum, b.Sex, b.Name AS PersonName, b.Position, b.Mobile, b.Email, 
                c.Name AS DeptName
FROM      dbo.SM_ReceiverGroupDtl AS a INNER JOIN
                dbo.SM_Person AS b ON a.PersonCode = b.Code INNER JOIN
                dbo.SM_Department AS c ON b.DeptCode = c.Code
WHERE   (b.DelFlag = '0') AND (c.DelFlag = '0')

GO
/****** Object:  View [dbo].[V_SM_RolePerson]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_RolePerson                                        
==============================================================*/
CREATE VIEW [dbo].[V_SM_RolePerson]
AS
SELECT   a.Code AS RoleCode, c.Code, c.Name, c.Sex, c.WorkNum, c.Account, c.Duty, c.Position, c.Superior,
                    (SELECT   Name
                     FROM      dbo.SM_Person AS d
                     WHERE   (Code = c.Superior)) AS SuperiorName, c.Mobile, c.Email, c.OrderNo, b.ID
FROM      dbo.SM_PersonRole_Rel AS b LEFT OUTER JOIN
                dbo.SM_Role AS a ON a.Code = b.RoleCode LEFT OUTER JOIN
                dbo.SM_Person AS c ON c.Code = b.PersonCode
WHERE   (a.DelFlag = 0) AND (c.DelFlag = 0)

GO
/****** Object:  View [dbo].[V_SM_RoleSysPower]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==============================================================
 View: V_SM_RoleSysPower                                      
==============================================================*/
CREATE VIEW [dbo].[V_SM_RoleSysPower]
AS
SELECT   a.RoleCode, a.IsEnable, b.ButtonID, b.ButtonName, b.SystemResourceDtlCode, b.IsSysMenu
FROM      dbo.SM_RoleSysPower AS a LEFT OUTER JOIN
                dbo.SM_PageButtonConfig AS b ON a.PageButtonConfigID = b.ID

GO
/****** Object:  View [dbo].[V_SM_SystemResourceAll]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SM_SystemResourceAll]
AS
SELECT   id, Code, PCode, OrderNo, Title, EnTitle, DelFlag, IsSysMenu, '' AS Type, '' AS ResourceUrl, '' AS Parameter, IsHide, 
                '' AS ExternalNetwork
FROM      SM_SystemResource
UNION
SELECT   id, Code, SystemResourceCode AS PCode, OrderNo, Title, EnTitle, DelFlag, IsSysMenu, '' AS Type, ResourceUrl, 
                Parameter, IsHide, '' AS ExternalNetwork
FROM      SM_SystemResourceDtl
UNION
SELECT   a.id, Code, SystemResourceCode AS PCode, OrderNo, Title, EnTitle, DelFlag, IsSysMenu, Type, path AS ResourceUrl, 
                Parameter, IsHide, ExternalNetwork
FROM      SM_SystemResourceRmisDtl AS a LEFT JOIN
                t_deply b ON a.DeployID = b.id

GO
/****** Object:  Table [dbo].[CF_AlarmHis]    Script Date: 2019/6/13 20:53:16 ******/
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
 CONSTRAINT [PK_CF_AlarmHis] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CF_ForbidAlarm]    Script Date: 2019/6/13 20:53:16 ******/
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
 CONSTRAINT [PK_FBALARMID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CF_HideAlarm]    Script Date: 2019/6/13 20:53:16 ******/
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
 CONSTRAINT [PK_HDALARMID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_TrendGroup]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_TrendGroup](
	[ID] [nvarchar](50) NOT NULL,
	[strInputCode] [nvarchar](50) NOT NULL,
	[strInputDate] [datetime] NOT NULL,
	[strDeptCode] [nvarchar](50) NOT NULL,
	[strCorpCode] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[PM_TrendGroupAndTag]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_TrendGroupAndTag](
	[ID] [nvarchar](50) NOT NULL,
	[strInputCode] [nvarchar](50) NOT NULL,
	[strInputDate] [datetime] NOT NULL,
	[strDeptCode] [nvarchar](50) NOT NULL,
	[strCorpCode] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[SM_Attachment]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_CodeVou]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_GeneralSettings]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ListFieldConfig]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectFlowChart]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectGIS]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_ProjectGIS](
	[ID] [nvarchar](50) NOT NULL,
	[strProjectCode] [nvarchar](50) NOT NULL,
	[nLon] [decimal](18, 6) NOT NULL,
	[nLat] [decimal](18, 6) NOT NULL,
	[strIcon] [nvarchar](50) NOT NULL,
	[nDisplaySet] [int] NOT NULL,
	[strTagNames] [nvarchar](max) NOT NULL,
	[strRemark] [nvarchar](500) NOT NULL,
	[strDelFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_SM_ProjectGIS_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_ProjectPowerItem]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectReportTemplet]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ProjectSuperReport]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_QueryFieldConfig]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ReceiverGroup]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_ReportRecord]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_SyncObject]    Script Date: 2019/6/13 20:53:16 ******/
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
	[ts] [timestamp] NOT NULL,
 CONSTRAINT [PK_SM_SyncObject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[strObjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_SysSetting]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_UserConfig]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_UserLogin]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[SM_UserPushConfig]    Script Date: 2019/6/13 20:53:16 ******/
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
UNIQUE NONCLUSTERED 
(
	[strPersonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_UserSession]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_UserSession](
	[ID] [nvarchar](50) NOT NULL,
	[strAccount] [nvarchar](50) NOT NULL,
	[strSessionID] [nvarchar](50) NOT NULL,
	[strLastUpdateTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SM_UserSession] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_UserSetting]    Script Date: 2019/6/13 20:53:16 ******/
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
UNIQUE NONCLUSTERED 
(
	[strAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_VideoDevDict]    Script Date: 2019/6/13 20:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_VideoDevDict](
	[ID] [nvarchar](50) NULL,
	[strDeviceType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_BD_Unit]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[t_tag_mobile]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Table [dbo].[tagtest]    Script Date: 2019/6/13 20:53:16 ******/
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
/****** Object:  Index [IX_CF_Alarm_Soft]    Script Date: 2019/6/13 20:53:16 ******/
CREATE NONCLUSTERED INDEX [IX_CF_Alarm_Soft] ON [dbo].[CF_Alarm]
(
	[nAlarmState] ASC,
	[nAlarmlevel] ASC,
	[strEventTime] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PM_TrendGroup_Name]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PM_TrendGroup_Name] ON [dbo].[PM_TrendGroup]
(
	[strTrendGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_Department_Name]    Script Date: 2019/6/13 20:53:16 ******/
CREATE NONCLUSTERED INDEX [IX_SM_Department_Name] ON [dbo].[SM_Department]
(
	[Name] ASC,
	[Pcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_Person_Account]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_Person_Account] ON [dbo].[SM_Person]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectArchitecture_Name]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectArchitecture_Name] ON [dbo].[SM_ProjectArchitecture]
(
	[strPProjectCode] ASC,
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectArchitecture_PP]    Script Date: 2019/6/13 20:53:16 ******/
CREATE NONCLUSTERED INDEX [IX_SM_ProjectArchitecture_PP] ON [dbo].[SM_ProjectArchitecture]
(
	[strPProjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectFlowChart_strID]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectFlowChart_strID] ON [dbo].[SM_ProjectFlowChart]
(
	[strID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectReportPlan]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectReportPlan] ON [dbo].[SM_ProjectReportPlan]
(
	[strID] ASC,
	[strDelFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectSuperReport_Name]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectSuperReport_Name] ON [dbo].[SM_ProjectSuperReport]
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectTag_P]    Script Date: 2019/6/13 20:53:16 ******/
CREATE NONCLUSTERED INDEX [IX_SM_ProjectTag_P] ON [dbo].[SM_ProjectTag]
(
	[strProjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_ProjectVideo_Name]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_ProjectVideo_Name] ON [dbo].[SM_ProjectVideo]
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SM_Role_Name]    Script Date: 2019/6/13 20:53:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SM_Role_Name] ON [dbo].[SM_Role]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CF_Alarm] ADD  CONSTRAINT [DF_CF_Alarm_strTagDes]  DEFAULT ('') FOR [strTagDes]
GO
ALTER TABLE [dbo].[CF_Alarm] ADD  CONSTRAINT [DF_CF_Alarm_strArea]  DEFAULT ('') FOR [strArea]
GO
ALTER TABLE [dbo].[CF_Alarm] ADD  CONSTRAINT [DF_CF_Alarm_strDevice]  DEFAULT ('') FOR [strDevice]
GO
ALTER TABLE [dbo].[CF_Alarm] ADD  CONSTRAINT [DF_CF_Alarm_strUnit]  DEFAULT ('') FOR [strUnit]
GO
ALTER TABLE [dbo].[CF_AlarmHis] ADD  CONSTRAINT [DF_CF_AlarmHis_strTagDes]  DEFAULT ('') FOR [strTagDes]
GO
ALTER TABLE [dbo].[CF_AlarmHis] ADD  CONSTRAINT [DF_CF_AlarmHis_strArea]  DEFAULT ('') FOR [strArea]
GO
ALTER TABLE [dbo].[CF_AlarmHis] ADD  CONSTRAINT [DF_CF_AlarmHis_strDevice]  DEFAULT ('') FOR [strDevice]
GO
ALTER TABLE [dbo].[CF_AlarmHis] ADD  CONSTRAINT [DF_CF_AlarmHis_strUnit]  DEFAULT ('') FOR [strUnit]
GO
ALTER TABLE [dbo].[CF_SysAlarm] ADD  CONSTRAINT [DF_CF_SysAlarm_strTagDes]  DEFAULT ('') FOR [strTagDes]
GO
ALTER TABLE [dbo].[CF_SysAlarm] ADD  CONSTRAINT [DF_CF_SysAlarm_strArea]  DEFAULT ('') FOR [strArea]
GO
ALTER TABLE [dbo].[CF_SysAlarm] ADD  CONSTRAINT [DF_CF_SysAlarm_strDevice]  DEFAULT ('') FOR [strDevice]
GO
ALTER TABLE [dbo].[CF_SysAlarm] ADD  CONSTRAINT [DF_CF_SysAlarm_strUnit]  DEFAULT ('') FOR [strUnit]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_InputCode]  DEFAULT ('') FOR [strInputCode]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_InputDate]  DEFAULT (getdate()) FOR [strInputDate]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_DeptCode]  DEFAULT ('') FOR [strDeptCode]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_CorpCode]  DEFAULT ('') FOR [strCorpCode]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_ModifyCode]  DEFAULT ('') FOR [strModifyCode]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_ModifyDate]  DEFAULT (getdate()) FOR [strModifyDate]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_TrendGroupName]  DEFAULT ('') FOR [strTrendGroupName]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_TrendGroupType]  DEFAULT ((0)) FOR [nTrendGroupType]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_strProjectCode]  DEFAULT ('') FOR [strProjectCode]
GO
ALTER TABLE [dbo].[PM_TrendGroup] ADD  CONSTRAINT [DF_PM_TrendGroup_DelFlag]  DEFAULT ((0)) FOR [strDelFlag]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_InputCode]  DEFAULT ('') FOR [strInputCode]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_InputDate]  DEFAULT (getdate()) FOR [strInputDate]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_DeptCode]  DEFAULT ('') FOR [strDeptCode]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_CorpCode]  DEFAULT ('') FOR [strCorpCode]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_ModifyCode]  DEFAULT ('') FOR [strModifyCode]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_ModifyDate]  DEFAULT (getdate()) FOR [strModifyDate]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_strTrendGroupUUID]  DEFAULT ('') FOR [strTrendGroupID]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_LabelTag]  DEFAULT ('') FOR [strTagName]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_LabelTagDes]  DEFAULT ('') FOR [strTagDes]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_LabelTagColor]  DEFAULT ('') FOR [strTagColor]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_nLowest]  DEFAULT ((0)) FOR [nLowest]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndTag_nHighest]  DEFAULT ((0)) FOR [nHighest]
GO
ALTER TABLE [dbo].[PM_TrendGroupAndTag] ADD  CONSTRAINT [DF_PM_TrendGroupAndLabelPoint_DelFlag]  DEFAULT ((0)) FOR [strDelFlag]
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
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_NetworkRecordNumber]  DEFAULT ('') FOR [NetworkRecordNumber]
GO
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[SM_GeneralSettings] ADD  CONSTRAINT [DF_SM_GeneralSettings_ModifiedTime]  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strOperater]  DEFAULT ('') FOR [strOperater]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strOperateTime]  DEFAULT (getdate()) FOR [strOperateTime]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_nLogSource]  DEFAULT ((2)) FOR [nLogSource]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_nOperateContentKey]  DEFAULT ((0)) FOR [nOperateContentKey]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_nStatus]  DEFAULT ((1)) FOR [nStatus]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strIP]  DEFAULT ('') FOR [strIP]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strLabelName]  DEFAULT ('') FOR [strLabelName]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strLabelDescribe]  DEFAULT ('') FOR [strLabelDescribe]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strArea]  DEFAULT ('') FOR [strArea]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strDevice]  DEFAULT ('') FOR [strDevice]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strUnit]  DEFAULT ('') FOR [strUnit]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strOperateRoute]  DEFAULT ('') FOR [strOperateRoute]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strPreContent]  DEFAULT ('') FOR [strPreContent]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strafterContent]  DEFAULT ('') FOR [strafterContent]
GO
ALTER TABLE [dbo].[SM_Log] ADD  CONSTRAINT [DF_SM_Log_strDCSContent]  DEFAULT ('') FOR [strContent]
GO
ALTER TABLE [dbo].[SM_MessageInfo] ADD  CONSTRAINT [DF__SM_Messag__DelFl__108B795B]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_MessageInfoDtl] ADD  CONSTRAINT [DF__SM_Messag__DelFl__1367E606]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_Person] ADD  CONSTRAINT [DF__SM_Person__DelFl__21B6055D]  DEFAULT ('0') FOR [DelFlag]
GO
ALTER TABLE [dbo].[SM_Person] ADD  DEFAULT (getdate()) FOR [LastPasswordChangeTime]
GO
ALTER TABLE [dbo].[SM_ProjectArchitecture] ADD  CONSTRAINT [DF_SM_ProjectStruct_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectFlowChart] ADD  CONSTRAINT [DF_SM_ProjectFlowChart_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_strProjectCode]  DEFAULT ('') FOR [strProjectCode]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_nLon]  DEFAULT ((0)) FOR [nLon]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_nLat]  DEFAULT ((0)) FOR [nLat]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_strLcon]  DEFAULT ('') FOR [strIcon]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_nDisplaySet]  DEFAULT ((1)) FOR [nDisplaySet]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_strTagNames]  DEFAULT ('') FOR [strTagNames]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_strRemark]  DEFAULT ('') FOR [strRemark]
GO
ALTER TABLE [dbo].[SM_ProjectGIS] ADD  CONSTRAINT [DF_SM_ProjectGIS_strDelFlag]  DEFAULT ((0)) FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectReportTemplet] ADD  CONSTRAINT [DF_SM_ProjectReportTemplet_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectSuperReport] ADD  CONSTRAINT [DF_SM_ProjectSuperReport_DelFlag]  DEFAULT ('0') FOR [strDelFlag]
GO
ALTER TABLE [dbo].[SM_ProjectTag] ADD  CONSTRAINT [DF_SM_ProjectTag_strDescription]  DEFAULT ('') FOR [strDescription]
GO
ALTER TABLE [dbo].[SM_ProjectTag] ADD  CONSTRAINT [DF_SM_ProjectTag_strArea]  DEFAULT ('') FOR [strArea]
GO
ALTER TABLE [dbo].[SM_ProjectTag] ADD  CONSTRAINT [DF_SM_ProjectTag_strDevice]  DEFAULT ('') FOR [strDevice]
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
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_strGTName]  DEFAULT ('') FOR [strGTName]
GO
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_strPlanDescription]  DEFAULT ('') FOR [strPlanDescription]
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
ALTER TABLE [dbo].[SM_ReportPlan] ADD  CONSTRAINT [DF_SM_ReportPlan_strReportTemplateResourceUrl]  DEFAULT ('') FOR [strReportTemplateResourceUrl]
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
ALTER TABLE [dbo].[SM_UserLogin] ADD  CONSTRAINT [DF_SM_UserLogin_IsOrNotLogin]  DEFAULT ((0)) FOR [IsOrNotLogin]
GO
ALTER TABLE [dbo].[t_BD_ArrangePeriod] ADD  CONSTRAINT [DF_t_BD_ArrangePeriod_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_ArrangeResult] ADD  CONSTRAINT [DF_t_BD_ArrangeResult_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Dict] ADD  CONSTRAINT [DF_t_BD_Dict_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_DictDtl] ADD  CONSTRAINT [DF_t_BD_DictDtl_SeqNo]  DEFAULT ((0)) FOR [SeqNo]
GO
ALTER TABLE [dbo].[t_BD_DictDtl] ADD  CONSTRAINT [DF_t_BD_DictDtl_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Material] ADD  CONSTRAINT [DF_t_BD_Material_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_MaterialAttr] ADD  CONSTRAINT [DF_t_BD_MaterialAttr_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_MaterialRelType] ADD  CONSTRAINT [DF_t_BD_MaterialRelType_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Member] ADD  CONSTRAINT [DF_t_BD_Member_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Supplier] ADD  CONSTRAINT [DF_t_BD_Supplier_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_SupplierMaterialDtl] ADD  CONSTRAINT [DF_t_BD_SupplierMaterialDtl_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Team] ADD  CONSTRAINT [DF_t_BD_Team_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_Unit] ADD  CONSTRAINT [DF_t_BD_Unit_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_UnitConv] ADD  CONSTRAINT [DF_t_BD_UnitConv_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_UnitDtl] ADD  CONSTRAINT [DF_t_BD_UnitDtl_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
GO
ALTER TABLE [dbo].[t_BD_WorkShift] ADD  CONSTRAINT [DF_t_BD_Trains_DelFlag]  DEFAULT ((0)) FOR [DelFlag]
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点类型（PC，网闸，云卡）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CF_NodeState', @level2type=N'COLUMN',@level2name=N'nNodeType'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 其他0，登录注销1、新增2、删除3、修改4，置位 = 10,写模拟量值 = 11,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SM_Log', @level2type=N'COLUMN',@level2name=N'nOperateContentKey'
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 146
               Right = 398
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_ArrangePeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_ArrangePeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 146
               Right = 398
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 150
               Left = 237
               Bottom = 290
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 294
               Left = 38
               Bottom = 434
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_ArrangeResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_ArrangeResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dd"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 146
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Dict'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Dict'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 146
               Right = 398
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_GetTeamInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_GetTeamInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 146
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Mat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Mat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 146
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 150
               Left = 239
               Bottom = 290
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Material'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Material'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 146
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_MaterialAttr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_MaterialAttr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 225
               Bottom = 146
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 150
               Left = 262
               Bottom = 290
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 294
               Left = 38
               Bottom = 434
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_MaterialType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_MaterialType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 146
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Member'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Member'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_PersonDeptInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_PersonDeptInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "dtl"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mat"
            Begin Extent = 
               Top = 6
               Left = 244
               Bottom = 146
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sup"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 150
               Left = 249
               Bottom = 290
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 294
               Left = 38
               Bottom = 434
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_SupplierMaterialDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_SupplierMaterialDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_SupplierMaterialDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t_clctr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_tag"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 146
               Right = 394
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 146
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Team'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_Team'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 146
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 239
               Bottom = 290
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_UnitConv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_BD_UnitConv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[13] 2[46] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SM_ProjectArchitecture"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "SM_ProjectTag"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 146
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "CF_Alarm"
            Begin Extent = 
               Top = 6
               Left = 471
               Bottom = 146
               Right = 667
            End
            DisplayFlags = 280
            TopColumn = 17
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4320
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CF_Alarm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CF_Alarm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CF_NodeState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CF_NodeState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CF_ProcessState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CF_ProcessState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 253
               Bottom = 146
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_Biz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_Biz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SM_Department"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 146
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_DepartmentPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_DepartmentPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 307
               Bottom = 146
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_DeployDataPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_DeployDataPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 146
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_DeptPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_DeptPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 127
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 146
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 132
               Left = 38
               Bottom = 272
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetAllRoleForCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetAllRoleForCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetButtonForCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetButtonForCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetButtonForRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetButtonForRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 146
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetPersonResourceForRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_GetPersonResourceForRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[3] 2[54] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B_1"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 146
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 481
               Bottom = 127
               Right = 691
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 729
               Bottom = 146
               Right = 904
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_Log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_Log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 146
               Right = 401
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_MessageInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_MessageInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[11] 2[30] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SM_MessageInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "SM_MessageInfoDtl"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 146
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SM_Person"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 15
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_MessageInfoAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_MessageInfoAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 146
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_MessageInfoDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_MessageInfoDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonDataPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonDataPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonDeptPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonDeptPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[6] 4[6] 2[71] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[28] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonProjectPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonProjectPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonProjectSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonProjectSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 146
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonResourceForCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonResourceForCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 127
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 132
               Left = 240
               Bottom = 272
               Right = 382
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonSuperior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonSuperior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[8] 4[10] 2[73] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonSuperiorRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonSuperiorRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_PersonSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[25] 2[37] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1950
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ProjectArchitectureFullPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ProjectArchitectureFullPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 296
               Bottom = 146
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 18
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ProjectReportPlan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ProjectReportPlan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SM_ProjectVideo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SM_VideoAccount"
            Begin Extent = 
               Top = 6
               Left = 251
               Bottom = 146
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ProjectVideo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ProjectVideo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 127
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 146
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 132
               Left = 38
               Bottom = 272
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ReceiverGroupDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_ReceiverGroupDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 127
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 146
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 132
               Left = 38
               Bottom = 272
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_RolePerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_RolePerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 145
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 290
               Bottom = 145
               Right = 520
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_RoleProjectSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_RoleProjectSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_RoleSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_RoleSysPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourceAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourceAll'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourceDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourceDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourcePowerDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourcePowerDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 291
               Bottom = 146
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourceRmisDtl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_SM_SystemResourceRmisDtl'
GO
