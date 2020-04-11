## SQL Server 2016 Failover Cluster

磁盘阵列SAN存储系统

active directory 域服务配置

NetBIOS域名：DATACENTER

新建域用户：DCADMIN www#1234

### 部署环境

| 用途     | 名称    | 全名                   | IP地址        | 操作系统    |
| -------- | ------- | ---------------------- | ------------- | ----------- |
| 集中存储 | Storage | Storage.datacenter.com | 172.21.48.38  | server 2016 |
| 数据库   | Node-A  | Node-A.datacenter.com  | 172.21.48.116 | server 2016 |
| 数据库   | Node-B  | Node-B.datacenter.com  | 172.21.48.101 | server 2016 |
|          |         |                        |               |             |

### 配置存储

Storage 服务器创建两个ISCSI虚拟磁盘：

#### iSCSI虚拟磁盘1：

1.  虚拟磁盘名称：MSSQL_Storage
2. 目标名称：mssql-storage
3. 访问服务器：172.21.48.101和172.21.48.116

#### iSCSI虚拟磁盘2：仲裁见证盘

1.  虚拟磁盘名称：MSSQL_Quorum

### 数据库服务器连接存储配置磁盘

#### MSSQL1连接存储配置磁盘：

#### MSSQL2连接存储配置磁盘：

#### 数据库服务器安装故障转移群集

#### 配置故障转移群集

```
说明：节点必须开启远程访问，同时勾选“仅允许运行使用网络级别身份验证的远程桌面的计算机连接（建议）（N）”
```

1. 验证配置

2. 创建群集

   群集名称：MSSQL_Cluster

3. 安装SqlServer故障转移群集（MSSQL01）

   SQL Server 网络名称：SQLSERVER01

   IP：172.21.48.90

   服务账户：MSSQL01\Administrator  www#

4. 向SQL Server故障转移群集添加节点（MSSQL02）