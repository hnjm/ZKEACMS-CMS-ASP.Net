-- Script Date: 2022/9/30 22:03  - ErikEJ.SqlCeScripting version 3.5.2.56
SELECT 1;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE [Users] (
  [UserID] nvarchar(50) NOT NULL
, [PassWord] nvarchar(255) NULL
, [ApiLoginToken] nvarchar(255) NULL
, [LastLoginDate] datetime NULL
, [LoginIP] nvarchar(50) NULL
, [PhotoUrl] nvarchar(255) NULL
, [Timestamp] bigint NULL
, [UserName] nvarchar(100) NULL
, [UserTypeCD] int NULL
, [Address] nvarchar(255) NULL
, [Age] int NULL
, [Birthday] datetime NULL
, [Birthplace] nvarchar(255) NULL
, [Email] nvarchar(100) NULL
, [EnglishName] nvarchar(50) NULL
, [FirstName] nvarchar(50) NULL
, [Hobby] nvarchar(100) NULL
, [LastName] nvarchar(50) NULL
, [MaritalStatus] int NULL
, [MobilePhone] nvarchar(50) NULL
, [NickName] nvarchar(50) NULL
, [Profession] nvarchar(50) NULL
, [QQ] nvarchar(50) NULL
, [School] nvarchar(50) NULL
, [Sex] int NULL
, [Telephone] nvarchar(50) NULL
, [ZipCode] nvarchar(50) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [ResetToken] nvarchar(50) NULL
, [ResetTokenDate] datetime NULL
, CONSTRAINT [PK_Users] PRIMARY KEY ([UserID])
);
CREATE TABLE [Subscription] (
  [ID] INTEGER NOT NULL
, [Email] nvarchar(100) NULL
, [Phone] nvarchar(100) NULL
, [Referrer] nvarchar(500) NULL
, [IsValidate] bit NULL
, [Title] nvarchar(50) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Subscrip__3214EC278CC72C80] PRIMARY KEY ([ID])
);
CREATE TABLE [ShippingOption] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [Price] money NULL
, [Rule] ntext NULL
, [ContentID] nvarchar(100) NULL
, [CultureID] int NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Shipping__3214EC27FA5231D1] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionTemplate] (
  [TemplateName] nvarchar(100) NOT NULL
, [Title] nvarchar(255) NULL
, [Thumbnail] nvarchar(100) NULL
, [ExampleData] nvarchar(100) NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_SectionTemplate] PRIMARY KEY ([TemplateName])
);
CREATE TABLE [SectionContentVideo] (
  [ID] nvarchar(100) NOT NULL
, [VideoTitle] nvarchar(200) NULL
, [Thumbnail] nvarchar(200) NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [Width] int NULL
, [Height] int NULL
, [Url] nvarchar(256) NULL
, [Code] ntext NULL
, CONSTRAINT [PK_SectionContentVideo] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentTitle] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [InnerText] nvarchar(255) NULL
, [Href] nvarchar(255) NULL
, [TitleLevel] nvarchar(10) NULL
, CONSTRAINT [PK_SectionContentTitle] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentParagraph] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [HtmlContent] ntext NULL
, CONSTRAINT [PK_SectionContentParagraph] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentImage] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [ImageSrc] nvarchar(255) NULL
, [ImageAlt] nvarchar(255) NULL
, [ImageTitle] nvarchar(255) NULL
, [Href] nvarchar(255) NULL
, [Width] int NULL
, [Height] int NULL
, CONSTRAINT [PK_SectionContentImage] PRIMARY KEY ([ID])
);
CREATE TABLE [SectionContentCallToAction] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [InnerText] nvarchar(255) NULL
, [Href] nvarchar(255) NULL
, CONSTRAINT [PK_SectionContentCallToAction] PRIMARY KEY ([ID])
);
CREATE TABLE [Roles] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(100) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Roles__3214EC27BD77F78C] PRIMARY KEY ([ID])
);
CREATE TABLE [UserRoleRelation] (
  [ID] INTEGER NOT NULL
, [RoleID] int NULL
, [UserID] nvarchar(50) NULL
, CONSTRAINT [PK__UserRole__3214EC27F388641F] PRIMARY KEY ([ID])
, FOREIGN KEY ([RoleID]) REFERENCES [Roles] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([UserID]) REFERENCES [Users] ([UserID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductTag] (
  [ID] INTEGER NOT NULL
, [ProductId] int NULL
, [TagId] int NULL
, [Title] nvarchar(50) NULL
, CONSTRAINT [PK_ProductTag] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductImage] (
  [ID] INTEGER NOT NULL
, [ProductId] int NULL
, [ImageUrl] nvarchar(500) NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ProductImage] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductGallery] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [RawData] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__ProductG__3214EC277F8D7DEF] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductCategoryTag] (
  [ID] INTEGER NOT NULL
, [ProductCategoryId] int NULL
, [Title] nvarchar(50) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [ParentId] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ProductCategoryTag] PRIMARY KEY ([ID])
);
CREATE TABLE [ProductCategory] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [ParentID] int NULL
, [Url] nvarchar(100) NULL
, [Status] int NULL
, [SEOTitle] nvarchar(100) NULL
, [SEOKeyWord] nvarchar(100) NULL
, [SEODescription] nvarchar(300) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ProductCategory] PRIMARY KEY ([ID])
);
CREATE TABLE [Product] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [ImageUrl] nvarchar(255) NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [BrandCD] int NULL
, [ProductCategoryID] int NULL
, [Color] nvarchar(255) NULL
, [Price] money NULL
, [RebatePrice] money NULL
, [PurchasePrice] money NULL
, [Norm] nvarchar(255) NULL
, [ShelfLife] nvarchar(255) NULL
, [ProductContent] ntext NULL
, [Description] ntext NULL
, [IsPublish] bit NOT NULL
, [PublishDate] datetime NULL
, [Status] int NULL
, [SEOTitle] nvarchar(255) NULL
, [SEOKeyWord] nvarchar(255) NULL
, [SEODescription] ntext NULL
, [OrderIndex] int NULL
, [SourceFrom] nvarchar(255) NULL
, [Url] nvarchar(255) NULL
, [TargetFrom] nvarchar(255) NULL
, [TargetUrl] nvarchar(255) NULL
, [PartNumber] nvarchar(200) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Product] PRIMARY KEY ([ID])
, FOREIGN KEY ([ProductCategoryID]) REFERENCES [ProductCategory] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [PersistKey] (
  [ID] nvarchar(100) NOT NULL
, [XML] ntext NULL
, [CreationDate] datetime NULL
, [ActivationDate] datetime NULL
, [ExpirationDate] datetime NULL
, CONSTRAINT [PK__PersistK__3214EC27FE08D69C] PRIMARY KEY ([ID])
);
CREATE TABLE [Permission] (
  [PermissionKey] nvarchar(100) NOT NULL
, [RoleId] int NOT NULL
, [Title] nvarchar(100) NULL
, [Description] nvarchar(500) NULL
, [Module] nvarchar(100) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Permission_PermissionKey_RoleId] PRIMARY KEY ([PermissionKey],[RoleId])
, FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [PageView] (
  [ID] INTEGER NOT NULL
, [PageUrl] nvarchar(500) NULL
, [PageTitle] nvarchar(200) NULL
, [IPAddress] nvarchar(50) NULL
, [SessionID] nvarchar(50) NULL
, [UserAgent] nvarchar(500) NULL
, [Referer] nvarchar(1000) NULL
, [RefererName] nvarchar(255) NULL
, [KeyWords] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_PageView] PRIMARY KEY ([ID])
);
CREATE TABLE [OrderItem] (
  [ID] INTEGER NOT NULL
, [OrderId] nvarchar(50) NOT NULL
, [UserId] nvarchar(50) NOT NULL
, [ImageUrl] nvarchar(500) NOT NULL
, [Quantity] int NOT NULL
, [Price] numeric(18,4) NOT NULL
, [ProductId] int NOT NULL
, [PromoCode] nvarchar(50) NULL
, [Title] nvarchar(200) NOT NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [BasketID] int NULL
, CONSTRAINT [PK_OrderItem] PRIMARY KEY ([ID])
);
CREATE TABLE [Order] (
  [ID] nvarchar(50) NOT NULL
, [UserId] nvarchar(50) NOT NULL
, [Contact] nvarchar(50) NULL
, [PhoneNumber] nvarchar(50) NULL
, [Total] numeric(18,4) NOT NULL
, [OrderStatus] int NOT NULL
, [PayTime] datetime NULL
, [CompletePayTime] datetime NULL
, [TrackingNumber] nvarchar(50) NULL
, [LogisticsCompany] nvarchar(50) NULL
, [ShippingAddress] nvarchar(500) NULL
, [PaymentGateway] nvarchar(50) NULL
, [PaymentID] nvarchar(500) NULL
, [Title] nvarchar(50) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [RefundID] nvarchar(100) NULL
, [Refund] numeric(18,4) NULL
, [RefundDate] datetime NULL
, [RefundReason] nvarchar(500) NULL
, [ShippingOption] int NULL
, [SubTotal] money NULL
, [Tax] money NULL
, [Shipping] money NULL
, CONSTRAINT [PK_Order] PRIMARY KEY ([ID])
);
CREATE TABLE [Navigation] (
  [ID] nvarchar(100) NOT NULL
, [ParentId] nvarchar(100) NULL
, [Url] nvarchar(255) NULL
, [Title] nvarchar(200) NULL
, [IsMobile] bit NULL
, [Html] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [DisplayOrder] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Navigation] PRIMARY KEY ([ID])
);
CREATE TABLE [Language] (
  [LanKey] nvarchar(190) NOT NULL
, [CultureName] nvarchar(10) NOT NULL
, [LanValue] ntext NULL
, [Module] nvarchar(50) NULL
, [LanType] nvarchar(50) NULL
, CONSTRAINT [PK_Language] PRIMARY KEY ([LanKey],[CultureName])
);
CREATE TABLE [Forms] (
  [ID] nvarchar(50) NOT NULL
, [Title] nvarchar(200) NULL
, [FieldsData] ntext NULL
, [NotificationReceiver] nvarchar(500) NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Forms] PRIMARY KEY ([ID])
);
CREATE TABLE [FormDataItem] (
  [ID] INTEGER NOT NULL
, [FormDataId] int NOT NULL
, [FieldId] nvarchar(50) NULL
, [FieldText] nvarchar(1000) NULL
, [FieldValue] ntext NULL
, [OptionValue] nvarchar(50) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FormData] PRIMARY KEY ([ID])
);
CREATE TABLE [FormData] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(500) NULL
, [FormId] nvarchar(50) NOT NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FormData_1] PRIMARY KEY ([ID])
);
CREATE TABLE [FluidContentValue] (
  [ID] INTEGER NOT NULL
, [ContentTypeID] int NULL
, [Title] nvarchar(100) NULL
, [Content] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [ContentID] nvarchar(100) NULL
, [CultureID] int NULL
, [Url] nvarchar(200) NULL
, [SEOTitle] nvarchar(200) NULL
, [SEOKeyWord] nvarchar(200) NULL
, [SEODescription] nvarchar(200) NULL
, CONSTRAINT [PK_FluidContentValue] PRIMARY KEY ([ID])
);
CREATE TABLE [FluidContentType] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(100) NULL
, [ContentSchema] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [GroupID] int NULL
, [RoleID] int NULL
, [Icon] nvarchar(100) NULL
, CONSTRAINT [PK_FluidContentType] PRIMARY KEY ([ID])
);
CREATE TABLE [FluidContentTemplate] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(100) NULL
, [ApplyTo] nvarchar(100) NULL
, [Template] ntext NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_FluidContentTemplate] PRIMARY KEY ([ID])
);
CREATE TABLE [FluidContentGroup] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Icon] nvarchar(100) NULL
, [Description] nvarchar(255) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__FluidCon__3214EC2753BCC946] PRIMARY KEY ([ID])
);
CREATE TABLE [ExtendField] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Value] ntext NULL
, [OwnerModule] nvarchar(50) NULL
, [OwnerID] nvarchar(100) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] nvarchar(255) NULL
, CONSTRAINT [PK_ExtendField] PRIMARY KEY ([ID])
);
CREATE TABLE [DBVersion] (
  [ID] INTEGER NOT NULL
, [Major] int NULL
, [Minor] int NULL
, [Revision] int NULL
, [Build] int NULL
, CONSTRAINT [PK__DBVersio__3214EC27BBD1817F] PRIMARY KEY ([ID])
);
CREATE TABLE [DataDictionary] (
  [ID] INTEGER NOT NULL
, [DicName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [DicValue] nvarchar(255) NULL
, [Order] int NULL
, [Pid] int NULL
, [IsSystem] bit NOT NULL
, [ImageUrl] nvarchar(255) NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [Description] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_DataDictionary] PRIMARY KEY ([ID])
);
CREATE TABLE [DataArchived] (
  [ID] nvarchar(100) NOT NULL
, [Data] ntext NULL
, [Title] nvarchar(50) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_DataArchived] PRIMARY KEY ([ID])
);
CREATE TABLE [Currency] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [Code] nvarchar(10) NULL
, [Symbol] nvarchar(10) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__Currency__3214EC274231DD9D] PRIMARY KEY ([ID])
);
CREATE TABLE [Comments] (
  [ID] INTEGER NOT NULL
, [PagePath] nvarchar(300) NULL
, [UserId] nvarchar(100) NULL
, [Picture] nvarchar(300) NULL
, [UserName] nvarchar(100) NULL
, [CommentContent] nvarchar(500) NULL
, [Agrees] int NULL
, [Disagrees] int NULL
, [Title] nvarchar(50) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Comments] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_WidgetBase] (
  [ID] nvarchar(100) NOT NULL
, [WidgetName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [Position] int NULL
, [LayoutId] nvarchar(100) NULL
, [PageId] nvarchar(100) NULL
, [ZoneId] nvarchar(100) NULL
, [PartialView] nvarchar(255) NULL
, [AssemblyName] nvarchar(255) NULL
, [ServiceTypeName] nvarchar(255) NULL
, [ViewModelTypeName] nvarchar(255) NULL
, [FormView] nvarchar(255) NULL
, [StyleClass] nvarchar(1000) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] ntext NULL
, [Status] int NULL
, [IsTemplate] bit DEFAULT 0 NULL
, [Thumbnail] nvarchar(200) NULL
, [IsSystem] bit DEFAULT 0 NULL
, [ExtendData] ntext NULL
, [RuleID] int NULL
, CONSTRAINT [PK_CMS_WidgetBase] PRIMARY KEY ([ID])
);
CREATE TABLE [VideoWidget] (
  [ID] nvarchar(100) NOT NULL
, [Width] int NULL
, [Height] int NULL
, [Url] nvarchar(255) NULL
, [Code] nvarchar(500) NULL
, CONSTRAINT [PK_VideoWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [StyleSheetWidget] (
  [ID] nvarchar(100) NOT NULL
, [StyleSheet] ntext NULL
, CONSTRAINT [PK_StyleSheetWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [SectionWidget] (
  [ID] nvarchar(100) NOT NULL
, [SectionTitle] nvarchar(255) NULL
, [IsHorizontal] bit NULL
, CONSTRAINT [PK_SectionWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [SectionGroup] (
  [ID] nvarchar(100) NOT NULL
, [GroupName] nvarchar(255) NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [PartialView] nvarchar(100) NULL
, [Order] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [PercentWidth] nvarchar(100) NULL
, CONSTRAINT [PK_SectionGroup] PRIMARY KEY ([ID])
, FOREIGN KEY ([PartialView]) REFERENCES [SectionTemplate] ([TemplateName]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([SectionWidgetId]) REFERENCES [SectionWidget] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [SectionContent] (
  [ID] nvarchar(100) NOT NULL
, [SectionWidgetId] nvarchar(100) NOT NULL
, [SectionGroupId] nvarchar(100) NOT NULL
, [SectionContentType] int NULL
, [Order] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_SectionContent] PRIMARY KEY ([ID])
, FOREIGN KEY ([SectionWidgetId]) REFERENCES [SectionWidget] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ScriptWidget] (
  [ID] nvarchar(100) NOT NULL
, [Script] ntext NULL
, CONSTRAINT [PK_ScriptWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductListWidget] (
  [ID] nvarchar(100) NOT NULL
, [IsPageable] bit NOT NULL
, [ProductCategoryID] int NULL
, [DetailPageUrl] nvarchar(255) NULL
, [Columns] nvarchar(255) NULL
, [PageSize] int NULL
, CONSTRAINT [PK_ProductListWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductDetailWidget] (
  [ID] nvarchar(100) NOT NULL
, [CustomerClass] nvarchar(255) NULL
, CONSTRAINT [PK_ProductDetailWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ProductCategoryWidget] (
  [ID] nvarchar(100) NOT NULL
, [ProductCategoryID] int NULL
, [TargetPage] nvarchar(255) NULL
, CONSTRAINT [PK_ProductCategoryWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [NavigationWidget] (
  [ID] nvarchar(100) NOT NULL
, [CustomerClass] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [Logo] nvarchar(255) NULL
, [AlignClass] nvarchar(50) NULL
, [IsTopFix] bit NULL
, [RootID] nvarchar(100) NULL
, [ShowBasket] bit NULL
, CONSTRAINT [PK_NavigationWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ImageWidget] (
  [ID] nvarchar(100) NOT NULL
, [ImageUrl] nvarchar(255) NULL
, [Width] int NULL
, [Height] int NULL
, [AltText] nvarchar(255) NULL
, [Link] nvarchar(255) NULL
, [ImageUrlMd] nvarchar(225) NULL
, [ImageUrlSm] nvarchar(225) NULL
, CONSTRAINT [PK_ImageWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [HtmlWidget] (
  [ID] nvarchar(100) NOT NULL
, [HTML] ntext NULL
, CONSTRAINT [PK_HtmlWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CMS_Theme] (
  [ID] nvarchar(100) NOT NULL
, [Title] nvarchar(50) NULL
, [Url] nvarchar(100) NULL
, [UrlDebugger] nvarchar(100) NULL
, [Thumbnail] nvarchar(100) NULL
, [IsActived] bit NULL
, [Status] int NULL
, [Description] nvarchar(500) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CMS_Theme] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Rule] (
  [RuleID] INTEGER NOT NULL
, [Title] nvarchar(50) NULL
, [ZoneName] nvarchar(50) NULL
, [RuleExpression] nvarchar(800) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [RuleItems] ntext NULL
, CONSTRAINT [PK_CMS_Rule] PRIMARY KEY ([RuleID])
);
CREATE TABLE [CMS_Redirection] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(200) NOT NULL
, [InComingUrl] nvarchar(500) NOT NULL
, [DestinationURL] nvarchar(500) NOT NULL
, [IsPermanent] bit NOT NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [IsPattern] bit NULL
, CONSTRAINT [PK_CMS_Redirection] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Message] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(50) NULL
, [Email] nvarchar(50) NOT NULL
, [PostMessage] ntext NOT NULL
, [Reply] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] nvarchar(200) NULL
, CONSTRAINT [PK_CMS_Message] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Media] (
  [ID] nvarchar(50) NOT NULL
, [ParentID] nvarchar(50) NULL
, [Title] nvarchar(50) NULL
, [MediaType] int NULL
, [Url] nvarchar(100) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] nvarchar(500) NULL
, CONSTRAINT [PK_CMS_Media] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Layout] (
  [ID] nvarchar(100) NOT NULL
, [LayoutName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [ContainerClass] nvarchar(255) NULL
, [Status] int NULL
, [Description] ntext NULL
, [Script] nvarchar(255) NULL
, [Style] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [ImageUrl] nvarchar(255) NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [Theme] nvarchar(255) NULL
, CONSTRAINT [PK_CMS_Layout] PRIMARY KEY ([ID])
);
CREATE TABLE [CMS_Zone] (
  [ID] nvarchar(100) NOT NULL
, [LayoutId] nvarchar(100) NULL
, [PageId] nvarchar(100) NULL
, [ZoneName] nvarchar(255) NULL
, [Title] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, [Description] ntext NULL
, [Status] int NULL
, [HeadingCode] nvarchar(100) NULL
, CONSTRAINT [PK_CMS_Zone] PRIMARY KEY ([ID])
, FOREIGN KEY ([LayoutId]) REFERENCES [CMS_Layout] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CMS_Page] (
  [ID] nvarchar(100) NOT NULL
, [ReferencePageID] nvarchar(100) NULL
, [IsPublishedPage] bit NULL
, [ParentId] nvarchar(100) NULL
, [PageName] nvarchar(100) NULL
, [IsHomePage] bit NOT NULL
, [Url] nvarchar(255) NULL
, [LayoutId] nvarchar(100) NULL
, [Title] nvarchar(255) NULL
, [Content] ntext NULL
, [DisplayOrder] int NULL
, [Description] ntext NULL
, [Status] int NULL
, [IsPublish] bit NOT NULL
, [PublishDate] datetime NULL
, [MetaKeyWorlds] nvarchar(255) NULL
, [MetaDescription] nvarchar(255) NULL
, [Script] nvarchar(255) NULL
, [Style] nvarchar(255) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CMS_Page] PRIMARY KEY ([ID])
, FOREIGN KEY ([LayoutId]) REFERENCES [CMS_Layout] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CMS_LayoutHtml] (
  [LayoutHtmlId] INTEGER NOT NULL
, [LayoutId] nvarchar(100) NOT NULL
, [PageId] nvarchar(100) NULL
, [Html] ntext NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CMS_LayoutHtml] PRIMARY KEY ([LayoutHtmlId])
, FOREIGN KEY ([LayoutId]) REFERENCES [CMS_Layout] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Carousel] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Height] int NULL
, [Description] nvarchar(255) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Carousel] PRIMARY KEY ([ID])
);
CREATE TABLE [CarouselWidget] (
  [ID] nvarchar(100) NOT NULL
, [CarouselID] int NULL
, CONSTRAINT [PK_CarouselWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([CarouselID]) REFERENCES [Carousel] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CarouselItem] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [CarouselID] int NULL
, [CarouselWidgetID] nvarchar(100) NULL
, [TargetLink] nvarchar(255) NULL
, [ImageUrl] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_CarouselItem] PRIMARY KEY ([ID])
, FOREIGN KEY ([CarouselWidgetID]) REFERENCES [CarouselWidget] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Basket] (
  [ID] INTEGER NOT NULL
, [UserId] nvarchar(50) NOT NULL
, [ImageUrl] nvarchar(500) NOT NULL
, [Quantity] int NOT NULL
, [Price] numeric(18,4) NOT NULL
, [ProductId] int NOT NULL
, [PromoCode] nvarchar(50) NULL
, [Title] nvarchar(200) NOT NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Basket] PRIMARY KEY ([ID])
);
CREATE TABLE [ArticleTypeWidget] (
  [ID] nvarchar(100) NOT NULL
, [ArticleTypeID] int NULL
, [TargetPage] nvarchar(255) NULL
, CONSTRAINT [PK_ArticleTypeWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ArticleType] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [ParentID] int NULL
, [Url] nvarchar(100) NULL
, [Status] int NULL
, [SEOTitle] nvarchar(100) NULL
, [SEOKeyWord] nvarchar(100) NULL
, [SEODescription] nvarchar(300) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ArticleType] PRIMARY KEY ([ID])
);
CREATE TABLE [ArticleTopWidget] (
  [ID] nvarchar(100) NOT NULL
, [ArticleTypeID] int NULL
, [Tops] int NULL
, [SubTitle] nvarchar(255) NULL
, [MoreLink] nvarchar(255) NULL
, [DetailPageUrl] nvarchar(255) NULL
, CONSTRAINT [PK_ArticleTopWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ArticleSummaryWidget] (
  [ID] nvarchar(100) NOT NULL
, [SubTitle] nvarchar(255) NULL
, [Style] nvarchar(255) NULL
, [DetailLink] nvarchar(255) NULL
, [Summary] ntext NULL
, CONSTRAINT [PK_ArticleSummaryWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ArticleListWidget] (
  [ID] nvarchar(100) NOT NULL
, [ArticleTypeID] int NULL
, [DetailPageUrl] nvarchar(255) NULL
, [IsPageable] bit NOT NULL
, [PageSize] int NULL
, CONSTRAINT [PK_ArticleListWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ArticleGallery] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Description] nvarchar(255) NULL
, [RawData] ntext NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK__ArticleG__3214EC273433E1E6] PRIMARY KEY ([ID])
);
CREATE TABLE [ArticleDetailWidget] (
  [ID] nvarchar(100) NOT NULL
, [CustomerClass] nvarchar(255) NULL
, CONSTRAINT [PK_ArticleDetailWidget] PRIMARY KEY ([ID])
, FOREIGN KEY ([ID]) REFERENCES [CMS_WidgetBase] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Article] (
  [ID] INTEGER NOT NULL
, [Title] nvarchar(255) NULL
, [Summary] nvarchar(255) NULL
, [MetaKeyWords] nvarchar(255) NULL
, [MetaDescription] nvarchar(255) NULL
, [Counter] int NULL
, [ArticleTypeID] int NULL
, [Description] nvarchar(255) NULL
, [ArticleContent] ntext NULL
, [Status] int NULL
, [ImageThumbUrl] nvarchar(255) NULL
, [ImageUrl] nvarchar(255) NULL
, [IsPublish] bit NOT NULL
, [PublishDate] datetime NULL
, [Url] nvarchar(100) NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_Article] PRIMARY KEY ([ID])
, FOREIGN KEY ([ArticleTypeID]) REFERENCES [ArticleType] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [ApplicationSetting] (
  [SettingKey] nvarchar(50) NOT NULL
, [Value] ntext NULL
, [Title] nvarchar(50) NULL
, [Description] nvarchar(500) NULL
, [Status] int NULL
, [CreateBy] nvarchar(50) NULL
, [CreatebyName] nvarchar(100) NULL
, [CreateDate] datetime NULL
, [LastUpdateBy] nvarchar(50) NULL
, [LastUpdateByName] nvarchar(100) NULL
, [LastUpdateDate] datetime NULL
, CONSTRAINT [PK_ApplicationSetting] PRIMARY KEY ([SettingKey])
);
INSERT INTO [Users] ([UserID],[PassWord],[ApiLoginToken],[LastLoginDate],[LoginIP],[PhotoUrl],[Timestamp],[UserName],[UserTypeCD],[Address],[Age],[Birthday],[Birthplace],[Email],[EnglishName],[FirstName],[Hobby],[LastName],[MaritalStatus],[MobilePhone],[NickName],[Profession],[QQ],[School],[Sex],[Telephone],[ZipCode],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Status],[Description],[ResetToken],[ResetTokenDate]) VALUES ('admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,'2020-11-10 21:40:58.163','::1','~/images/head.png',0,'ZKEASOFT',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Admin',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'admin','Admin','2020-11-10 21:40:58.183',1,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Banner','????????????','Thumbnail\SectionTemplate.Banner.png','Thumbnail\SectionTemplate.Banner.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Brand','??????','Thumbnail\SectionTemplate.Brand.png','Thumbnail\SectionTemplate.Brand.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.CalendarEvent','????????????','Thumbnail\SectionTemplate.CalendarEvent.png','Thumbnail\SectionTemplate.CalendarEvent.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Column','??????','Thumbnail\SectionTemplate.Column.png','Thumbnail\SectionTemplate.Column.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Default','??????','Thumbnail\SectionTemplate.Default.png','Thumbnail\SectionTemplate.Default.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.GreyBox','?????????','Thumbnail\SectionTemplate.GreyBox.png','Thumbnail\SectionTemplate.GreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageBox','?????????','Thumbnail\SectionTemplate.ImageBox.png','Thumbnail\SectionTemplate.ImageBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageGreyBox','?????????','Thumbnail\SectionTemplate.ImageGreyBox.png','Thumbnail\SectionTemplate.ImageGreyBox.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ImageRight','?????????','Thumbnail\SectionTemplate.ImageRight.png','Thumbnail\SectionTemplate.ImageRight.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.JCarousel','?????????','Thumbnail\SectionTemplate.JCarousel.png','Thumbnail\SectionTemplate.JCarousel.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LeftThreeIcon','????????????','Thumbnail\SectionTemplate.LeftThreeIcon.png','Thumbnail\SectionTemplate.LeftThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LifeStyle','????????????','Thumbnail\SectionTemplate.LifeStyle.png','Thumbnail\SectionTemplate.LifeStyle.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.LinkGroup','?????????','Thumbnail\SectionTemplate.LinkGroup.png','Thumbnail\SectionTemplate.LinkGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListGroup','?????????','Thumbnail\SectionTemplate.ListGroup.png','Thumbnail\SectionTemplate.ListGroup.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ListView','????????????','Thumbnail\SectionTemplate.ListView.png','Thumbnail\SectionTemplate.ListView.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Portfolio','????????????','Thumbnail\SectionTemplate.Portfolio.png','Thumbnail\SectionTemplate.Portfolio.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ProductHero','????????????','Thumbnail\SectionTemplate.ProductHero.png','Thumbnail\SectionTemplate.ProductHero.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Quote','??????','Thumbnail\SectionTemplate.Quote.png','Thumbnail\SectionTemplate.Quote.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.RightThreeIcon','????????????','Thumbnail\SectionTemplate.RightThreeIcon.png','Thumbnail\SectionTemplate.RightThreeIcon.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.SalePrice','????????????','Thumbnail\SectionTemplate.SalePrice.png','Thumbnail\SectionTemplate.SalePrice.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.ShortcutNav','????????????','Thumbnail\SectionTemplate.ShortcutNav.png','Thumbnail\SectionTemplate.ShortcutNav.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Tab','?????????','Thumbnail\SectionTemplate.Tab.png','Thumbnail\SectionTemplate.Tab.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionTemplate] ([TemplateName],[Title],[Thumbnail],[ExampleData],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SectionTemplate.Thumbnail','?????????','Thumbnail\SectionTemplate.Thumbnail.png','Thumbnail\SectionTemplate.Thumbnail.xml',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('105','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('107','f41174cfa4d247f4974c47f4d2b000fd','ZKEACMS',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('14','2b3eb61307d24c50a6b3aaa75db3810e','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('17','00f62c5acfe840e0bee3ca2979f0f025','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('20','f6f11ba2fec844de883acf0a1fe3eb89','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('23','481574ebc98b4cdf9a07e3f20c1ab78d','WHY CHOOSE US?',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('33','55b73e54fd054de4847960bdac350c6d','?????????',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('34','55b73e54fd054de4847960bdac350c6d','????????????',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('47','1fb967867e3b440e86336bc5a51e8719','?????????',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('48','1fb967867e3b440e86336bc5a51e8719','????????????',NULL,NULL);
INSERT INTO [SectionContentTitle] ([ID],[SectionWidgetId],[InnerText],[Href],[TitleLevel]) VALUES ('49','1fb967867e3b440e86336bc5a51e8719','?????????',NULL,NULL);
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('106','f41174cfa4d247f4974c47f4d2b000fd','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>?????????<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>?????????ASP.NET MVC4???????????????CMS???</p>
<p>ZKEACMS???????????????????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('108','f41174cfa4d247f4974c47f4d2b000fd','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>?????????<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>?????????ASP.NET MVC4???????????????CMS???</p>
<p>ZKEACMS???????????????????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('15','2b3eb61307d24c50a6b3aaa75db3810e','<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('165','80f365c7991a49a0b04aa11006018814','<p>?????????,??????:admin</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('18','00f62c5acfe840e0bee3ca2979f0f025','<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('21','f6f11ba2fec844de883acf0a1fe3eb89','<p>ZKEACMS???????????????????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('24','481574ebc98b4cdf9a07e3f20c1ab78d','<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('26','b568ff7f4a894870adaf9afadf787bf9','<p><span>??????????????????????????????????????????????????????</span><span>???????????????????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('28','b568ff7f4a894870adaf9afadf787bf9','<p><span>??????????????????????????????????????????????????????</span><span>???????????????????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('30','55b73e54fd054de4847960bdac350c6d','<p><span>??????????????????????????????????????????????????????</span><span>???????????????????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('32','55b73e54fd054de4847960bdac350c6d','<p><span>??????????????????????????????????????????????????????</span><span>???????????????????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('36','ed837392097f4e60b812bc57111dd762','<p><span>?????????????????????????????????</span><span>????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('38','ed837392097f4e60b812bc57111dd762','<p><span>?????????????????????????????????</span><span>????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('40','ed837392097f4e60b812bc57111dd762','<p><span>?????????????????????????????????</span><span>????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('42','1fb967867e3b440e86336bc5a51e8719','<p><span>??????????????????????????????????????????????????????</span><span>???????????????????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('44','1fb967867e3b440e86336bc5a51e8719','<p><span>?????????????????????????????????</span><span>????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('46','1fb967867e3b440e86336bc5a51e8719','<p><span>??????????????????????????????????????????</span><span>?????????????????????????????????????????????????????????</span></p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','<p>?????????,??????:admin</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','<p>?????????????????????????????????</p>');
INSERT INTO [SectionContentParagraph] ([ID],[SectionWidgetId],[HtmlContent]) VALUES ('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','<p>?????????????????????????????????</p>');
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('13','2b3eb61307d24c50a6b3aaa75db3810e','~/images/01.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('16','00f62c5acfe840e0bee3ca2979f0f025','~/images/02.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('19','f6f11ba2fec844de883acf0a1fe3eb89','~/images/04.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('22','481574ebc98b4cdf9a07e3f20c1ab78d','~/images/03.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('25','b568ff7f4a894870adaf9afadf787bf9','~/images/05.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('27','b568ff7f4a894870adaf9afadf787bf9','~/images/06.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('29','55b73e54fd054de4847960bdac350c6d','~/images/07.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('31','55b73e54fd054de4847960bdac350c6d','~/images/08.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('35','ed837392097f4e60b812bc57111dd762','~/images/09.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('37','ed837392097f4e60b812bc57111dd762','~/images/10.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('39','ed837392097f4e60b812bc57111dd762','~/images/11.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('41','1fb967867e3b440e86336bc5a51e8719','~/images/12.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('43','1fb967867e3b440e86336bc5a51e8719','~/images/13.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentImage] ([ID],[SectionWidgetId],[ImageSrc],[ImageAlt],[ImageTitle],[Href],[Width],[Height]) VALUES ('45','1fb967867e3b440e86336bc5a51e8719','~/images/14.jpg',NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','????????????','http://www.zkea.net/licenses');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','????????????','/admin');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('1','80f365c7991a49a0b04aa11006018814','????????????','/admin');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('163','604b2461f7c545e28dbb21fb15def5c7','????????????','http://www.zkea.net/zkeacms/price');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('164','604b2461f7c545e28dbb21fb15def5c7','????????????','http://www.zkea.net/licenses');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','????????????','/Account');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','????????????','http://www.zkea.net/zkeacms/price');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','????????????','http://www.zkea.net/zkeacms/document');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('3','604b2461f7c545e28dbb21fb15def5c7','GitHub','https://github.com/SeriaWei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('4','604b2461f7c545e28dbb21fb15def5c7','ZKEACMS(.Net4)','http://www.zkea.net/zkeacms');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','????????????','http://git.oschina.net/seriawei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('5','604b2461f7c545e28dbb21fb15def5c7','????????????','http://www.zkea.net');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('6','604b2461f7c545e28dbb21fb15def5c7','????????????','http://git.oschina.net/seriawei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','GitHub','https://github.com/SeriaWei/ZKEACMS.Core');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','????????????','http://www.zkea.net');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','????????????','http://www.zkea.net/zkeacms/document');
INSERT INTO [SectionContentCallToAction] ([ID],[SectionWidgetId],[InnerText],[Href]) VALUES ('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','????????????','/Account');
INSERT INTO [Roles] ([ID],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'???????????????','???????????????',1,NULL,NULL,NULL,'admin','ZKEASOFT','2021-03-06 22:16:30.963');
INSERT INTO [UserRoleRelation] ([ID],[RoleID],[UserID]) VALUES (5,1,'admin');
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (28,1,3,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (29,1,2,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (30,2,7,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (31,2,6,NULL);
INSERT INTO [ProductTag] ([ID],[ProductId],[TagId],[Title]) VALUES (32,2,5,NULL);
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,1,'/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','HX-HSCR-BK/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.747');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,1,'/images/6006218/56657706-58757e00-66cb-11e9-80b8-fdc32783ff68.png','HX-HSCRS-GM/AS',NULL,1,'admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 19:58:48.750');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,2,'/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,2,'/images/6006218/56657774-78a53d00-66cb-11e9-9ab9-c4b65f3cba22.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,2,'/images/6006218/56657795-85299580-66cb-11e9-9a3f-a1c5bde7b191.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductImage] ([ID],[ProductId],[ImageUrl],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,2,'/images/6006218/56657844-9a9ebf80-66cb-11e9-91ed-02001fab09c8.png',NULL,NULL,1,'admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 20:00:41.010');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,2,'??????',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:45.550');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,2,'??????',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:10:50.530');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,2,'????????????',NULL,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:11:03.657');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,3,'????????????',NULL,NULL,0,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:07.707');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,3,'??????',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:14.870');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,3,'??????',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:20.713');
INSERT INTO [ProductCategoryTag] ([ID],[ProductCategoryId],[Title],[Description],[Status],[ParentId],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,3,'??????',NULL,NULL,4,NULL,NULL,NULL,'admin','ZKEASOFT','2017-11-17 15:12:28.660');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'??????',NULL,0,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:32.000','admin','ZKEASOFT','2017-11-17 15:10:08.193');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'??????',NULL,1,'headset',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:49:50.000','admin','ZKEASOFT','2018-08-15 15:30:59.233');
INSERT INTO [ProductCategory] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'??????',NULL,1,'keyboard',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:07.000','admin','ZKEASOFT','2018-08-15 15:31:08.063');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Cloud Revolver ????????????','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png','/images/6006218/56657656-33810b00-66cb-11e9-8acc-1f2f5da6c48a.png',NULL,2,NULL,500.0000,399.0000,NULL,NULL,NULL,'<h1>HyperX Cloud Revolver</h1>
<p>??????????????????????????????????????????????????????????????????????????????????????????????????????HyperX Cloud Revolver&trade; ????????????????????????????????????????????????????????????OC?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Revolver ??????????????????????????????????????? Dolby&reg; 7.1 ???????????????????????????????????????????????????????????????????????????????????? FPS ????????????????????????????????????????????????????????????????????????????????????????????????????????? HyperX ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Cloud Revolver ?????????????????????????????????</p>
<h3>???????????? Dolby&reg; ??????????????? 7.1&nbsp;</h3>
<p>????????? 7 ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<br />?????? Cloud Revolver S ????????????</p>
<h3>????????? USB ?????????????????? DSP ??????&nbsp;</h3>
<p>USB ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? Dolby ????????????????????????????????????????????????????????????????????????????????????????????????<br />?????? Cloud Revolver S ????????????</p>
<h3>????????? 50 ???????????????&nbsp;</h3>
<p>?????????????????? 50mm ??????????????????????????????????????????????????????????????????????????????<br />?????? Cloud Revolver ??? Cloud Revolver S ????????????</p>
<h3>HyperX ?????????????????????&nbsp;</h3>
<p>??????????????? HyperX ?????????????????????????????????????????????????????????????????????????????????????????????<br />?????? Cloud Revolver ??? Cloud Revolver S ????????????</p>','????????? 7 ??????????????????????????????????????????????????????????????????',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Cloud-Revolver',NULL,NULL,'HX-HSCR-BK/AS','admin','ZKEASOFT','2017-11-17 15:18:54.000','admin','ZKEASOFT','2019-04-24 21:52:05.397');
INSERT INTO [Product] ([ID],[Title],[ImageUrl],[ImageThumbUrl],[BrandCD],[ProductCategoryID],[Color],[Price],[RebatePrice],[PurchasePrice],[Norm],[ShelfLife],[ProductContent],[Description],[IsPublish],[PublishDate],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[OrderIndex],[SourceFrom],[Url],[TargetFrom],[TargetUrl],[PartNumber],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'Alloy FPS ??????????????????','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png','/images/6006218/56657740-675c3080-66cb-11e9-983a-6bce76f4a8fb.png',NULL,3,'??????',500.0000,499.0000,NULL,NULL,NULL,'<h1>????????????????????????????????? FPS ?????????</h1>
<p>HyperX&trade; Alloy FPS ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????Alloy FPS ????????????????????????????????????????????? Tenkeyless (TKL) ???????????????????????????????????????????????? Alloy FPS Pro ????????????????????????????????????1??????????????????????????????????????? FPS ???????????????????????????????????????????????? CHERRY&reg; MX ??????????????????????????????????????????????????????????????????100% ???????????????????????????????????????????????????????????? FPS ???????????????????????????????????????HyperX Alloy FPS ???????????????????????????????????????</p>
<h3>?????????????????????????????? FPS ?????????????????????&nbsp;</h3>
<p>?????????????????????????????????????????????????????????</p>
<h3>????????????&nbsp;</h3>
<p>?????????????????????????????????</p>
<h3>CHERRY&reg; MX ??????????????????????????????&nbsp;</h3>
<p>????????? CHERRY MX Blue???Brown ??? Red ??????????????????????????????????????????????????????????????????????????????</p>
<h3>??????????????????????????????????????????&nbsp;</h3>
<p>???????????????????????????????????????????????????</p>
<h3>HyperX ????????????????????????????????????????????????</h3>
<p>????????????????????????????????????</p>','????????????,CHERRY?? MX ??????????????????,????????????????????????',1,'2017-11-17 00:00:00.000',1,NULL,NULL,NULL,NULL,NULL,'Alloy-FPS',NULL,NULL,'HX-KB4RD1-US/R1','admin','ZKEASOFT','2017-11-17 15:30:22.000','admin','ZKEASOFT','2019-04-24 21:52:25.420');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_Manage',1,'??????????????????',NULL,'??????/??????',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ApplicationSetting_View',1,'??????????????????',NULL,'??????/??????',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Manage',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:18:40.493','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_Publish',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2017-05-25 12:36:10.820','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Article_View',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:17:59.120','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_Manage',1,'??????????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:22:24.887','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ArticleType_View',1,'??????????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:19:54.500','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_Manage',1,'???????????????',NULL,'?????????',NULL,'admin','ZKEASOFT','2016-08-01 13:45:46.190','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Carousel_View',1,'???????????????',NULL,'?????????',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.097','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_Manage',1,'????????????',NULL,'????????????',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.053','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Comments_View',1,'????????????',NULL,'????????????',NULL,'admin','ZKEASOFT','2017-12-03 17:09:48.050','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Config_Currency',1,'Currency',NULL,'Setting',NULL,'admin','ZKEASOFT','2021-03-06 22:16:30.727','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EventViewer_Manage',1,'??????????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2017-07-11 15:43:52.147','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_Manage',1,'????????????',NULL,'???????????????',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Form_View',1,'????????????',NULL,'???????????????',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.830','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Export',1,'??????????????????',NULL,'???????????????',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.853','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_Manage',1,'??????????????????',NULL,'???????????????',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.850','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('FormData_View',1,'??????????????????',NULL,'???????????????',NULL,'admin','ZKEASOFT','2017-10-12 15:11:51.843','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Language_Manage',1,'??????',NULL,'??????',NULL,'admin','ZKEASOFT','2017-11-17 11:47:13.093','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_Manage',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 12:43:52.697','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Layout_View',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.690','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('LiveChatScript_Manage',1,'????????????????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_Manage',1,'???????????????',NULL,'?????????',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.553','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Media_View',1,'???????????????',NULL,'?????????',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.090','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_Manage',1,'????????????',NULL,'?????????',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.980','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Message_View',1,'????????????',NULL,'?????????',NULL,'admin','ZKEASOFT','2017-03-19 21:01:14.960','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('MessageNotification_Manage',1,'??????????????????',NULL,'????????????',NULL,'admin','ZKEASOFT','2018-08-15 15:25:42.620','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_Manage',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:40:38.230','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Navigation_View',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:38:21.943','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Manage',1,'Manage Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_Refund',1,'Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_View',1,'View Order',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderPayment',1,'View Transactions',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Order_ViewOrderRefund',1,'View Refund',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_Manage',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:41:08.463','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Page_View',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 12:37:56.683','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Payment_Config_Manage',1,'Payment Setting',NULL,'Shop',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.680','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Plugin_View',1,'??????',NULL,'??????',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.727','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Manage',1,'Manage Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_Publish',1,'Publish Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Product_View',1,'View Product',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.657','admin','ZKEASOFT','2021-03-06 22:16:30.723');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_Manage',1,'Manage Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategory_View',1,'View Product Category',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_Manage',1,'Manage Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ProductCategoryTag_View',1,'View Product Tag',NULL,'Product',NULL,'admin','ZKEASOFT','2020-03-17 21:48:04.677','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('RobotsSetting',1,'Robots.txt',NULL,'??????',NULL,'admin','ZKEASOFT','2018-08-12 22:51:30.340','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_Manage',1,'????????????',NULL,'??????/??????',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Role_View',1,'????????????',NULL,'??????/??????',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.660','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SMTPSetting',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2018-06-12 19:13:49.497','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('StatisticsScript_Manage',1,'????????????????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2019-04-07 16:39:16.730','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_Manage',1,'????????????',NULL,'????????????',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.307','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Template_View',1,'????????????',NULL,'????????????',NULL,'admin','ZKEASOFT','2019-05-21 21:39:09.303','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('TemplateImporter_Import',1,'Import Html Template',NULL,'Setting',NULL,'admin','ZKEASOFT','2020-03-14 11:41:54.510','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_Manage',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:42:48.600','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Theme_View',1,'????????????',NULL,'??????',NULL,'admin','ZKEASOFT','2016-08-01 13:37:56.083','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_Manage',1,'??????URL ?????????',NULL,'URL ?????????',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.170','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UrlRedirect_View',1,'??????URL ?????????',NULL,'URL ?????????',NULL,'admin','ZKEASOFT','2017-08-14 14:55:58.120','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_Manage',1,'????????????',NULL,'??????/??????',NULL,'admin','ZKEASOFT','2016-08-01 14:12:07.567','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Permission] ([PermissionKey],[RoleId],[Title],[Description],[Module],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('User_View',1,'????????????',NULL,'??????/??????',NULL,'admin','ZKEASOFT','2016-08-01 13:37:46.647','admin','ZKEASOFT','2021-03-06 22:16:30.727');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1061019b1bcd4bf3aeb3df647c74c309','#','~/product','??????',1,NULL,NULL,1,3,'admin','ZKEASOFT','2016-03-10 23:33:03.653','admin','ZKEASOFT','2017-10-15 18:05:28.830');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6beb1a2a54b947179ec20dd331e375a2','#','~/index','??????',0,NULL,NULL,1,1,'admin',NULL,'2015-09-01 09:55:20.483','admin','ZKEASOFT','2017-10-15 18:05:28.820');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('7b5bb24dea6d47618ed027190b4e5d94','#','~/contact','????????????',0,NULL,NULL,1,5,'admin','ZKEASOFT','2017-03-19 21:06:21.360','admin','ZKEASOFT','2017-10-15 18:05:28.833');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d122a50356bf46c8a8c8349612145e24','#','~/questionnaire','????????????',0,NULL,NULL,1,4,'admin','ZKEASOFT','2017-10-15 18:05:25.947','admin','ZKEASOFT','2017-10-15 18:05:28.837');
INSERT INTO [Navigation] ([ID],[ParentId],[Url],[Title],[IsMobile],[Html],[Description],[Status],[DisplayOrder],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e4658e8af8434a05b773b666c6c67cd5','#','~/article','??????',1,NULL,NULL,1,2,'admin','ZKEASOFT','2016-03-10 23:32:53.000','admin','ZKEASOFT','2017-10-15 18:05:28.827');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- City --','zh-CN','-- ????????? --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- District --','zh-CN','-- ????????? --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- Province --','zh-CN','-- ????????? --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('--- Select ---','zh-CN','---?????????---',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('-- Select --','zh-CN','-- ????????? --',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('_Site Search','zh-CN','_????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is already exists','zh-CN','{0} ?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is invalid','en-GB','{0} is invalid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is invalid','en-US','{0} is invalid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is invalid','zh-CN','{0}?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is not correct.','zh-CN','{0}??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is required','en-GB','{0} is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is required','en-US','{0} is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} is required','zh-CN','?????????{0}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should be between {1} to {2}','zh-CN','{0}??????????????????{1}?????????{2}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should be greater than {1}','zh-CN','{0}??????????????????{1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should be less than {1}','zh-CN','{0}???????????????????????????{1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} length should in range({0}-{1})','zh-CN','{0}??????????????????{1}?????????{2}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('{0} should in range({1}-{2})','zh-CN','{0}??????????????????{1}-{2}??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('3 Columns','zh-CN','3 ???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('4 Columns','zh-CN','4 ???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Absolute','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account Center','en-GB','Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account Center','en-US','Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Account Center','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Action','en-GB','Action',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Action','en-US','Action',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Action','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Active','en-GB','Active',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Active','en-US','Active',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Active','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add','en-GB','Add',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add','en-US','Add',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Content','en-GB','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Content','en-US','Add Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Content','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Link','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Margin','en-GB','Padding',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Margin','en-US','Padding',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Margin','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Paragraph','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Picture','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Text','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Title','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add To Cart','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Add Video','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Administrator','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@PassWord','en-US','Password','AdminSignViewModel','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@PassWord','zh-CN','??????','AdminSignViewModel','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@UserID','en-US','User','AdminSignViewModel','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AdminSignViewModel@UserID','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('After change the password, please sign in use the new password','zh-CN','?????????????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('After index the content then you can search by keywords','zh-CN','????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alert Box','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Aligh Right','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Bottom','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left','en-GB','Align Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left','en-US','Align Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left Bottom','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Left Top','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right','en-GB','Align Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right','en-US','Align Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right Bottom','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Right Top','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Align Top','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AliPay','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alipay Setting','en-GB','Alipay',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alipay Setting','en-US','Alipay',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Alipay Setting','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','en-GB','Alipay Public Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','en-US','Alipay Public Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AlipayPublicKey','zh-CN','????????????','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','en-GB','App','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','en-US','App','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@AppId','zh-CN','AppId',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Environment','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','en-GB','Gatewayurl','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','en-US','Gatewayurl','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Gatewayurl','zh-CN','???????????????','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsEnable','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','en-GB','Is Key From File','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','en-US','Is Key From File','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@IsKeyFromFile','zh-CN','IsKeyFromFile','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','en-GB','Private Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','en-US','Private Key','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PrivateKey','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@PublicKey','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','en-GB','Sign Type','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','en-US','Sign Type','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@SignType','zh-CN','SignType','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','en-GB','Uid','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','en-US','Uid','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AlipayOptions@Uid','zh-CN','??????UID','AlipayOptions','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('All','en-GB','All',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('All','en-US','All',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('All','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Always horizontally','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Amount','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('And','en-GB','And',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('And','en-US','And',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('And','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Append ''.html''','en-GB','Append ''.html''',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Append ''.html''','en-US','Append ''.html''',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Append ''.html''','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@ActionType','zh-CN','ActionType','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateBy','zh-CN','CreateBy','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreatebyName','en-US','Create By','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreatebyName','zh-CN','?????????','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateDate','en-US','Create Date','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@CreateDate','zh-CN','????????????','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Description','zh-CN','??????','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateBy','zh-CN','LastUpdateBy','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateByName','en-US','Last Update By','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateByName','zh-CN','?????????','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateDate','en-US','Last Update Date','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@LastUpdateDate','zh-CN','????????????','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@SettingKey','en-US','Setting Key','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@SettingKey','zh-CN','???','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Status','en-US','Status','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Status','zh-CN','??????','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Title','zh-CN','??????','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Value','en-US','Value','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ApplicationSetting@Value','zh-CN','???','ApplicationSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Category','en-GB','Article Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Category','en-US','Article Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Category','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Detail','en-GB','Article Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Detail','en-US','Article Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Detail','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Gallery','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article keywords','en-GB','Article keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article keywords','en-US','Article keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article keywords','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article List','en-GB','Article List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article List','en-US','Article List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article List','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Manager','en-GB','Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Manager','en-US','Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Manager','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article News','en-GB','News',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article News','en-US','News',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article News','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Summary','en-GB','Article Summary',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Summary','en-US','Article Summary',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Article Summary','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ActionType','zh-CN','ActionType','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@AssemblyName','zh-CN','AssemblyName','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CreateBy','zh-CN','CreateBy','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CreatebyName','zh-CN','?????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CreateDate','zh-CN','????????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CustomClass','zh-CN','CustomClass','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CustomerClass','zh-CN','CustomerClass','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@CustomStyle','zh-CN','CustomStyle','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Description','zh-CN','??????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ExtendData','zh-CN','ExtendData','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ExtendFields','zh-CN','????????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@FormView','zh-CN','FormView','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ID','zh-CN','ID','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@IsSystem','zh-CN','IsSystem','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@IsTemplate','zh-CN','???????????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LastUpdateByName','zh-CN','?????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LastUpdateDate','zh-CN','????????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@LayoutID','zh-CN','LayoutID','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@PageID','zh-CN','PageID','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@PartialView','zh-CN','????????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Position','zh-CN','??????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Status','zh-CN','??????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@StyleClass','zh-CN','???????????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Thumbnail','zh-CN','?????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@Title','zh-CN','??????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@WidgetName','zh-CN','????????????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleDetailWidget@ZoneID','zh-CN','??????','ArticleDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ActionType','zh-CN','ActionType','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleContent','zh-CN','????????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleTypeID','en-GB','Article Type','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleTypeID','en-US','Article Type','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ArticleTypeID','zh-CN','????????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Counter','zh-CN','????????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateBy','zh-CN','CreateBy','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','en-GB','Create By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','en-US','Create By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreatebyName','zh-CN','?????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','en-GB','Create Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','en-US','Create Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@CreateDate','zh-CN','????????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Description','zh-CN','??????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ExtendFields','zh-CN','????????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ID','en-US','ID','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ID','zh-CN','ID','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ImageThumbUrl','zh-CN','?????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ImageUrl','zh-CN','??????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','en-GB','Is Publish','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','en-US','Is Publish','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@IsPublish','zh-CN','??????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateBy','zh-CN','LastUpdateBy','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','en-GB','Last Update By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','en-US','Last Update By','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateByName','zh-CN','?????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateDate','en-GB','Last Update Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateDate','en-US','Last Update Date','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@LastUpdateDate','zh-CN','????????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@MetaDescription','zh-CN','SEO??????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@MetaKeyWords','zh-CN','SEO?????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@PublishDate','zh-CN','????????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@ReturnUrl','zh-CN','ReturnUrl','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Status','zh-CN','??????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Summary','zh-CN','??????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Title','en-GB','Title','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Title','en-US','Title','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Title','zh-CN','??????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleEntity@Url','zh-CN','?????????','ArticleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleGalleryWidget@ArticleGalleryId','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleGalleryWidget@DetailPageUrl','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ActionType','zh-CN','ActionType','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ArticleCategoryID','zh-CN','ArticleCategoryID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ArticleTypeID','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@AssemblyName','zh-CN','AssemblyName','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CreateBy','zh-CN','CreateBy','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CreatebyName','zh-CN','?????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CreateDate','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CustomClass','zh-CN','CustomClass','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@CustomStyle','zh-CN','CustomStyle','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Description','zh-CN','??????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@DetailPageUrl','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ExtendData','zh-CN','ExtendData','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ExtendFields','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@FormView','zh-CN','FormView','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ID','zh-CN','ID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@IsPageable','zh-CN','???????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@IsSystem','zh-CN','IsSystem','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@IsTemplate','zh-CN','???????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LastUpdateByName','zh-CN','?????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LastUpdateDate','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@LayoutID','zh-CN','LayoutID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@PageID','zh-CN','PageID','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@PageSize','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@PartialView','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Position','zh-CN','??????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Status','zh-CN','??????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@StyleClass','zh-CN','???????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Thumbnail','zh-CN','?????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@Title','zh-CN','??????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@WidgetName','zh-CN','????????????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleListWidget@ZoneID','zh-CN','??????','ArticleListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Articles','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ArticleId','zh-CN','??????ID','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ArticleName','zh-CN','???????????????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@AssemblyName','zh-CN','Assembly Name','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@IsSystem','zh-CN','Is System','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@IsTemplate','zh-CN','???????????????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@PartialView','zh-CN','????????????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Position','zh-CN','??????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ServiceTypeName','zh-CN','Service Type Name','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@StyleClass','zh-CN','???????????????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Thumbnail','zh-CN','?????????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@Title','zh-CN','??????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ViewModelTypeName','zh-CN','View Model Type Name','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@WidgetName','zh-CN','????????????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSpecialDetailWidget@ZoneID','zh-CN','??????','ArticleSpecialDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ActionType','zh-CN','ActionType','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@AssemblyName','zh-CN','AssemblyName','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CreateBy','zh-CN','CreateBy','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CreatebyName','zh-CN','?????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CreateDate','zh-CN','????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CustomClass','zh-CN','CustomClass','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@CustomStyle','zh-CN','CustomStyle','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Description','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@DetailLink','zh-CN','????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ExtendData','zh-CN','ExtendData','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ExtendFields','zh-CN','????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@FormView','zh-CN','FormView','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ID','zh-CN','ID','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@IsSystem','zh-CN','IsSystem','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@IsTemplate','zh-CN','???????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LastUpdateByName','zh-CN','?????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LastUpdateDate','zh-CN','????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@LayoutID','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@PageID','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@PartDriver','zh-CN','PartDriver','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@PartialView','zh-CN','????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Position','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Status','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Style','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@StyleClass','zh-CN','???????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@SubTitle','zh-CN','?????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Summary','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Thumbnail','zh-CN','?????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@Title','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@WidgetName','zh-CN','????????????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleSummaryWidget@ZoneID','zh-CN','??????','ArticleSummaryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ActionType','zh-CN','ActionType','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ArticleTypeID','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@AssemblyName','zh-CN','AssemblyName','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CreateBy','zh-CN','CreateBy','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CreatebyName','zh-CN','?????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CreateDate','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CustomClass','zh-CN','CustomClass','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@CustomStyle','zh-CN','CustomStyle','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Description','zh-CN','??????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@DetailPageUrl','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ExtendData','zh-CN','ExtendData','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ExtendFields','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@FormView','zh-CN','FormView','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ID','zh-CN','ID','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@IsSystem','zh-CN','IsSystem','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@IsTemplate','zh-CN','???????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LastUpdateByName','zh-CN','?????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LastUpdateDate','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@LayoutID','zh-CN','LayoutID','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@MoreLink','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@PageID','zh-CN','PageID','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@PartDriver','zh-CN','PartDriver','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@PartialView','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Position','zh-CN','??????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Status','zh-CN','??????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@StyleClass','zh-CN','???????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@SubTitle','zh-CN','?????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Thumbnail','zh-CN','?????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Title','zh-CN','??????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@Tops','zh-CN','?????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@WidgetName','zh-CN','????????????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTopWidget@ZoneID','zh-CN','??????','ArticleTopWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@ActionType','zh-CN','ActionType','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@CreateBy','zh-CN','CreateBy','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@CreatebyName','zh-CN','?????????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@CreateDate','zh-CN','????????????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Description','zh-CN','??????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@ID','zh-CN','ID','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@LastUpdateBy','zh-CN','LastUpdateBy','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@LastUpdateByName','zh-CN','?????????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@LastUpdateDate','zh-CN','????????????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@ParentID','zh-CN','ParentID','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','en-GB','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','en-US','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','zh-CN','SEO??????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEODescription','zh-TW','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','en-GB','SEO Key Word',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','en-US','SEO Key Word',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','zh-CN','SEO?????????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOKeyWord','zh-TW','SEO?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','en-GB','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','en-US','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','zh-CN','SEO??????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@SEOTitle','zh-TW','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Status','zh-CN','??????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Title','zh-CN','??????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleType@Url','zh-CN','?????????','ArticleType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ActionType','zh-CN','ActionType','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ArticleTypeID','zh-CN','????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@AssemblyName','zh-CN','AssemblyName','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CreateBy','zh-CN','CreateBy','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CreatebyName','zh-CN','?????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CreateDate','zh-CN','????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CustomClass','zh-CN','CustomClass','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@CustomStyle','zh-CN','CustomStyle','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Description','zh-CN','??????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ExtendFields','zh-CN','????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@FormView','zh-CN','FormView','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ID','zh-CN','ID','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@IsSystem','zh-CN','IsSystem','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@IsTemplate','zh-CN','???????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LastUpdateBy','zh-CN','LastUpdateBy','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LastUpdateByName','zh-CN','?????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LastUpdateDate','zh-CN','????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@LayoutID','zh-CN','LayoutID','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@PageID','zh-CN','PageID','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@PartialView','zh-CN','????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Position','zh-CN','??????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ServiceTypeName','zh-CN','ServiceTypeName','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Status','zh-CN','??????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@StyleClass','zh-CN','???????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@TargetPage','zh-CN','????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Thumbnail','zh-CN','?????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@Title','zh-CN','??????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@WidgetName','zh-CN','????????????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ArticleTypeWidget@ZoneID','zh-CN','??????','ArticleTypeWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Assembly','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Attachment','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Attention','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','en-GB','Client','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','en-US','Client','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientId','zh-CN','APP ID','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','en-GB','Client Secret','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','en-US','Client Secret','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('AuthOption@ClientSecret','zh-CN','APP Key','AuthOption','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Auto','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Avatar','en-GB','Avatar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Avatar','en-US','Avatar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Avatar','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Background','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Background Image','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Baidu Map','en-GB','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Baidu Map','en-US','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Baidu Map','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ApplicationKey','zh-CN','????????????(AK)','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@AssemblyName','zh-CN','Assembly Name','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Height','zh-CN','????????????(px)','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Instruction','zh-CN','????????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@IsSystem','zh-CN','Is System','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@IsTemplate','zh-CN','???????????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@LocationPoint','zh-CN','????????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@PartialView','zh-CN','????????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Position','zh-CN','??????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ServiceTypeName','zh-CN','Service Type Name','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@StyleClass','zh-CN','???????????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@TagSummary','zh-CN','????????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@TagTitle','zh-CN','??????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Thumbnail','zh-CN','?????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@Title','zh-CN','??????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ViewModelTypeName','zh-CN','View Model Type Name','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@WidgetName','zh-CN','????????????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BaiduMapWidget@ZoneID','zh-CN','??????','BaiduMapWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Banner','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basis','en-GB','Basis',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basis','en-US','Basis',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basis','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Basket','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Biography','en-GB','Biography',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Biography','en-US','Biography',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Biography','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@AssemblyName','zh-CN','Assembly Name','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Content','zh-CN','????????????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@IsSystem','zh-CN','Is System','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@IsTemplate','zh-CN','???????????????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Name','zh-CN','??????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Others','zh-CN','??????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@PartialView','zh-CN','????????????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Photo','zh-CN','??????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Position','zh-CN','??????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@ServiceTypeName','zh-CN','Service Type Name','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@StyleClass','zh-CN','???????????????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Thumbnail','zh-CN','?????????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@Title','zh-CN','??????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@ViewModelTypeName','zh-CN','View Model Type Name','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@WidgetName','zh-CN','????????????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BiographyWidget@ZoneID','zh-CN','??????','BiographyWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Blink','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Bold','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Bolder','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border Radius','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border Width','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border(Empty Zone)','en-GB','Border(Empty Zone)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border(Empty Zone)','en-US','Border(Empty Zone)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Border(Empty Zone)','zh-CN','??????(???????????????)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Box Blur','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Box Horizontal','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Box Vertical','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Breadcrumbs','en-GB','Breadcrumbs',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Breadcrumbs','en-US','Breadcrumbs',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Breadcrumbs','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ActionType','zh-CN','ActionType','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@AssemblyName','zh-CN','AssemblyName','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CreateBy','zh-CN','CreateBy','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CreatebyName','zh-CN','?????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CreateDate','zh-CN','????????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CustomClass','zh-CN','CustomClass','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@CustomStyle','zh-CN','CustomStyle','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Description','zh-CN','??????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ExtendData','zh-CN','ExtendData','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ExtendFields','zh-CN','????????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@FormView','zh-CN','FormView','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ID','zh-CN','ID','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@IsLinkAble','zh-CN','IsLinkAble','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@IsSystem','zh-CN','IsSystem','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@IsTemplate','zh-CN','???????????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LastUpdateBy','zh-CN','LastUpdateBy','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LastUpdateByName','zh-CN','?????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LastUpdateDate','zh-CN','????????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@LayoutID','zh-CN','??????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@PageID','zh-CN','??????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@PartialView','zh-CN','????????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Position','zh-CN','??????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ServiceTypeName','zh-CN','ServiceTypeName','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Status','zh-CN','??????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@StyleClass','zh-CN','???????????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Thumbnail','zh-CN','?????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@Title','zh-CN','??????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@WidgetName','zh-CN','????????????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('BreadcrumbWidget@ZoneID','zh-CN','??????','BreadcrumbWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Button','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Can not delete yourself.','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cancel','en-GB','Cancel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cancel','en-US','Cancel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cancel','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Capitalize','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Captcha','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Carousel','en-GB','Carousel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Carousel','en-US','Carousel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Carousel','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@ActionType','zh-CN','ActionType','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','en-GB','Carousel Items','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','en-US','Carousel Items','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CarouselItems','zh-CN','?????????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateBy','zh-CN','CreateBy','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','en-GB','Create By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','en-US','Create By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreatebyName','zh-CN','?????????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateDate','en-GB','Create Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateDate','en-US','Create Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@CreateDate','zh-CN','????????????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Description','en-GB','Description','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Description','en-US','Description','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Description','zh-CN','??????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Height','zh-CN','??????(px)','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@ID','zh-CN','ID','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','en-GB','Last Update By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','en-US','Last Update By','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateByName','zh-CN','?????????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateDate','en-GB','Last Update Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateDate','en-US','Last Update Date','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@LastUpdateDate','zh-CN','????????????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Status','en-GB','Status','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Status','en-US','Status','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Status','zh-CN','??????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Title','en-GB','Title','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Title','en-US','Title','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselEntity@Title','zh-CN','??????','CarouselEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ActionType','zh-CN','ActionType','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselID','en-GB','Carousel','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselID','en-US','Carousel','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselID','zh-CN','?????????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CarouselWidgetID','zh-CN','CarouselWidgetID','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CreateBy','zh-CN','CreateBy','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CreatebyName','zh-CN','?????????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@CreateDate','zh-CN','????????????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Description','zh-CN','??????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ID','zh-CN','ID','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ImageUrl','en-GB','Image Url','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ImageUrl','en-US','Image Url','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@ImageUrl','zh-CN','??????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@LastUpdateBy','zh-CN','LastUpdateBy','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@LastUpdateByName','zh-CN','?????????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@LastUpdateDate','zh-CN','????????????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Status','en-GB','Status','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Status','en-US','Status','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Status','zh-CN','??????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@TargetLink','en-GB','Target Link','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@TargetLink','en-US','Target Link','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@TargetLink','zh-CN','??????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Title','en-GB','Title','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Title','en-US','Title','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselItemEntity@Title','zh-CN','??????','CarouselItemEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ActionType','zh-CN','ActionType','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@AssemblyName','zh-CN','AssemblyName','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CarouselID','zh-CN','???????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CarouselItems','zh-CN','?????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CreateBy','zh-CN','CreateBy','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CreatebyName','zh-CN','?????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CreateDate','zh-CN','????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CustomClass','zh-CN','CustomClass','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@CustomStyle','zh-CN','CustomStyle','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Description','zh-CN','??????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ExtendFields','zh-CN','????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@FormView','zh-CN','FormView','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ID','zh-CN','ID','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@IsSystem','zh-CN','IsSystem','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@IsTemplate','zh-CN','???????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LastUpdateBy','zh-CN','LastUpdateBy','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LastUpdateByName','zh-CN','?????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LastUpdateDate','zh-CN','????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@LayoutID','zh-CN','LayoutID','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@PageID','zh-CN','PageID','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@PartialView','zh-CN','????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Position','zh-CN','??????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ServiceTypeName','zh-CN','ServiceTypeName','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Status','zh-CN','??????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@StyleClass','zh-CN','???????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Thumbnail','zh-CN','?????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@Title','zh-CN','??????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@WidgetName','zh-CN','????????????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CarouselWidget@ZoneID','zh-CN','??????','CarouselWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Case Sensitivity','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CaseItem@BackgroundImage','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cell phone','en-GB','Cell phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cell phone','en-US','Cell phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Cell phone','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Center','en-GB','Center',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Center','en-US','Center',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Center','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Change Password','en-GB','Change Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Change Password','en-US','Change Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Change Password','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Chat Script','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check Out','zh-CN','??? ???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check the email','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Check your pages for SEO','zh-CN','????????????????????????????????????????????????SEO???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Checkbox','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Class prefix','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to','en-GB','Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to','en-US','Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to the page.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click on the "Thumbnails" to preview. Click on "Exit Theme Preview" in the preview page to return to','zh-CN','???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click the radio button to switch the theme','en-GB','Click the radio button to switch the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click the radio button to switch the theme','en-US','Click the radio button to switch the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click the radio button to switch the theme','zh-CN','?????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Click to select','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Close','en-GB','Close',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Close','en-US','Close',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Close','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CMS Plugins','en-GB','Plugins',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CMS Plugins','en-US','Plugins',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CMS Plugins','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Code','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','en-GB','Collapse',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','en-US','Collapse',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapse','zh-TW','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Collapsed to start, horizontal above breakpoints','zh-CN','???????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Color','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column Width','en-GB','Column',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column Width','en-US','Column',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Column Width','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Columns','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comment Box','en-GB','Comment Box',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comment Box','en-US','Comment Box',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comment Box','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@ActionType','zh-CN','ActionType','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Agrees','zh-CN','?????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','en-GB','Comment Content','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','en-US','Comment Content','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CommentContent','zh-CN','????????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateBy','zh-CN','CreateBy','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','en-GB','Create By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','en-US','Create By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreatebyName','zh-CN','?????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','en-GB','Create Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','en-US','Create Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@CreateDate','zh-CN','????????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Description','zh-CN','??????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Disagrees','zh-CN','?????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@ID','zh-CN','ID','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateBy','zh-CN','LastUpdateBy','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','en-GB','Last Update By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','en-US','Last Update By','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateByName','zh-CN','?????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateDate','en-GB','Last Update Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateDate','en-US','Last Update Date','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@LastUpdateDate','zh-CN','????????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@PagePath','zh-CN','????????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Picture','zh-CN','Picture','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Status','en-GB','Status','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Status','en-US','Status','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Status','zh-CN','??????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Title','en-GB','Title','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Title','en-US','Title','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@Title','zh-CN','??????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@UserId','zh-CN','?????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Comments@UserName','zh-CN','?????????','Comments','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ActionType','zh-CN','ActionType','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@AssemblyName','zh-CN','AssemblyName','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CreateBy','zh-CN','CreateBy','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CreatebyName','zh-CN','?????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CreateDate','zh-CN','????????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CustomClass','zh-CN','CustomClass','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@CustomStyle','zh-CN','CustomStyle','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Description','zh-CN','??????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ExtendData','zh-CN','ExtendData','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@FormView','zh-CN','FormView','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ID','zh-CN','ID','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@IsSystem','zh-CN','IsSystem','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@IsTemplate','zh-CN','???????????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LastUpdateBy','zh-CN','LastUpdateBy','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LastUpdateByName','zh-CN','?????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LastUpdateDate','zh-CN','????????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@LayoutID','zh-CN','LayoutID','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@PageID','zh-CN','PageID','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@PartialView','zh-CN','????????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Position','zh-CN','??????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ServiceTypeName','zh-CN','ServiceTypeName','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Status','zh-CN','??????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@StyleClass','zh-CN','???????????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Thumbnail','zh-CN','?????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@Title','zh-CN','??????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@WidgetName','zh-CN','????????????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CommentsWidget@ZoneID','zh-CN','??????','CommentsWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('commit','en-GB','Comment',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('commit','en-US','Comment',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('commit','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Company News','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Complete','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Completed updating the index','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Confirm Password','en-GB','Confirm Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Confirm Password','en-US','Confirm Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Confirm Password','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contact','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contact Info','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contact/Consignee','zh-CN','?????????/?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('contain','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Container','en-GB','Container',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Container','en-US','Container',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Container','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contains','en-GB','Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contains','en-US','Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Contains','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content','en-GB','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content','en-US','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Category','en-GB','Content Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Category','en-US','Content Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Category','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Content Group','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@FieldType','zh-CN','????????????','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Name','zh-CN','?????????','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Order','zh-CN','??????','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Status','en-GB','Status','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Status','en-US','Status','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentField@Title','zh-CN','????????????','ContentField','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','en-GB','Create By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','en-US','Create By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreatebyName','zh-CN','?????????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','en-GB','Create Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','en-US','Create Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@CreateDate','zh-CN','????????????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','en-GB','Description','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','en-US','Description','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Description','zh-CN','??????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@ID','zh-CN','ID','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','en-GB','Last Update By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','en-US','Last Update By','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateByName','zh-CN','?????????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','en-GB','Last Update Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','en-US','Last Update Date','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@LastUpdateDate','zh-CN','????????????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','en-GB','Status','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','en-US','Status','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Status','zh-CN','??????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Template','zh-CN','????????????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','en-GB','Title','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','en-US','Title','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentTemplate@Title','zh-CN','??????','ContentTemplate','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','en-GB','Create By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','en-US','Create By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreatebyName','zh-CN','?????????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','en-GB','Create Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','en-US','Create Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@CreateDate','zh-CN','????????????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','en-GB','Description','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','en-US','Description','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Description','zh-CN','??????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Fields','zh-CN','??????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@ID','zh-CN','ID','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','en-GB','Last Update By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','en-US','Last Update By','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateByName','zh-CN','?????????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','en-GB','Last Update Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','en-US','Last Update Date','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@LastUpdateDate','zh-CN','????????????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','en-GB','Status','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','en-US','Status','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Status','zh-CN','??????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','en-GB','Title','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','en-US','Title','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentType@Title','zh-CN','??????','ContentType','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@ContentTypeID','zh-CN','Content Type','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreatebyName','en-US','Create By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreatebyName','zh-CN','?????????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreateDate','en-US','Create Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@CreateDate','zh-CN','????????????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Description','zh-CN','??????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@ID','zh-CN','ID','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateByName','en-US','Update By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateByName','zh-CN','?????????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateDate','en-US','Last Update Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@LastUpdateDate','zh-CN','????????????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEODescription','en-US','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEODescription','zh-CN','SEO??????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOKeyWord','en-US','SEO Keyword',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOKeyWord','zh-CN','SEO?????????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOTitle','en-US','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@SEOTitle','zh-CN','SEO??????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Status','en-US','Status','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Status','zh-CN','??????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Title','en-US','Title','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Title','zh-CN','??????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ContentValue@Url','zh-CN','?????????','ContentValue','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Context Menu','en-GB','Menu',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Context Menu','en-US','Menu',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Context Menu','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Continue','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy','en-GB','Copy',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy','en-US','Copy',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Copy from page','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('cover','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Create page from template','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CreatebyName','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CreateDate','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Crosshair','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CreatebyName','zh-CN','?????????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CreateDate','zh-CN','????????????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CultureCode','zh-CN','????????????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@CultureID','zh-CN','CultureID','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Description','zh-CN','??????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@DisplayName','zh-CN','????????????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Domain','zh-CN','??????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@EnglishName','zh-CN','?????????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Flag','zh-CN','??????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@LastUpdateByName','zh-CN','?????????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@LastUpdateDate','zh-CN','????????????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@LCID','zh-CN','LCID','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Status','zh-CN','??????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@Title','zh-CN','??????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Culture@UrlCode','zh-CN','Url??????','Culture','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@CultureMode','en-GB','Culture Mode','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@CultureMode','en-US','Culture Mode','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@CultureMode','zh-CN','???????????????','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@DefaultCulture','en-GB','Default Culture','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@DefaultCulture','en-US','Default Culture','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@DefaultCulture','zh-CN','????????????','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsEnable','en-GB','Is Enable','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsEnable','en-US','Is Enable','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsEnable','zh-CN','???????????????','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsShowDefault','en-GB','Is Show Default','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsShowDefault','en-US','Is Show Default','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CultureSetting@IsShowDefault','zh-CN','?????????????????????????????????','CultureSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Currency','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('CurrencyOption@CurrencyID','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Current','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Current password error.','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Fields','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Rule','en-GB','Rule',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Rule','en-US','Rule',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Rule','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Custom Validation','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Customer','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Danger','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dashed','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Data Source','en-GB','Data Source',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Data Source','en-US','Data Source',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Data Source','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Database Cache','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@CreateBy','zh-CN','CreateBy','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@CreatebyName','zh-CN','?????????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@CreateDate','zh-CN','????????????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Description','zh-CN','??????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@DicName','zh-CN','DicName','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@DicValue','zh-CN','DicValue','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@ID','zh-CN','ID','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@ImageThumbUrl','zh-CN','?????????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@ImageUrl','zh-CN','??????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@IsSystem','zh-CN','IsSystem','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@LastUpdateBy','zh-CN','LastUpdateBy','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@LastUpdateByName','zh-CN','?????????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@LastUpdateDate','zh-CN','????????????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Order','zh-CN','??????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Pid','zh-CN','Pid','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Status','zh-CN','??????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('DataDictionaryEntity@Title','zh-CN','??????','DataDictionaryEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Date','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ddashboard','en-GB','Dashboard',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ddashboard','en-US','Dashboard',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ddashboard','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Decoration','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Default','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete','en-GB','Delete',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete','en-US','Delete',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete Current Group','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete?','en-GB','Delete?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete?','en-US','Delete?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Delete?','zh-CN','?????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Demo Video','en-GB','Videos',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Demo Video','en-US','Videos',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Demo Video','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Description','en-GB','Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Description','en-US','Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Description','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Design','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Design','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Design','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Desktop (???1200px)','zh-CN','?????????????????? (???1200px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Desktop (???992px)','zh-CN','??????????????? (???992px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Contents','en-GB','Contents',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Contents','en-US','Contents',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Contents','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display in page','en-GB','Display in page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display in page','en-US','Display in page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display in page','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Template','en-GB','Display Template',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Template','en-US','Display Template',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Display Template','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to delete?','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to publish?','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to refund?','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Do you want to revert to this version?','zh-CN','?????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Document','en-GB','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Document','en-US','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Document','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Donate','en-GB','Donate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Donate','en-US','Donate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Donate','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dotted','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Double','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Sections','en-GB','Sections',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Sections','en-US','Sections',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Sections','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Theme','en-GB','Download',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Theme','en-US','Download',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Theme','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Themes','en-GB','Themes',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Themes','en-US','Themes',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Download Themes','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag','en-GB','Drag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag','en-US','Drag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag to container','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag to layout','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Drag to row','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dropdown','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dynamic','en-GB','Dynamic',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dynamic','en-US','Dynamic',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Dynamic','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('E-commerce','en-GB','E-commerce',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('E-commerce','en-US','E-commerce',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('E-commerce','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Chat Script','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Content','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Content','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Content','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Layout','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Layout','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Layout','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Page','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Page','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Page','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Pixel Script','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit settings','en-GB','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit settings','en-US','Edit',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit settings','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit Template','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit: Design page','en-GB','Edit: Design page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit: Design page','en-US','Edit: Design page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Edit: Design page','zh-CN','???????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email','en-GB','Email',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email','en-US','Email',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Email is incorrect','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ends With','en-GB','Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ends With','en-US','Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ends With','zh-CN','???...??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter a URL address to check, such as: /about/zkeacms','zh-CN','????????????Url???????????????????????????/about/zkeacms',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter keyworkds to search...','zh-CN','???????????????????????????...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter the keywords to search','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your Email','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your new password','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your password','en-GB','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your password','en-US','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter your password','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enter zone name','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','en-GB','Enterprise',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','en-US','Enterprise',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Enterprise','zh-TW','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Environment','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Equals','en-GB','Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Equals','en-US','Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Equals','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('e-resize','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Error Message','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Error!','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Everything goes well.','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Example','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Explanation','en-GB','Explanation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Explanation','en-US','Explanation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Explanation','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Export All Data','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Export Excel','zh-CN','??????Excel',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Export Form Data','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@ActionType','zh-CN','ActionType','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@CreateBy','zh-CN','CreateBy','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@CreatebyName','zh-CN','?????????','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@CreateDate','zh-CN','????????????','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Description','zh-CN','??????','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@ID','zh-CN','ID','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@LastUpdateBy','zh-CN','LastUpdateBy','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@LastUpdateByName','zh-CN','?????????','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@LastUpdateDate','zh-CN','????????????','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@OwnerID','zh-CN','OwnerID','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@OwnerModule','zh-CN','OwnerModule','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Status','zh-CN','??????','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Title','zh-CN','??????','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ExtendFieldEntity@Value','zh-CN','???','ExtendFieldEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Female','en-GB','Female',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Female','en-US','Female',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Female','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Name','en-GB','Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Name','en-US','Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Name','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Field Setting','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fields','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('File','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('File Cache','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fixed','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fixed Width','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Float','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Float Left','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Float Right','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content','en-GB','Fluid Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content','en-US','Fluid Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content List','en-GB','Fluid Content List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content List','en-US','Fluid Content List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fluid Content List','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@AssemblyName','zh-CN','Assembly Name','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ContentTemplateID','zh-CN','????????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ContentTypeID','zh-CN','?????????????????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@DetailPageUrl','zh-CN','????????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@IsPageable','zh-CN','???????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@IsSystem','zh-CN','Is System','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@IsTemplate','zh-CN','???????????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@PageSize','zh-CN','????????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@Position','zh-CN','??????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ServiceTypeName','zh-CN','Service Type Name','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@StyleClass','zh-CN','???????????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@Thumbnail','zh-CN','?????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@Title','zh-CN','??????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ViewModelTypeName','zh-CN','View Model Type Name','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@WidgetName','zh-CN','????????????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentListWidget@ZoneID','zh-CN','??????','FluidContentListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@AssemblyName','zh-CN','Assembly Name','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ContentTemplateID','zh-CN','????????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ContentValueID','zh-CN','???????????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@IsSupportQueryID','zh-CN','????????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@IsSystem','zh-CN','Is System','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@IsTemplate','zh-CN','???????????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@PartialView','zh-CN','????????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@Position','zh-CN','??????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ServiceTypeName','zh-CN','Service Type Name','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@StyleClass','zh-CN','???????????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@Thumbnail','zh-CN','?????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@Title','zh-CN','??????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ViewModelTypeName','zh-CN','View Model Type Name','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@WidgetName','zh-CN','????????????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FluidContentWidget@ZoneID','zh-CN','??????','FluidContentWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Fobidden','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font Size','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font Variant','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Font Weight','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgot your password?','en-GB','Forgot your password?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgot your password?','en-US','Forgot your password?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgot your password?','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Forgotten password','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form','en-GB','Form',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form','en-US','Form',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Control Size','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Data','en-GB','Form Data',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Data','en-US','Form Data',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Data','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Generator','en-GB','Form Generator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Generator','en-US','Form Generator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form Generator','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form have submited','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@ActionType','zh-CN','ActionType','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateBy','zh-CN','CreateBy','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','en-GB','Create By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','en-US','Create By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreatebyName','zh-CN','?????????','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','en-GB','Create Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','en-US','Create Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@CreateDate','zh-CN','????????????','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Description','zh-CN','??????','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@FieldsData','zh-CN','FieldsData','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@FormFields','zh-CN','FormFields','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@ID','zh-CN','ID','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateBy','zh-CN','LastUpdateBy','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','en-GB','Last Update By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','en-US','Last Update By','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateByName','zh-CN','?????????','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateDate','en-GB','Last Update Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateDate','en-US','Last Update Date','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@LastUpdateDate','zh-CN','????????????','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Status','zh-CN','??????','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Title','en-GB','Title','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Title','en-US','Title','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Form@Title','zh-CN','??????','Form','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@ActionType','zh-CN','ActionType','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateBy','zh-CN','CreateBy','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','en-GB','Create By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','en-US','Create By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreatebyName','zh-CN','?????????','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateDate','en-GB','Create Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateDate','en-US','Create Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@CreateDate','zh-CN','????????????','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Datas','zh-CN','Datas','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Description','zh-CN','??????','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Form','zh-CN','Form','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@FormId','en-GB','Form','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@FormId','en-US','Form','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@FormId','zh-CN','??????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@ID','zh-CN','ID','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateBy','zh-CN','LastUpdateBy','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','en-GB','Last Update By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','en-US','Last Update By','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateByName','zh-CN','?????????','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateDate','en-GB','Last Update Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateDate','en-US','Last Update Date','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@LastUpdateDate','zh-CN','????????????','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Status','zh-CN','??????','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Title','en-GB','Title','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Title','en-US','Title','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormData@Title','zh-CN','??????','FormData','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ActionType','zh-CN','ActionType','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@AssemblyName','zh-CN','AssemblyName','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CreateBy','zh-CN','CreateBy','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CreatebyName','zh-CN','?????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CreateDate','zh-CN','????????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CustomClass','zh-CN','CustomClass','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@CustomStyle','zh-CN','CustomStyle','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Description','zh-CN','??????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ExtendData','zh-CN','ExtendData','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@FormID','zh-CN','??????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@FormView','zh-CN','FormView','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ID','zh-CN','ID','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@IsSystem','zh-CN','IsSystem','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@IsTemplate','zh-CN','???????????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LastUpdateBy','zh-CN','LastUpdateBy','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LastUpdateByName','zh-CN','?????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LastUpdateDate','zh-CN','????????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@LayoutID','zh-CN','LayoutID','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@PageID','zh-CN','PageID','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@PartialView','zh-CN','????????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Position','zh-CN','??????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ServiceTypeName','zh-CN','ServiceTypeName','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Status','zh-CN','??????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@StyleClass','zh-CN','???????????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Thumbnail','zh-CN','?????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@Title','zh-CN','??????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@WidgetName','zh-CN','????????????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('FormWidget@ZoneID','zh-CN','??????','FormWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Full','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Full-text Index','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Gender','en-GB','Gender',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Gender','en-US','Gender',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Gender','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Generate','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Generate Content','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Get app private key','zh-CN','??????????????????(AK)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Get location','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than','en-GB','Greater Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than','en-US','Greater Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than Or Equals','en-GB','Greater Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than Or Equals','en-US','Greater Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Greater Than Or Equals','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Grid','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Grid Display','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Grid System','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Groove','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Group','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('GroupID','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have account?','en-GB','Have account?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have account?','en-US','Have account?',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have account?','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Have your say...','zh-CN','??????????????????...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@AssemblyName','en-US','Assembly Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@AssemblyName','zh-CN','Assembly Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Content','en-US','??????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Content','zh-CN','??????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsSystem','en-US','Is System','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsSystem','zh-CN','Is System','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsTemplate','en-US','???????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@IsTemplate','zh-CN','???????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@PartialView','en-US','????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@PartialView','zh-CN','????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Position','en-US','Position','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Position','zh-CN','??????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ServiceTypeName','en-US','Service Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ServiceTypeName','zh-CN','Service Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@StyleClass','en-US','???????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@StyleClass','zh-CN','???????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Thumbnail','en-US','?????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Thumbnail','zh-CN','?????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Title','en-US','??????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@Title','zh-CN','??????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ViewModelTypeName','en-US','View Model Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ViewModelTypeName','zh-CN','View Model Type Name','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@WidgetName','en-US','????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@WidgetName','zh-CN','????????????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ZoneID','en-US','??????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HeadWidget@ZoneID','zh-CN','??????','HeadWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Height(px)','zh-CN','???(px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Help','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hidden','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('History','en-GB','History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('History','en-US','History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('History','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Description','zh-CN','??????','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Status','zh-CN','??????','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventItem@Title','zh-CN','??????','HistoryEventItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@AssemblyName','zh-CN','Assembly Name','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Events','zh-CN','????????????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@IsSystem','zh-CN','Is System','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@IsTemplate','zh-CN','???????????????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@PartialView','zh-CN','????????????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Position','zh-CN','??????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@ServiceTypeName','zh-CN','Service Type Name','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@StyleClass','zh-CN','???????????????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Thumbnail','zh-CN','?????????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@Title','zh-CN','??????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@ViewModelTypeName','zh-CN','View Model Type Name','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@WidgetName','zh-CN','????????????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HistoryEventWidget@ZoneID','zh-CN','??????','HistoryEventWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hobby','en-GB','Hobby',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hobby','en-US','Hobby',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Hobby','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Home Page','en-GB','Home',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Home Page','en-US','Home',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Home Page','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Horizontal Display','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('How many column you want?','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ActionType','zh-CN','ActionType','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@AssemblyName','zh-CN','AssemblyName','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CreateBy','zh-CN','CreateBy','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CreatebyName','zh-CN','?????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CreateDate','zh-CN','????????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CustomClass','zh-CN','CustomClass','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@CustomStyle','zh-CN','CustomStyle','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Description','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ExtendData','zh-CN','ExtendData','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ExtendFields','zh-CN','????????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@FormView','zh-CN','FormView','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@HTML','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ID','zh-CN','ID','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@IsSystem','zh-CN','IsSystem','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@IsTemplate','zh-CN','???????????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LastUpdateBy','zh-CN','LastUpdateBy','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LastUpdateByName','zh-CN','?????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LastUpdateDate','zh-CN','????????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@LayoutID','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@PageID','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@PartDriver','zh-CN','PartDriver','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@PartialView','zh-CN','????????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Position','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ServiceTypeName','zh-CN','ServiceTypeName','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Status','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@StyleClass','zh-CN','???????????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Thumbnail','zh-CN','?????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@Title','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@WidgetName','zh-CN','????????????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('HtmlWidget@ZoneID','zh-CN','??????','HtmlWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Icon','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Border','en-GB','Image Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Border','en-US','Image Border',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Border','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Radius','en-GB','Image Radius',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Radius','en-US','Image Radius',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Radius','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image should set alt title','zh-CN','????????????????????????alt',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Text','en-GB','Image Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Text','en-US','Image Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Image Text','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ActionType','zh-CN','ActionType','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@AltText','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@AssemblyName','zh-CN','AssemblyName','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CreateBy','zh-CN','CreateBy','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CreatebyName','zh-CN','?????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CreateDate','zh-CN','????????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CustomClass','zh-CN','CustomClass','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@CustomStyle','zh-CN','CustomStyle','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Description','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ExtendFields','zh-CN','????????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@FormView','zh-CN','FormView','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Height','zh-CN','??????(px)','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ID','zh-CN','ID','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ImageUrl','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ImageUrlMd','zh-CN','????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ImageUrlSm','zh-CN','????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@IsSystem','zh-CN','IsSystem','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@IsTemplate','zh-CN','???????????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LastUpdateBy','zh-CN','LastUpdateBy','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LastUpdateByName','zh-CN','?????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LastUpdateDate','zh-CN','????????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@LayoutID','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Link','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@PageID','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@PartDriver','zh-CN','PartDriver','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@PartialView','zh-CN','????????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Position','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ServiceTypeName','zh-CN','ServiceTypeName','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Status','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@StyleClass','zh-CN','???????????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Thumbnail','zh-CN','?????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Title','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@WidgetName','zh-CN','????????????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@Width','zh-CN','??????(px)','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ImageWidget@ZoneID','zh-CN','??????','ImageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Import html page to system','zh-CN','????????????????????????????????????????????????HTML?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Import Html Template','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In','en-GB','In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In','en-US','In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In','zh-CN','???...???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('In Queue...','zh-CN','?????????...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inactive','en-GB','Inactive',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inactive','en-US','Inactive',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inactive','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Incoming address is already exists.','zh-CN','?????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Incoming address is the same with target address.','zh-CN','????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Indent','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Index content may take a few minutes!','zh-CN','?????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Industry News','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Information','en-GB','Information',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Information','en-US','Information',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Information','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Input keywords to search','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Input option','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Inset','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install Theme','en-GB','Install',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install Theme','en-US','Install',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Install Theme','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Installing Theme...','zh-CN','???????????????...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Internal Error','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid date value for {0}.','zh-CN','{0}????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid Email for {0}.','zh-CN','{0}????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid Number for {0}.','zh-CN','{0}???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Invalid value for {0}.','zh-CN','{0}??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('IsEnable','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('IsTemplate','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Italic','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('JavaScript','en-GB','JavaScript',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('JavaScript','en-US','JavaScript',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('JavaScript','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('justify','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keep working changes','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','en-GB','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','en-US','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Action','zh-CN','Action','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','en-GB','Meta Description','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','en-US','Meta Description','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaDescription','zh-CN','SEO??????','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','en-GB','Meta Key Words','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','en-US','Meta Key Words','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWords','zh-CN','SEO?????????','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','en-GB','Meta Key Worlds','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','en-US','Meta Key Worlds','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@MetaKeyWorlds','zh-CN','SEO?????????','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEODescription','en-US','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEODescription','zh-CN','SEO??????','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEODescription','zh-TW','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOKeyWord','en-US','SEO Keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOKeyWord','zh-CN','SEO?????????','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOKeyWord','zh-TW','SEO?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOTitle','en-US','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOTitle','zh-CN','SEO??????','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@SEOTitle','zh-TW','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','en-GB','Title','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','en-US','Title','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Title','zh-CN','??????','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','en-GB','Url','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','en-US','Url','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Keywords@Url','zh-CN','Url','Keywords','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@CultureName','en-GB','Culture Name','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@CultureName','en-US','Culture Name','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@CultureName','zh-CN','????????????','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanKey','en-GB','Lan Key','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanKey','en-US','Lan Key','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanKey','zh-CN','?????????','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanType','zh-CN','??????','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanValue','en-GB','Lan Value','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanValue','en-US','Lan Value','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@LanValue','zh-CN','?????????','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LanguageEntity@Module','zh-CN','??????','LanguageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Large','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Last-Modified','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LastUpdateByName','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LastUpdateDate','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Code','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Content','en-GB','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Content','en-US','Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Content','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Design','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Design','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout Design','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout List','en-GB','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout List','en-US','Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout List','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout: Edit page layout','en-GB','Layout: Edit page layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout: Edit page layout','en-US','Layout: Edit page layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Layout: Edit page layout','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ActionType','zh-CN','ActionType','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ContainerClass','zh-CN','ContainerClass','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CreateBy','zh-CN','CreateBy','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CreatebyName','zh-CN','?????????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CreateDate','zh-CN','????????????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@CurrentTheme','zh-CN','CurrentTheme','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Description','en-GB','Description','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Description','en-US','Description','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Description','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Html','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ID','zh-CN','ID','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ImageThumbUrl','zh-CN','?????????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ImageUrl','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@IsTemplate','en-GB','Is Template','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@IsTemplate','en-US','Is Template','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@IsTemplate','zh-CN','???????????????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LastUpdateBy','zh-CN','LastUpdateBy','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LastUpdateByName','zh-CN','?????????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LastUpdateDate','zh-CN','????????????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Layout','zh-CN','Layout','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LayoutName','en-GB','Layout Name','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LayoutName','en-US','Layout Name','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@LayoutName','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Page','zh-CN','Page','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@PreViewPage','zh-CN','PreViewPage','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Script','en-GB','Script','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Script','en-US','Script','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Script','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Status','en-GB','Status','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Status','en-US','Status','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Status','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Style','en-GB','Style','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Style','en-US','Style','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Style','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Templates','zh-CN','Templates','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Theme','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Title','zh-CN','??????','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@Zones','zh-CN','Zones','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutEntity@ZoneWidgets','zh-CN','ZoneWidgets','LayoutEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@ActionType','zh-CN','ActionType','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@CreateBy','zh-CN','CreateBy','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@CreatebyName','zh-CN','?????????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@CreateDate','zh-CN','????????????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Description','zh-CN','??????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Html','zh-CN','??????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LastUpdateBy','zh-CN','LastUpdateBy','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LastUpdateByName','zh-CN','?????????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LastUpdateDate','zh-CN','????????????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LayoutHtmlId','zh-CN','LayoutHtmlId','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@LayoutId','zh-CN','??????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Status','zh-CN','??????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LayoutHtml@Title','zh-CN','??????','LayoutHtml','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than','en-GB','Less Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than','en-US','Less Than',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than Or Equals','en-GB','Less Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than Or Equals','en-US','Less Than Or Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Less Than Or Equals','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Letter Spacing','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LG Screen','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('License','en-GB','License',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('License','en-US','License',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('License','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Lighter','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Line Height','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Line Through','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Link','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('List','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('List Group','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('List Group End','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Location','en-US','Location','LiveChatScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Location','zh-CN','??????','GlobalScripts','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Script','en-US','Script','LiveChatScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('LiveChatScript@Script','zh-CN','??????','LiveChatScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Load demo data','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Logs','en-GB','Log',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Logs','en-US','Log',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Logs','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Lowercase','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Male','en-GB','Male',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Male','en-US','Male',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Male','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Article','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Article Category','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Carousel','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Comments','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Content','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Content Template','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Content Type','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Form','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Form Data','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Layout','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Media','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Message','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Navigation','en-GB','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Navigation','en-US','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Navigation','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Notify Email','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Order','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Page','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Page','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Page','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Pages','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product Category','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Product Tag','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Role','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Setting','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Subscription','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Template','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Theme','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage URL Redirection','zh-CN','??????URL?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Manage Users','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Map','en-GB','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Map','en-US','Map',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Map','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Margin','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Margin Padding','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Married','en-GB','Married',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Married','en-US','Married',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Married','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Max Column Width','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Max Width','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Media','en-GB','Media',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Media','en-US','Media',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Media','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@ActionType','zh-CN','ActionType','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@CreateBy','zh-CN','CreateBy','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@CreatebyName','zh-CN','CreatebyName','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@CreateDate','zh-CN','CreateDate','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Description','zh-CN','??????','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@ID','zh-CN','ID','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@LastUpdateBy','zh-CN','LastUpdateBy','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@LastUpdateByName','zh-CN','LastUpdateByName','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@LastUpdateDate','zh-CN','LastUpdateDate','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@MediaType','zh-CN','MediaType','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@MediaTypeImage','zh-CN','MediaTypeImage','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@ParentID','zh-CN','ParentID','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Status','zh-CN','??????','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Title','zh-CN','??????','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MediaEntity@Url','zh-CN','Url','MediaEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Medium','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Memory Cache','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message','en-GB','Message',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message','en-US','Message',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message And Comments','en-GB','Comments',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message And Comments','en-US','Comments',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message And Comments','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message Board','en-GB','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message Board','en-US','Message Board',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message Board','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message List','en-GB','Message List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message List','en-US','Message List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Message List','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@AssemblyName','zh-CN','Assembly Name','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@IsSystem','zh-CN','Is System','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@IsTemplate','zh-CN','???????????????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@PartialView','zh-CN','????????????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@Position','zh-CN','??????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@ServiceTypeName','zh-CN','Service Type Name','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@StyleClass','zh-CN','???????????????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@Thumbnail','zh-CN','?????????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@Title','zh-CN','??????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@ViewModelTypeName','zh-CN','View Model Type Name','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@WidgetName','zh-CN','????????????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageBoxWidget@ZoneID','zh-CN','??????','MessageBoxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@ActionType','zh-CN','ActionType','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateBy','zh-CN','CreateBy','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','en-GB','Create By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','en-US','Create By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreatebyName','zh-CN','?????????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateDate','en-GB','Create Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateDate','en-US','Create Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@CreateDate','zh-CN','????????????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Description','zh-CN','??????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Email','en-GB','Email','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Email','en-US','Email','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Email','zh-CN','??????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@ID','zh-CN','ID','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateBy','zh-CN','LastUpdateBy','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','en-GB','Last Update By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','en-US','Last Update By','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateByName','zh-CN','?????????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','en-GB','Last Update Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','en-US','Last Update Date','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@LastUpdateDate','zh-CN','????????????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@PostMessage','zh-CN','????????????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Reply','zh-CN','??????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','en-GB','Status','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','en-US','Status','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Status','zh-CN','??????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','en-GB','Name','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','en-US','Name','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageEntity@Title','zh-CN','??????','MessageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@CommentNotifyEmails','en-GB','Comment Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@CommentNotifyEmails','en-US','Comment Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@CommentNotifyEmails','zh-CN','?????????????????????','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@MessageNotifyEmails','en-GB','Message Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@MessageNotifyEmails','en-US','Message Notify Emails','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageNotificationConfig@MessageNotifyEmails','zh-CN','?????????????????????','MessageNotificationConfig','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ActionType','zh-CN','ActionType','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@AssemblyName','zh-CN','AssemblyName','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CreateBy','zh-CN','CreateBy','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CreatebyName','zh-CN','?????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CreateDate','zh-CN','????????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CustomClass','zh-CN','CustomClass','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@CustomStyle','zh-CN','CustomStyle','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Description','zh-CN','??????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ExtendData','zh-CN','ExtendData','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ExtendFields','zh-CN','????????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@FormView','zh-CN','FormView','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ID','zh-CN','ID','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@IsSystem','zh-CN','IsSystem','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@IsTemplate','zh-CN','???????????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LastUpdateBy','zh-CN','LastUpdateBy','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LastUpdateByName','zh-CN','?????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LastUpdateDate','zh-CN','????????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@LayoutID','zh-CN','LayoutID','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@PageID','zh-CN','PageID','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@PartialView','zh-CN','????????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Position','zh-CN','??????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ServiceTypeName','zh-CN','ServiceTypeName','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Status','zh-CN','??????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@StyleClass','zh-CN','???????????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Thumbnail','zh-CN','?????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@Title','zh-CN','??????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@WidgetName','zh-CN','????????????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('MessageWidget@ZoneID','zh-CN','??????','MessageWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Mobile (<768px)','zh-CN','?????? (<768px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modified','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modified By','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modify Account','en-GB','Modify Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modify Account','en-US','Modify Account',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Modify Account','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','en-GB','More',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','en-US','More',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More','zh-TW','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More Templates','zh-CN','????????????>>',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('More...','zh-CN','??????...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Most Read Top10','zh-CN','???????????? Top10',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Mouse Cursor','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Move','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi Line','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language','en-GB','Multi-language',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language','en-US','Multi-language',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language Config','en-GB','Multi-language Config',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language Config','en-US','Multi-language Config',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-language Config','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Multi-Language Setting','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('My Order','en-GB','Orders',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('My Order','en-US','Orders',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('My Order','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Name','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Navigation','en-GB','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Navigation','en-US','Navigation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Navigation','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@ActionType','zh-CN','ActionType','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@CreateBy','zh-CN','CreateBy','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@CreatebyName','zh-CN','?????????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@CreateDate','zh-CN','????????????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Description','en-GB','Description','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Description','en-US','Description','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Description','zh-CN','??????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@DisplayOrder','zh-CN','??????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Html','en-GB','Html','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Html','en-US','Html','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Html','zh-CN','HTML??????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@ID','zh-CN','ID','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsCurrent','en-GB','Is Current','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsCurrent','en-US','Is Current','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsCurrent','zh-CN','IsCurrent','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsMobile','en-GB','Is Mobile','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsMobile','en-US','Is Mobile','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@IsMobile','zh-CN','??????????????????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@LastUpdateBy','zh-CN','LastUpdateBy','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@LastUpdateByName','zh-CN','?????????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@LastUpdateDate','zh-CN','????????????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@ParentId','zh-CN','ParentId','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Status','en-GB','Status','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Status','en-US','Status','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Status','zh-CN','??????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Title','en-GB','Title','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Title','en-US','Title','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Title','zh-CN','??????','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Url','en-GB','Url','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Url','en-US','Url','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationEntity@Url','zh-CN','Url','NavigationEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ActionType','zh-CN','ActionType','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AlignClass','en-GB','Align Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AlignClass','en-US','Align Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AlignClass','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AssemblyName','en-GB','Assembly Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AssemblyName','en-US','Assembly Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@AssemblyName','zh-CN','AssemblyName','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CreateBy','zh-CN','CreateBy','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CreatebyName','zh-CN','?????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CreateDate','zh-CN','????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomClass','zh-CN','CustomClass','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomerClass','en-GB','Customer Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomerClass','en-US','Customer Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomerClass','zh-CN','?????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@CustomStyle','zh-CN','?????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Description','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ExtendData','zh-CN','ExtendData','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ExtendFields','zh-CN','????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@FormView','zh-CN','FormView','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ID','zh-CN','ID','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsSystem','en-GB','Is System','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsSystem','en-US','Is System','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsSystem','zh-CN','IsSystem','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTemplate','en-GB','Is Template','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTemplate','en-US','Is Template','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTemplate','zh-CN','???????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@IsTopFix','zh-CN','????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LastUpdateBy','zh-CN','LastUpdateBy','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LastUpdateByName','zh-CN','?????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LastUpdateDate','zh-CN','????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@LayoutID','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Logo','en-GB','Logo','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Logo','en-US','Logo','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Logo','zh-CN','Logo','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PageID','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartDriver','zh-CN','PartDriver','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartialView','en-GB','Partial View','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartialView','en-US','Partial View','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@PartialView','zh-CN','????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Position','en-GB','Position','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Position','en-US','Position','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Position','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@RootID','en-GB','Root','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@RootID','en-US','Root','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@RootID','zh-CN','?????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ServiceTypeName','en-GB','Service Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ServiceTypeName','en-US','Service Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ServiceTypeName','zh-CN','ServiceTypeName','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ShowBasket','en-GB','Show Basket','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ShowBasket','en-US','Show Basket','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ShowBasket','zh-CN','??????????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Status','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@StyleClass','en-GB','Style Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@StyleClass','en-US','Style Class','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@StyleClass','zh-CN','???????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Thumbnail','en-GB','Thumbnail','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Thumbnail','en-US','Thumbnail','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Thumbnail','zh-CN','?????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Title','en-GB','Title','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Title','en-US','Title','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@Title','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ViewModelTypeName','en-GB','View Model Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ViewModelTypeName','en-US','View Model Type Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@WidgetName','en-GB','Widget Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@WidgetName','en-US','Widget Name','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@WidgetName','zh-CN','????????????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ZoneID','en-GB','Zone','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ZoneID','en-US','Zone','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('NavigationWidget@ZoneID','zh-CN','??????','NavigationWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ne-resize','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Category','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Category','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Category','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Folder','en-GB','New Folder',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Folder','en-US','New Folder',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Folder','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Layout','en-GB','New Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Layout','en-US','New Layout',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Layout','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Navigation','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Navigation','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Navigation','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page','en-GB','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page','en-US','New Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page: Add a root level page','en-GB','New Page: Add a root level page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page: Add a root level page','en-US','New Page: Add a root level page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Page: Add a root level page','zh-CN','?????????????????????????????????????????????????????????????????????~/xxxxx',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Password','en-GB','New Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Password','en-US','New Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Password','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Product Tag','en-GB','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Product Tag','en-US','New',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Product Tag','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New Tag','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New: Add sub page','en-GB','New: Add sub page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New: Add sub page','en-US','New: Add sub page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('New: Add sub page','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('News','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Next','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Next:','zh-CN','?????????:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('No','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('None','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('None???Auto???','zh-CN','None????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('no-repeat','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Normal','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Contains','en-GB','Not Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Contains','en-US','Not Contains',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Contains','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Ends With','en-GB','Not Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Ends With','en-US','Not Ends With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Ends With','zh-CN','??????...??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Equals','en-GB','Not Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Equals','en-US','Not Equals',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Equals','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not In','en-GB','Not In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not In','en-US','Not In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not In','zh-CN','??????...???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Starts With','en-GB','Not Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Starts With','en-US','Not Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Not Starts With','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice:','en-GB','Notice:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice:','en-US','Notice:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice:','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice: click the rule will display the match content.','zh-CN','???????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notice: Drop to upload','zh-CN','????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Notify Email','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('n-resize','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Number','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('nw-resize','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth','en-GB','OAuth',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth','en-US','OAuth',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuth Config','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@AssemblyName','zh-CN','Assembly Name','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@IsSystem','zh-CN','Is System','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@IsTemplate','zh-CN','???????????????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@PartialView','zh-CN','????????????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Position','zh-CN','??????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@QQ','zh-CN','QQ?','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Redirect','zh-CN','????????????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@ServiceTypeName','zh-CN','Service Type Name','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@StyleClass','zh-CN','???????????????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Thumbnail','zh-CN','?????????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@Title','zh-CN','??????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@ViewModelTypeName','zh-CN','View Model Type Name','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WeChat','zh-CN','???????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WeiBo','zh-CN','???????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@WidgetName','zh-CN','????????????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OAuthWidget@ZoneID','zh-CN','??????','OAuthWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Oblique','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Official Website','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('OK','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Old Password','en-GB','Old Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Old Password','en-US','Old Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Old Password','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Only support zip package','zh-CN','?????????????????????<code>zip</code>??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Only unpaid order can be closed!','zh-CN','????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Option','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Option 1','zh-CN','??????1',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Option 2','zh-CN','??????2',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Or','en-GB','Or',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Or','en-US','Or',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Or','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order','en-GB','Order',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order','en-US','Order',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Amount','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Confirm','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Date','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Detail','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order failed to pay','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order for refund','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Number','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order Number:','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ActionType','zh-CN','ActionType','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CompletePayTime','zh-CN','??????????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Contact','en-GB','Contact','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Contact','en-US','Contact','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Contact','zh-CN','?????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateBy','zh-CN','CreateBy','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreatebyName','zh-CN','?????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateDate','en-GB','Create Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateDate','en-US','Create Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@CreateDate','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Description','zh-CN','??????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ID','en-US','ID','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ID','zh-CN','?????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateBy','zh-CN','LastUpdateBy','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','en-GB','Last Update By','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','en-US','Last Update By','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateByName','zh-CN','?????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateDate','en-GB','Last Update Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateDate','en-US','Last Update Date','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LastUpdateDate','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@LogisticsCompany','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@OrderStatus','en-GB','Order Status','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@OrderStatus','en-US','Order Status','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@OrderStatus','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PaymentGateway','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PaymentID','zh-CN','??????ID','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PayTime','zh-CN','??????????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PhoneNumber','en-GB','Phone Number','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PhoneNumber','en-US','Phone Number','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@PhoneNumber','zh-CN','??????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Refund','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@RefundDate','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@RefundID','zh-CN','???????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@RefundReason','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ShippingAddress','en-GB','Shipping Address','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ShippingAddress','en-US','Shipping Address','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@ShippingAddress','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Status','zh-CN','??????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Title','zh-CN','??????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Total','en-GB','Total','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Total','en-US','Total','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@Total','zh-CN','??????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@TrackingNumber','zh-CN','????????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Order@UserId','zh-CN','?????????','Order','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other','en-GB','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other','en-US','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other Settings','en-GB','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other Settings','en-US','Other',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Other Settings','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Output Cache','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Outset','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overflow','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overline','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overview','en-GB','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overview','en-US','Overview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Overview','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pack','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pack widget','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Padding','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page','en-GB','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page','en-US','Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page And Layout','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page description is empty','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page description is too short or too long','zh-CN','?????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Design','en-GB','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Design','en-US','Design',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Design','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keyword is empty','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keywords','en-GB','Page keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keywords','en-US','Page keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page keywords','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Not Exists','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page Title','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page title is empty','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Page title is too short or too long','zh-CN','?????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageAsset@Url','en-US','Url','PageAsset','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageAsset@Url','zh-CN','Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ActionType','zh-CN','ActionType','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Content','zh-CN','Content','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@CreateBy','zh-CN','CreateBy','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@CreatebyName','zh-CN','?????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@CreateDate','zh-CN','????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Description','en-GB','Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Description','en-US','Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Description','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@DisplayOrder','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ExtendFields','zh-CN','????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Favicon','zh-CN','Favicon','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ID','zh-CN','ID','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsHomePage','en-GB','Is Home Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsHomePage','en-US','Is Home Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsHomePage','zh-CN','???????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublish','en-GB','Is Publish','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublish','en-US','Is Publish','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublish','zh-CN','??????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublishedPage','en-GB','Is Published Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublishedPage','en-US','Is Published Page','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsPublishedPage','zh-CN','IsPublishedPage','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsTemplate','en-GB','Is Template','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsTemplate','en-US','Is Template','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@IsTemplate','zh-CN','???????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LastUpdateBy','zh-CN','LastUpdateBy','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LastUpdateByName','zh-CN','?????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LastUpdateDate','zh-CN','????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LayoutId','en-GB','Layout','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LayoutId','en-US','Layout','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@LayoutId','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaDescription','en-GB','Meta Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaDescription','en-US','Meta Description','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaDescription','zh-CN','SEO??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaKeyWorlds','en-GB','Meta Key Worlds','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaKeyWorlds','en-US','Meta Key Worlds','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@MetaKeyWorlds','zh-CN','SEO?????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageName','en-GB','Page Name','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageName','en-US','Page Name','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageName','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageUrl','en-GB','Page Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageUrl','en-US','Page Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PageUrl','zh-CN','????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ParentId','zh-CN','ParentId','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@PublishDate','zh-CN','????????????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@ReferencePageID','zh-CN','ReferencePageID','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Script','en-GB','Script','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Script','en-US','Script','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Script','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Scripts','en-US','Scripts','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Scripts','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','en-GB','Status','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','en-US','Status','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Status','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','en-GB','Style','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','en-US','Style','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Style','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Styles','en-US','Styles','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Styles','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','en-GB','Title','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','en-US','Title','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Title','zh-CN','??????','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PageEntity@Url','zh-CN','Url','PageEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paid','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Panel','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paragraph','en-GB','Paragraph',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paragraph','en-US','Paragraph',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paragraph','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Parallax','en-GB','Parallax',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Parallax','en-US','Parallax',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Parallax','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@AssemblyName','zh-CN','Assembly Name','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ImageUrl','zh-CN','??????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@IsSystem','zh-CN','Is System','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@IsTemplate','zh-CN','???????????????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@PartialView','zh-CN','????????????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@Position','zh-CN','??????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ServiceTypeName','zh-CN','Service Type Name','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@StyleClass','zh-CN','???????????????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@Thumbnail','zh-CN','?????????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@Title','zh-CN','??????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ViewModelTypeName','zh-CN','View Model Type Name','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@WidgetName','zh-CN','????????????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ParallaxWidget@ZoneID','zh-CN','??????','ParallaxWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PartialView','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Password','en-GB','Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Password','en-US','Password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Password','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Passwords are inconsistent','en-GB','Passwords are inconsistent',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Passwords are inconsistent','en-US','Passwords are inconsistent',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Passwords are inconsistent','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste','en-GB','Paste',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste','en-US','Paste',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Paste copy content to the area','zh-CN','?????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pay','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pay Online','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Payment Information','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Payment Order','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Payment Setting','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@ClientID','zh-CN','Client ID',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@ClientSecretID','zh-CN','Client Secret ID',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@Environment','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('PayPalOptions@IsEnable','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pending pages','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone','en-GB','Phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone','en-US','Phone',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Phone number is invalid','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Picture','en-GB','Image',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Picture','en-US','Image',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Picture','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pixel Script','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Placeholder','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please contact administrator.','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter the refund amount','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your account information','zh-CN','??????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your name','en-GB','Please enter your name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your name','en-US','Please enter your name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your name','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in','en-GB','Please enter your user information to log in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in','en-US','Please enter your user information to log in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in','zh-CN','????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in to the system','en-GB','Please enter your user information to log in to the system',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in to the system','en-US','Please enter your user information to log in to the system',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to log in to the system','zh-CN','??????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to regist','en-GB','Please enter your user information to regist',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to regist','en-US','Please enter your user information to regist',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please enter your user information to regist','zh-CN','????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please input a number','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please input a phone number','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please make only one folder in the package','zh-CN','?????????????????????<strong>??????????????????????????????</strong>???????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please select a product category','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please select at least one option','zh-CN','???????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Please try again later.','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Plugins','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Pointer','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Bottom','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Left','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Right','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Top','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Position Type','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Press Enter to save','en-GB','Press Enter to save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Press Enter to save','en-US','Press Enter to save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Press Enter to save','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview','en-GB','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview','en-US','Preview',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview: Preview the pending page','en-GB','Preview: Preview the page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview: Preview the pending page','en-US','Preview: Preview the page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Preview: Preview the pending page','zh-CN','?????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Previous:','zh-CN','?????????:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Price','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Category','en-GB','Product Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Category','en-US','Product Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Category','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Content','en-GB','Product Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Content','en-US','Product Content',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Content','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Gallery','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product keywords','en-GB','Product keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product keywords','en-US','Product keywords',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product keywords','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product List','en-GB','Product List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product List','en-US','Product List',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product List','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Sort','en-GB','Sort',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Sort','en-US','Sort',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Sort','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Tag','en-GB','Product Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Tag','en-US','Product Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Product Tag','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ActionType','zh-CN','ActionType','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@CreateBy','zh-CN','CreateBy','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@CreatebyName','zh-CN','?????????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@CreateDate','zh-CN','????????????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Description','en-GB','Description','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Description','en-US','Description','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Description','zh-CN','??????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ID','zh-CN','ID','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@LastUpdateByName','zh-CN','?????????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@LastUpdateDate','zh-CN','????????????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ParentID','en-GB','Parent','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ParentID','en-US','Parent','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@ParentID','zh-CN','ParentID','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEODescription','en-US','SEO Description',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEODescription','zh-CN','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEODescription','zh-TW','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOKeyWord','en-US','SEO Key Word',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOKeyWord','zh-CN','SEO?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOKeyWord','zh-TW','SEO?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOTitle','en-US','SEO Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOTitle','zh-CN','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@SEOTitle','zh-TW','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Status','en-GB','Status','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Status','en-US','Status','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Status','zh-CN','??????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Title','en-GB','Title','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Title','en-US','Title','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Title','zh-CN','??????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Url','en-GB','Url','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Url','en-US','Url','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategory@Url','zh-CN','?????????','ProductCategory','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryTag@ProductCategoryId','en-US','Product Category',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryTag@ProductCategoryId','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryTag@ProductCategoryId','zh-TW','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ActionType','zh-CN','ActionType','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@AssemblyName','zh-CN','AssemblyName','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CreateBy','zh-CN','CreateBy','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CreatebyName','zh-CN','?????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CreateDate','zh-CN','????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CustomClass','zh-CN','CustomClass','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@CustomStyle','zh-CN','CustomStyle','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Description','zh-CN','??????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ExtendFields','zh-CN','????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@FormView','zh-CN','FormView','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ID','zh-CN','ID','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@IsSystem','zh-CN','IsSystem','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@IsTemplate','zh-CN','???????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LastUpdateByName','zh-CN','?????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LastUpdateDate','zh-CN','????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@LayoutID','zh-CN','LayoutID','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@PageID','zh-CN','PageID','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@PartialView','zh-CN','????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Position','zh-CN','??????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ProductCategoryID','zh-CN','????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Status','zh-CN','??????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@StyleClass','zh-CN','???????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@TargetPage','zh-CN','????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Thumbnail','zh-CN','?????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@Title','zh-CN','??????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@WidgetName','zh-CN','????????????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductCategoryWidget@ZoneID','zh-CN','??????','ProductCategoryWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ActionType','zh-CN','ActionType','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@AssemblyName','zh-CN','AssemblyName','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CreateBy','zh-CN','CreateBy','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CreatebyName','zh-CN','?????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CreateDate','zh-CN','????????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CustomClass','zh-CN','CustomClass','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CustomerClass','zh-CN','CustomerClass','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@CustomStyle','zh-CN','CustomStyle','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Description','zh-CN','??????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ExtendFields','zh-CN','????????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@FormView','zh-CN','FormView','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ID','zh-CN','ID','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@IsSystem','zh-CN','IsSystem','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@IsTemplate','zh-CN','???????????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LastUpdateByName','zh-CN','?????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LastUpdateDate','zh-CN','????????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@LayoutID','zh-CN','LayoutID','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@PageID','zh-CN','PageID','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@PartialView','zh-CN','????????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Position','zh-CN','??????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Status','zh-CN','??????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@StyleClass','zh-CN','???????????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Thumbnail','zh-CN','?????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@Title','zh-CN','??????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@WidgetName','zh-CN','????????????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductDetailWidget@ZoneID','zh-CN','??????','ProductDetailWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ActionType','zh-CN','ActionType','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@BrandCD','zh-CN','BrandCD','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Color','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateBy','zh-CN','CreateBy','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','en-GB','Create By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','en-US','Create By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreatebyName','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateDate','en-GB','Create Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateDate','en-US','Create Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@CreateDate','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Description','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ExtendFields','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ID','zh-CN','ID','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ImageThumbUrl','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ImageUrl','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@IsPublish','zh-CN','??????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateBy','zh-CN','LastUpdateBy','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','en-GB','Last Update By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','en-US','Last Update By','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateByName','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateDate','en-GB','Last Update Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateDate','en-US','Last Update Date','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@LastUpdateDate','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Norm','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@OrderIndex','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PartNumber','en-GB','Part Number','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PartNumber','en-US','Part Number','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PartNumber','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Price','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductCategoryID','en-GB','Product Category','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductCategoryID','en-US','Product Category','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductCategoryID','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductContent','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductEntityCategory','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductEntityCategoryID','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductEntityContent','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductImages','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ProductTags','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PublishDate','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@PurchasePrice','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@RebatePrice','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SEODescription','zh-CN','SEO??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SEOKeyWord','zh-CN','SEO?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SEOTitle','zh-CN','SEO??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@ShelfLife','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@SourceFrom','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Status','en-GB','Status','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Status','en-US','Status','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Status','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@TargetFrom','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@TargetUrl','zh-CN','????????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Title','en-GB','Title','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Title','en-US','Title','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Title','zh-CN','??????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductEntity@Url','zh-CN','?????????','ProductEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductGalleryWidget@DetailPageUrl','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductGalleryWidget@ProductGalleryId','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ActionType','zh-CN','ActionType','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@CreateBy','zh-CN','CreateBy','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@CreatebyName','zh-CN','?????????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@CreateDate','zh-CN','????????????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@Description','zh-CN','??????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ID','zh-CN','ID','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ImageUrl','zh-CN','??????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@LastUpdateBy','zh-CN','LastUpdateBy','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@LastUpdateByName','zh-CN','?????????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@LastUpdateDate','zh-CN','????????????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@ProductId','zh-CN','ProductId','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@Status','zh-CN','??????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductImage@Title','zh-CN','??????','ProductImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ActionType','zh-CN','ActionType','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@AssemblyName','zh-CN','AssemblyName','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Columns','zh-CN','?????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CreateBy','zh-CN','CreateBy','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CreatebyName','zh-CN','?????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CreateDate','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CustomClass','zh-CN','CustomClass','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@CustomStyle','zh-CN','CustomStyle','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Description','zh-CN','??????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@DetailPageUrl','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ExtendData','zh-CN','ExtendData','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ExtendFields','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@FormView','zh-CN','FormView','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ID','zh-CN','ID','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@IsPageable','zh-CN','???????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@IsSystem','zh-CN','IsSystem','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@IsTemplate','zh-CN','???????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LastUpdateBy','zh-CN','LastUpdateBy','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LastUpdateByName','zh-CN','?????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LastUpdateDate','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@LayoutID','zh-CN','LayoutID','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@PageID','zh-CN','PageID','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@PageSize','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@PartialView','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Position','zh-CN','??????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ProductCategoryID','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ServiceTypeName','zh-CN','ServiceTypeName','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Status','zh-CN','??????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@StyleClass','zh-CN','???????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Thumbnail','zh-CN','?????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@Title','zh-CN','??????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@WidgetName','zh-CN','????????????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ProductListWidget@ZoneID','zh-CN','??????','ProductListWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Products','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property','en-GB','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property','en-US','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property/History','en-GB','Property/History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property/History','en-US','Property/History',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property/History','zh-CN','??????/????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property: Page property, history etc.','en-GB','Property: Page property, history etc.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property: Page property, history etc.','en-US','Property: Page property, history etc.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Property: Page property, history etc.','zh-CN','???????????????????????????????????????????????????SEO????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Province Address','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish','en-GB','Publish',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish','en-US','Publish',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Article','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish By','en-GB','Publish By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish By','en-US','Publish By',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish By','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Date','en-GB','Publish Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Date','en-US','Publish Date',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Date','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish Product','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish: Publish page','en-GB','Publish: Publish page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish: Publish page','en-US','Publish: Publish page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Publish: Publish page','zh-CN','??????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Published','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('QQ Config','zh-CN','??????QQ??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Query String','en-GB','Query String',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Query String','en-US','Query String',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Query String','zh-CN','Url??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Querystring is not allowed','zh-CN','????????????????????????URL???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Radio Button','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Radius','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Recent Articles','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reduce Margin','en-GB','Full',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reduce Margin','en-US','Full',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reduce Margin','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refresh','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund Amount','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund amount exceeds the amount of the order','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund Information','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refund successfull!','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refunded','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Refunding','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Regular expression','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reinstall to update the theme','en-GB','Reinstall to update the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reinstall to update the theme','en-US','Reinstall to update the theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reinstall to update the theme','zh-CN','?????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Relative','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Release your mouse to upload...','zh-CN','????????????????????????...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Repeat','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('repeat-x','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('repeat-y','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reply','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Report issue','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Required Message','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Required?','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reset failed?','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Reset password','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','en-GB','Revert',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','en-US','Revert',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert','zh-TW','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert from version: {0:g}','zh-CN','??? {0:g} ????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert to','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Revert to original','zh-CN','?????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Review','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rich Text','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rich text box','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Ridge','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Robots@Content','en-US','Content','Robots','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Robots@Content','zh-CN','??????','Robots','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Role','en-GB','Role',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Role','en-US','Role',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Role','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ActionType','zh-CN','ActionType','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateBy','zh-CN','CreateBy','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','en-GB','Create By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','en-US','Create By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreatebyName','zh-CN','?????????','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','en-GB','Create Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','en-US','Create Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@CreateDate','zh-CN','????????????','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Description','en-US','Description','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Description','zh-CN','??????','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ID','en-US','ID','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@ID','zh-CN','ID','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateBy','zh-CN','LastUpdateBy','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','en-GB','Last Update By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','en-US','Last Update By','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateByName','zh-CN','?????????','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateDate','en-GB','Last Update Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateDate','en-US','Last Update Date','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@LastUpdateDate','zh-CN','????????????','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Permissions','zh-CN','Permissions','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Status','en-GB','Status','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Status','en-US','Status','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Status','zh-CN','??????','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Title','en-GB','Title','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Title','en-US','Title','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleEntity@Title','zh-CN','??????','RoleEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RoleID','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Row','en-GB','Row',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Row','en-US','Row',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Row','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Description','en-GB','Description','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Description','en-US','Description','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Description','zh-CN','??????','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleID','en-GB','Rule','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleID','en-US','Rule','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleID','zh-CN','RuleID','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleItemList','en-GB','Rule Item List','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleItemList','en-US','Rule Item List','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@RuleItemList','zh-CN','?????????','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Status','en-GB','Status','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Status','en-US','Status','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Status','zh-CN','??????','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Title','en-GB','Title','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Title','en-US','Title','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@Title','zh-CN','??????','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@ZoneName','en-GB','Zone Name','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@ZoneName','en-US','Zone Name','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Rule@ZoneName','zh-CN','????????????','Rule','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Condition','en-GB','Condition','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Condition','en-US','Condition','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Condition','zh-CN','??????','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@FunctionName','en-GB','Function Name','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@FunctionName','en-US','Function Name','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@FunctionName','zh-CN','????????????','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Property','en-GB','Property','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Property','en-US','Property','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Property','zh-CN','??????','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Value','en-GB','Value','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Value','en-US','Value','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('RuleItem@Value','zh-CN','???','RuleItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save','en-GB','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save','en-US','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Save Success','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Scan all pages','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ActionType','zh-CN','ActionType','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@AssemblyName','zh-CN','AssemblyName','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CreateBy','zh-CN','CreateBy','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CreatebyName','zh-CN','?????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CreateDate','zh-CN','????????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CustomClass','zh-CN','CustomClass','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@CustomStyle','zh-CN','CustomStyle','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Description','zh-CN','??????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ExtendFields','zh-CN','????????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@FormView','zh-CN','FormView','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ID','zh-CN','ID','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@IsSystem','zh-CN','IsSystem','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@IsTemplate','zh-CN','???????????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LastUpdateBy','zh-CN','LastUpdateBy','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LastUpdateByName','zh-CN','?????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LastUpdateDate','zh-CN','????????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@LayoutID','zh-CN','LayoutID','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@PageID','zh-CN','PageID','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@PartialView','zh-CN','????????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Position','zh-CN','??????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Script','zh-CN','??????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ServiceTypeName','zh-CN','ServiceTypeName','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Status','zh-CN','??????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@StyleClass','zh-CN','???????????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Thumbnail','zh-CN','?????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@Title','zh-CN','??????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@WidgetName','zh-CN','????????????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ScriptWidget@ZoneID','zh-CN','??????','ScriptWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Scroll','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search','zh-CN','??? ???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Optimization','en-GB','SEO',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Optimization','en-US','SEO',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Optimization','zh-CN','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Engine Search','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search Page','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Search result depends on the following information:','zh-CN','????????????????????????????????????<strong>?????????</strong>???????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchKeyword@Title','zh-CN','??????','SearchKeyword','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@AssemblyName','zh-CN','AssemblyName','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@IsSystem','zh-CN','IsSystem','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@IsTemplate','zh-CN','???????????????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@PartialView','zh-CN','????????????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@Position','zh-CN','??????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@SearchKeywords','zh-CN','?????????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@ServiceTypeName','zh-CN','ServiceTypeName','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@StyleClass','zh-CN','???????????????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@Thumbnail','zh-CN','?????????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@Title','zh-CN','??????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@WidgetName','zh-CN','????????????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SearchWidget@ZoneID','zh-CN','??????','SearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Section Widget','en-GB','Custom Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Section Widget','en-US','Custom Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Section Widget','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@ActionType','zh-CN','ActionType','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@CreateBy','zh-CN','CreateBy','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@CreatebyName','zh-CN','?????????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@CreateDate','zh-CN','????????????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Description','zh-CN','??????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@ID','zh-CN','ID','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@LastUpdateBy','zh-CN','LastUpdateBy','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@LastUpdateByName','zh-CN','?????????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@LastUpdateDate','zh-CN','????????????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Order','zh-CN','??????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@SectionContentType','zh-CN','SectionContentType','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@SectionGroupId','zh-CN','SectionGroupId','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@SectionWidgetId','zh-CN','SectionWidgetId','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Status','zh-CN','??????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContent@Title','zh-CN','??????','SectionContent','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@ActionType','zh-CN','ActionType','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@CreateBy','zh-CN','CreateBy','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@CreatebyName','zh-CN','?????????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@CreateDate','zh-CN','????????????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Description','zh-CN','??????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Href','zh-CN','??????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@ID','zh-CN','ID','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@InnerText','zh-CN','??????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@LastUpdateByName','zh-CN','?????????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@LastUpdateDate','zh-CN','????????????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Order','zh-CN','??????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@SectionContentType','zh-CN','SectionContentType','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@SectionGroupId','zh-CN','SectionGroupId','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Status','zh-CN','??????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentCallToAction@Title','zh-CN','??????','SectionContentCallToAction','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ActionType','zh-CN','ActionType','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@CreateBy','zh-CN','CreateBy','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@CreatebyName','zh-CN','?????????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@CreateDate','zh-CN','????????????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Description','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Height','zh-CN','??????(px)','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Href','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ID','zh-CN','ID','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ImageAlt','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ImageSrc','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@ImageTitle','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@LastUpdateByName','zh-CN','?????????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@LastUpdateDate','zh-CN','????????????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Order','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@SectionContentType','zh-CN','SectionContentType','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@SectionGroupId','zh-CN','SectionGroupId','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Status','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Title','zh-CN','??????','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentImage@Width','zh-CN','??????(px)','SectionContentImage','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@ActionType','zh-CN','ActionType','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@CreateBy','zh-CN','CreateBy','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@CreatebyName','zh-CN','?????????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@CreateDate','zh-CN','????????????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Description','zh-CN','??????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@HtmlContent','zh-CN','??????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@ID','zh-CN','ID','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@LastUpdateByName','zh-CN','?????????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@LastUpdateDate','zh-CN','????????????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Order','zh-CN','??????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@SectionContentType','zh-CN','SectionContentType','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@SectionGroupId','zh-CN','SectionGroupId','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Status','zh-CN','??????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentParagraph@Title','zh-CN','??????','SectionContentParagraph','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@ActionType','zh-CN','ActionType','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@CreateBy','zh-CN','CreateBy','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@CreatebyName','zh-CN','?????????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@CreateDate','zh-CN','????????????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Description','zh-CN','??????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Href','zh-CN','??????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@ID','zh-CN','ID','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@InnerText','zh-CN','??????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@LastUpdateByName','zh-CN','?????????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@LastUpdateDate','zh-CN','????????????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Order','zh-CN','??????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@SectionContentType','zh-CN','SectionContentType','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@SectionGroupId','zh-CN','SectionGroupId','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Status','zh-CN','??????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@Title','zh-CN','??????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentTitle@TitleLevel','zh-CN','??????','SectionContentTitle','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@ActionType','zh-CN','ActionType','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Code','zh-CN','????????????','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@CreateBy','zh-CN','CreateBy','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@CreatebyName','zh-CN','CreatebyName','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@CreateDate','zh-CN','CreateDate','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Description','zh-CN','??????','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Height','zh-CN','??????(px)','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@ID','zh-CN','ID','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@LastUpdateBy','zh-CN','LastUpdateBy','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@LastUpdateByName','zh-CN','LastUpdateByName','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@LastUpdateDate','zh-CN','LastUpdateDate','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Order','zh-CN','Order','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@SectionContentType','zh-CN','SectionContentType','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@SectionGroupId','zh-CN','SectionGroupId','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@SectionWidgetId','zh-CN','SectionWidgetId','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Status','zh-CN','??????','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Thumbnail','zh-CN','?????????','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Title','zh-CN','Title','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Url','zh-CN','????????????(MP4)','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@VideoTitle','zh-CN','??????','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionContentVideo@Width','zh-CN','??????(px)','SectionContentVideo','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@ActionType','zh-CN','ActionType','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CallToAction','zh-CN','CallToAction','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CallToActions','zh-CN','CallToActions','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CreateBy','zh-CN','CreateBy','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CreatebyName','zh-CN','?????????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@CreateDate','zh-CN','????????????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Description','zh-CN','??????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@GroupName','zh-CN','??????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@ID','zh-CN','ID','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@IsLoadDefaultData','zh-CN','IsLoadDefaultData','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@LastUpdateBy','zh-CN','LastUpdateBy','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@LastUpdateByName','zh-CN','?????????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@LastUpdateDate','zh-CN','????????????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Order','zh-CN','??????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Paragraph','zh-CN','Paragraph','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Paragraphs','zh-CN','Paragraphs','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@PartialView','zh-CN','????????????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@PercentWidth','zh-CN','?????????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionContents','zh-CN','SectionContents','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionImage','zh-CN','SectionImage','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionImages','zh-CN','SectionImages','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionTitle','zh-CN','SectionTitle','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionTitles','zh-CN','SectionTitles','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@SectionWidgetId','zh-CN','SectionWidgetId','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Status','zh-CN','??????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionGroup@Title','zh-CN','??????','SectionGroup','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ActionType','zh-CN','ActionType','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@AssemblyName','zh-CN','AssemblyName','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CreateBy','zh-CN','CreateBy','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CreatebyName','zh-CN','?????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CreateDate','zh-CN','????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CustomClass','zh-CN','CustomClass','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@CustomStyle','zh-CN','CustomStyle','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Description','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ExtendData','zh-CN','ExtendData','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ExtendFields','zh-CN','????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@FormView','zh-CN','FormView','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Groups','zh-CN','Groups','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ID','zh-CN','ID','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@IsHorizontal','zh-CN','????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@IsSystem','zh-CN','IsSystem','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@IsTemplate','zh-CN','???????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LastUpdateBy','zh-CN','LastUpdateBy','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LastUpdateByName','zh-CN','?????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LastUpdateDate','zh-CN','????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@LayoutID','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@PageID','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@PartDriver','zh-CN','PartDriver','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@PartialView','zh-CN','????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Position','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@SectionTitle','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ServiceTypeName','zh-CN','ServiceTypeName','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Status','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@StyleClass','zh-CN','???????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Template','zh-CN','Template','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Thumbnail','zh-CN','?????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@Title','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@WidgetName','zh-CN','????????????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SectionWidget@ZoneID','zh-CN','??????','SectionWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Secure Payment','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Security','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select All','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select package file','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Select widget then double click or click next.','zh-CN','???????????????<strong>??????</strong>????????????<strong>?????????</strong>',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SEO Description','zh-CN','SEO??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SEO Keywords','zh-CN','SEO?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('se-resize','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Setting','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Setting have saved, but an error occur when clean cache.','zh-CN','??????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shadow','en-GB','Shadow',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shadow','en-US','Shadow',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shadow','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shiped','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipped','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipped orders','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipping','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipping Address','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shipping Option','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ShippingOption','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Shop','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Showcase','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ShowCaseWidget@CaseItems','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ShowCaseWidget@Header','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ShowCaseWidget@MoreLink','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign in','en-GB','Sign in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign in','en-US','Sign in',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign in','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign Out','en-GB','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign Out','en-US','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign Out','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign up','en-GB','Sign up',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign up','en-US','Sign up',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Sign up','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single domain','en-GB','Single domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single domain','en-US','Single domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single domain','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Single Line','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Search','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Templates','en-GB','Templates',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Templates','en-US','Templates',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Site Templates','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@AssemblyName','zh-CN','AssemblyName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@IsSystem','zh-CN','IsSystem','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@IsTemplate','zh-CN','???????????????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@PartialView','zh-CN','????????????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Position','zh-CN','??????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@SearchEngine','zh-CN','????????????',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@SearchQuery','zh-CN','Search Query','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ServiceTypeName','zh-CN','ServiceTypeName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@StyleClass','zh-CN','???????????????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Thumbnail','zh-CN','?????????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@Title','zh-CN','??????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@WidgetName','zh-CN','????????????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SiteSearchWidget@ZoneID','zh-CN','??????','SiteSearchWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Size','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SM Screen','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Small','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Small Caps','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SMTP Config','en-GB','SMTP',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SMTP Config','en-US','SMTP',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SMTP Config','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Email','en-US','Email','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Email','zh-CN','??????','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@EnableSsl','en-US','Enable Ssl','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@EnableSsl','zh-CN','??????SSL','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Host','en-US','Host','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Host','zh-CN','?????????','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@PassWord','en-US','Password','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@PassWord','zh-CN','??????','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Port','en-US','Port','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SmtpSetting@Port','zh-CN','??????','SmtpSetting','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Solid','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Specify Article Detail','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Split View','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewItem@ImageUrl','zh-CN','Image Url','SplitviewItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewItem@TargetLink','zh-CN','Target Link','SplitviewItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@AssemblyName','zh-CN','Assembly Name','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Images','zh-CN','??????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@IsSystem','zh-CN','Is System','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@IsTemplate','zh-CN','???????????????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@PartialView','zh-CN','????????????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Position','zh-CN','??????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@ServiceTypeName','zh-CN','Service Type Name','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@StyleClass','zh-CN','???????????????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Thumbnail','zh-CN','?????????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@Title','zh-CN','??????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@ViewModelTypeName','zh-CN','View Model Type Name','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@WidgetName','zh-CN','????????????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SplitviewWidget@ZoneID','zh-CN','??????','SplitviewWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('s-resize','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Standalone domain','en-GB','Standalone domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Standalone domain','en-US','Standalone domain',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Standalone domain','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Starts With','en-GB','Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Starts With','en-US','Starts With',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Starts With','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Static','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@CacheMinutes','zh-CN','????????????????????????',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@CacheProvider','zh-CN','????????????',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@Enable','zh-CN','?????????',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StaticPageSetting@ExcludePages','zh-CN','????????????',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@ActionType','zh-CN','ActionType','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@ContactName','zh-CN','ContactName','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@CreateBy','zh-CN','CreateBy','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@CreatebyName','zh-CN','CreatebyName','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@CreateDate','zh-CN','CreateDate','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Description','zh-CN','??????','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Host','zh-CN','Host','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@IpAddress','zh-CN','IpAddress','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@LastUpdateBy','zh-CN','LastUpdateBy','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@LastUpdateByName','zh-CN','LastUpdateByName','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@LastUpdateDate','zh-CN','LastUpdateDate','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@StatisticsId','zh-CN','StatisticsId','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Status','zh-CN','??????','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Tel','zh-CN','Tel','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Statistics@Title','zh-CN','??????','Statistics','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Location','en-US','Location','StatisticsScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Location','zh-CN','??????','GlobalScripts','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Script','en-US','Script','StatisticsScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StatisticsScript@Script','zh-CN','??????','StatisticsScript','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Status','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StrongPoint@Description','zh-CN','??????','StrongPoint','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StrongPoint@Title','zh-CN','??????','StrongPoint','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style','en-GB','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style','en-US','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style A','zh-CN','??????A',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style B','zh-CN','??????B',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style C','zh-CN','??????C',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style D','zh-CN','??????D',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style E','zh-CN','??????E',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style F','zh-CN','??????F',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Style G','zh-CN','??????G',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleClass','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ActionType','zh-CN','ActionType','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@AssemblyName','zh-CN','AssemblyName','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CreateBy','zh-CN','CreateBy','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CreatebyName','zh-CN','?????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CreateDate','zh-CN','????????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CustomClass','zh-CN','CustomClass','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@CustomStyle','zh-CN','CustomStyle','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Description','zh-CN','??????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ExtendFields','zh-CN','????????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@FormView','zh-CN','FormView','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ID','zh-CN','ID','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@IsSystem','zh-CN','IsSystem','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@IsTemplate','zh-CN','???????????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LastUpdateBy','zh-CN','LastUpdateBy','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LastUpdateByName','zh-CN','?????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LastUpdateDate','zh-CN','????????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@LayoutID','zh-CN','LayoutID','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@PageID','zh-CN','PageID','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@PartDriver','zh-CN','PartDriver','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@PartialView','zh-CN','????????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Position','zh-CN','??????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ServiceTypeName','zh-CN','ServiceTypeName','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Status','zh-CN','??????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@StyleClass','zh-CN','???????????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@StyleSheet','zh-CN','??????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Thumbnail','zh-CN','?????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@Title','zh-CN','??????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@WidgetName','zh-CN','????????????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('StyleSheetWidget@ZoneID','zh-CN','??????','StyleSheetWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Submit','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscribe','en-US','Subscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscribe','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@CreatebyName','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@CreateDate','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@Email','zh-CN','??????','Subscriber','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@IsValidate','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@LastUpdateByName','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@LastUpdateDate','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@Referrer','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscriber@Status','zh-CN','??????','Subscriber','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription','en-US','Subscription',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Body_Copy','en-US','Subscribe by email, you will be able to receive our related information at the first time',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Body_Copy','zh-CN','?????????????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Button','en-US','Yes, I want to subscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Button','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Copy','en-US','You will not be subscribed if you don''t click on the link above.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Copy','zh-CN','????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Title','en-US','Confirm Your Subscription',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Confirm_Title','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Button','en-US','Yes, I want to unsubscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Button','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Copy','en-US','You will not be unsubscribed if you don''t click on the link above.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Copy','zh-CN','??????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Title','en-US','Unsubscribe confirm',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Email_Unscribe_Title','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Footer_Copy','en-US','We promise to handle your information in line with our privacy policy.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Footer_Copy','zh-CN','?????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Header_Copy','en-US','Be the first to know',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Header_Copy','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribe_Thank_Copy','en-US','Thanks for confirming your email address!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribe_Thank_Copy','zh-CN','????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribed_Title','en-US','You''ve Been Subscribed',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Subscribed_Title','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Copy','en-US','We have sent you an email to confirm',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Copy','zh-CN','???????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Title','en-US','You''ve Been Unsubscribed',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribed_Title','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Copy','en-US','We will send you an email to confirm',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Copy','zh-CN','?????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Title','en-US','You are unsubscribing',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subscription_Unsubscribing_Title','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('SubscriptionSetting@IsEnable','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Subtotal','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Success','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Summary','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Switch Template','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Switching Theme...','zh-CN','???????????????...',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('sw-resize','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('System','en-GB','System',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('System','en-US','System',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('System','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tab','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabItem@Description','zh-CN','??????','TabItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabItem@Status','zh-CN','??????','TabItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabItem@Title','zh-CN','??????','TabItem','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tablet (???768px)','zh-CN','?????? (???768px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@AssemblyName','zh-CN','Assembly Name','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@IsSystem','zh-CN','Is System','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@IsTemplate','zh-CN','???????????????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@PartialView','zh-CN','????????????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@Position','zh-CN','??????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@ServiceTypeName','zh-CN','Service Type Name','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@StyleClass','zh-CN','???????????????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@TabItems','zh-CN','?????????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@Thumbnail','zh-CN','?????????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@Title','zh-CN','??????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@ViewModelTypeName','zh-CN','View Model Type Name','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@WidgetName','zh-CN','????????????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TabWidget@ZoneID','zh-CN','??????','TabWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tag','en-GB','Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tag','en-US','Tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tag','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tax','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tax Rate','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TaxRate','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Content','zh-CN','????????????','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Id','zh-CN','Id','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@LastUpdateTime','en-US','Last Update Time','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@LastUpdateTime','zh-CN','??????????????????','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Name','en-US','Name','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@Name','zh-CN','??????','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@RelativePath','en-US','Relative Path','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@RelativePath','zh-CN','????????????','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@ThemeName','en-US','Theme Name','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('TemplateFile@ThemeName','zh-CN','??????','TemplateFile','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Test Page','en-GB','Test Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Test Page','en-US','Test Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Test Page','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Blur','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Cursor','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Horizontal','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Shadow','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Title','en-GB','Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Title','en-US','Title',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Title','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Text Vertical','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thank you for sign up','en-GB','Thank you!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thank you for sign up','en-US','Thank you!',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thank you for sign up','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The max length of {0} is {1}','zh-CN','{0}??????????????????{1}',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The order is closed!','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page more than a <h1> tag','zh-CN','????????????<h1>???????????????1???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL.','zh-CN','??????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL. Modifying the page does not affect','en-GB','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL. Modifying the page does not affect','en-US','The page must be published before it can be accessed via the URL. Modifying the page does not affect the released version until the next release.',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page must be published before it can be accessed via the URL. Modifying the page does not affect','zh-CN','?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The page should have a <h1> tag','zh-CN','????????????????????????<h1>??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The parent node does not create a corresponding language','zh-CN','?????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The setting key is already exists','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('The template is being used, could not delete','zh-CN','????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme','en-GB','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme','en-US','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Theme Template','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@ActionType','zh-CN','ActionType','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@CreateBy','zh-CN','CreateBy','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@CreatebyName','zh-CN','CreatebyName','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@CreateDate','zh-CN','CreateDate','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Description','zh-CN','??????','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@ID','zh-CN','ID','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@IsActived','zh-CN','IsActived','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@IsPreView','zh-CN','IsPreView','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@LastUpdateBy','zh-CN','LastUpdateBy','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@LastUpdateByName','zh-CN','LastUpdateByName','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@LastUpdateDate','zh-CN','LastUpdateDate','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Status','zh-CN','??????','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Title','zh-CN','??????','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@Url','zh-CN','Url','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ThemeEntity@UrlDebugger','zh-CN','UrlDebugger','ThemeEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('There is an error value in the condition, save failed!','zh-CN','??????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('There is no messages...','zh-CN','?????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('This is required','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Thumbnail','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Title','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Today','en-GB','Today',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Today','en-US','Today',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Today','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Toggle Container','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Top Article','en-GB','Top Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Top Article','en-US','Top Article',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Top Article','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total Articles:','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total Comments','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Total:','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Tracking number:','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Traid Finished','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translate','en-GB','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translate','en-US','Translate',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translate','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation','en-GB','Translation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation','en-US','Translation',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation Key','en-GB','Key',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation Key','en-US','Key',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation Key','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Translation key is already exists','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Underline','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Underline Overline','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unmarried','en-GB','Unmarried',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unmarried','en-US','Unmarried',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unmarried','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpaid','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpaid order','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpaid orders','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unpublished','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unsubscribe','en-US','Unsubscribe',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Unsubscribe','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Update Index','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Update site index','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload','en-GB','Upload',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload','en-US','Upload',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload failed','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload Section','en-GB','Upload Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload Section','en-US','Upload Section',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Upload Section','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Uppercase','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('URL already exists','zh-CN','Url?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url Redirect','en-GB','Url  Redirect',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url Redirect','en-US','Url  Redirect',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Url Redirect','zh-CN','URL?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@ActionType','zh-CN','ActionType','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateBy','zh-CN','CreateBy','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','en-GB','Create By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','en-US','Create By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreatebyName','zh-CN','?????????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateDate','en-GB','Create Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateDate','en-US','Create Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@CreateDate','zh-CN','????????????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Description','en-GB','Description','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Description','en-US','Description','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Description','zh-CN','??????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@DestinationURL','en-GB','Destination Url',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@DestinationURL','en-US','Destination Url',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@DestinationURL','zh-CN','????????????',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@ID','zh-CN','ID','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@InComingUrl','en-GB','In Coming Url','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@InComingUrl','en-US','In Coming Url','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@InComingUrl','zh-CN','????????????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPattern','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','en-GB','Is Permanent','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','en-US','Is Permanent','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@IsPermanent','zh-CN','?????????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateBy','zh-CN','LastUpdateBy','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','en-GB','Last Update By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','en-US','Last Update By','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateByName','zh-CN','?????????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateDate','en-GB','Last Update Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateDate','en-US','Last Update Date','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@LastUpdateDate','zh-CN','????????????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Status','en-GB','Status','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Status','en-US','Status','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Status','zh-CN','??????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Title','en-GB','Title','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Title','en-US','Title','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UrlRedirect@Title','zh-CN','??????','UrlRedirect','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User','en-GB','User',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User','en-US','User',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('User name password is incorrect','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ActionType','zh-CN','ActionType','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Address','en-GB','Address','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Address','en-US','Address','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Address','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Age','en-GB','Age','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Age','en-US','Age','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Age','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ApiLoginToken','zh-CN','ApiLoginToken','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@AuthenticationType','zh-CN','AuthenticationType','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthday','en-GB','Birthday','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthday','en-US','Birthday','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthday','zh-CN','????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthplace','en-GB','Birthplace','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthplace','en-US','Birthplace','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Birthplace','zh-CN','?????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateBy','zh-CN','CreateBy','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','en-GB','Create By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','en-US','Create By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreatebyName','zh-CN','?????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateDate','en-GB','Create Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateDate','en-US','Create Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@CreateDate','zh-CN','????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Description','en-GB','Description','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Description','en-US','Description','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Description','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Email','en-GB','Email','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Email','en-US','Email','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Email','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@EnglishName','en-GB','English Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@EnglishName','en-US','English Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@EnglishName','zh-CN','?????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@FirstName','en-GB','First Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@FirstName','en-US','First Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@FirstName','zh-CN','???','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Hobby','en-GB','Hobby','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Hobby','en-US','Hobby','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Hobby','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ID','zh-CN','ID','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@IsAuthenticated','zh-CN','IsAuthenticated','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastLoginDate','zh-CN','??????????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastName','en-GB','Last Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastName','en-US','Last Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastName','zh-CN','???','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateBy','zh-CN','LastUpdateBy','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','en-GB','Last Update By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','en-US','Last Update By','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateByName','zh-CN','?????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateDate','en-GB','Last Update Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateDate','en-US','Last Update Date','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LastUpdateDate','zh-CN','????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@LoginIP','zh-CN','LoginIP','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MaritalStatus','en-GB','Marital Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MaritalStatus','en-US','Marital Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MaritalStatus','zh-CN','????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MobilePhone','en-GB','Mobile Phone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MobilePhone','en-US','Mobile Phone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@MobilePhone','zh-CN','????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Name','zh-CN','Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@NickName','en-GB','Nick Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@NickName','en-US','Nick Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@NickName','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWord','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWordNew','en-GB','Pass Word New','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWordNew','en-US','Pass Word New','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PassWordNew','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PhotoUrl','en-GB','Photo Url','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PhotoUrl','en-US','Photo Url','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@PhotoUrl','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Profession','en-GB','Profession','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Profession','en-US','Profession','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Profession','zh-CN','????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@QQ','en-GB','QQ',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@QQ','en-US','QQ',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@QQ','zh-CN','QQ',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ResetToken','zh-CN','ResetToken','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ResetTokenDate','zh-CN','ResetTokenDate','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Roles','en-GB','Roles','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Roles','en-US','Roles','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Roles','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@School','en-GB','School','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@School','en-US','School','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@School','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Sex','en-GB','Sex','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Sex','en-US','Sex','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Sex','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Status','en-GB','Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Status','en-US','Status','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Status','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Telephone','en-GB','Telephone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Telephone','en-US','Telephone','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Telephone','zh-CN','????????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Timestamp','en-GB','Timestamp','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Timestamp','en-US','Timestamp','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Timestamp','zh-CN','Timestamp','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@Title','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserID','en-GB','User','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserID','en-US','User','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserID','zh-CN','?????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserName','en-GB','User Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserName','en-US','User Name','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserName','zh-CN','?????????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserTypeCD','en-GB','User Type',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserTypeCD','en-US','User Type',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@UserTypeCD','zh-CN','????????????',NULL,'EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ZipCode','en-GB','Zip Code','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ZipCode','en-US','Zip Code','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserEntity@ZipCode','zh-CN','??????','UserEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Username','en-GB','Username',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Username','en-US','Username',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Username','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@ActionType','zh-CN','ActionType','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@CreateBy','zh-CN','CreateBy','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@CreatebyName','zh-CN','?????????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@CreateDate','zh-CN','????????????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@Description','zh-CN','??????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@ID','zh-CN','ID','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@LastUpdateBy','zh-CN','LastUpdateBy','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@LastUpdateByName','zh-CN','?????????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@LastUpdateDate','zh-CN','????????????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@RoleID','en-GB','Role','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@RoleID','en-US','Role','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@RoleID','zh-CN','??????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@Status','zh-CN','??????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@Title','zh-CN','??????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('UserRoleRelation@UserID','zh-CN','?????????','UserRoleRelation','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Value','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Version','en-GB','Version',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Version','en-US','Version',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Version','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Versions','en-GB','Versions',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Versions','en-US','Versions',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Versions','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Video','en-GB','Video',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Video','en-US','Video',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Video','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ActionType','zh-CN','ActionType','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@AssemblyName','zh-CN','AssemblyName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Code','zh-CN','????????????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CreateBy','zh-CN','CreateBy','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CreatebyName','zh-CN','CreatebyName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CreateDate','zh-CN','CreateDate','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CustomClass','zh-CN','CustomClass','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@CustomStyle','zh-CN','CustomStyle','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Description','zh-CN','??????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ExtendFields','zh-CN','????????????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@FormView','zh-CN','FormView','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Height','zh-CN','??????(px)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ID','zh-CN','ID','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@IsSystem','zh-CN','IsSystem','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@IsTemplate','zh-CN','???????????????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LastUpdateBy','zh-CN','LastUpdateBy','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LastUpdateByName','zh-CN','LastUpdateByName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LastUpdateDate','zh-CN','LastUpdateDate','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@LayoutID','zh-CN','LayoutID','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@PageID','zh-CN','PageID','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@PartialView','zh-CN','????????????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Position','zh-CN','??????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ServiceTypeName','zh-CN','ServiceTypeName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Status','zh-CN','??????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@StyleClass','zh-CN','???????????????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Thumbnail','zh-CN','?????????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Title','zh-CN','??????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Url','zh-CN','????????????(MP4)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ViewModelTypeName','zh-CN','ViewModelTypeName','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@WidgetName','zh-CN','????????????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@Width','zh-CN','??????(px)','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('VideoWidget@ZoneID','zh-CN','??????','VideoWidget','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View','en-GB','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View','en-US','View',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Article','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Article Category','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Carousel','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Comments','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Commits','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Content','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Content Template','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Content Type','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Detail','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Form','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Form Data','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Layouts','en-GB','View Layouts',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Layouts','en-US','View Layouts',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Layouts','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Log','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Media','zh-CN','???????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Message','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Navigation','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Order','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pages','en-GB','View Pages',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pages','en-US','View Pages',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pages','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pending Page','en-GB','View Pending Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pending Page','en-US','View Pending Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Pending Page','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Product','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Product Category','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Product Tag','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Published Page','en-GB','View Published Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Published Page','en-US','View Published Page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Published Page','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Refund','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Role','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Setting','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Site','en-GB','View Site',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Site','en-US','View Site',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Site','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Subscription','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Template','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Theme','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Transactions','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View URL Redirection','zh-CN','??????URL?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View Users','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View: View the published page','en-GB','View: View the published page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View: View the published page','en-US','View: View the published page',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('View: View the published page','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Visibility','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Visible','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Wait','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Warning','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have prepared a few links for you to get started:','en-GB','We have prepared a few links for you to get started:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have prepared a few links for you to get started:','en-US','We have prepared a few links for you to get started:',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have prepared a few links for you to get started:','zh-CN','??????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('We have sent the change password message to your email','zh-CN','??????????????????????????????????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChat','en-GB','WeChat',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChat','en-US','WeChat',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChat','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Wechat Config','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPay','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPay Setting','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@AppId','zh-CN','AppId',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@AppSecret','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@Certificate','zh-CN','API??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@CertificatePassword','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@IsEnable','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@Key','zh-CN','API??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@MchId','zh-CN','??????ID',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@RsaPublicKey','zh-CN','RSA??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeChatPayOptions@V3Key','zh-CN','APIv3??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo','en-GB','WeiBo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo','en-US','WeiBo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WeiBo Config','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome','en-GB','Welcome',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome','en-US','Welcome',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome to use ZKEACMS','en-GB','Welcome to use ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome to use ZKEACMS','en-US','Welcome to use ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Welcome to use ZKEACMS','zh-CN','????????????ZKEACMS',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Widget Setting','en-GB','Setting',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Widget Setting','en-US','Setting',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Widget Setting','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ActionType','zh-CN','ActionType','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@AssemblyName','zh-CN','AssemblyName','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CreateBy','zh-CN','CreateBy','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CreatebyName','zh-CN','?????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CreateDate','zh-CN','????????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CustomClass','zh-CN','CustomClass','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@CustomStyle','zh-CN','CustomStyle','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Description','zh-CN','??????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ExtendFields','zh-CN','????????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@FormView','zh-CN','FormView','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ID','zh-CN','ID','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@IsSystem','zh-CN','IsSystem','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@IsTemplate','zh-CN','???????????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LastUpdateBy','zh-CN','LastUpdateBy','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LastUpdateByName','zh-CN','?????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LastUpdateDate','zh-CN','????????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@LayoutID','zh-CN','??????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@PageID','zh-CN','??????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@PartDriver','zh-CN','PartDriver','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@PartialView','zh-CN','????????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Position','zh-CN','??????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ServiceTypeName','zh-CN','ServiceTypeName','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Status','zh-CN','??????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@StyleClass','zh-CN','???????????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Thumbnail','zh-CN','?????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@Title','zh-CN','??????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@WidgetName','zh-CN','????????????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetBase@ZoneID','zh-CN','??????','WidgetBase','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetName','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ActionType','zh-CN','ActionType','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@AssemblyName','zh-CN','AssemblyName','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@CreateBy','zh-CN','CreateBy','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@CreatebyName','zh-CN','?????????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@CreateDate','zh-CN','????????????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Description','zh-CN','??????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@FormView','zh-CN','FormView','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@GroupName','zh-CN','??????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ID','zh-CN','ID','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@LastUpdateBy','zh-CN','LastUpdateBy','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@LastUpdateByName','zh-CN','?????????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@LastUpdateDate','zh-CN','????????????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Order','zh-CN','??????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@PartialView','zh-CN','????????????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ServiceTypeName','zh-CN','ServiceTypeName','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Status','zh-CN','??????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@Title','zh-CN','??????','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('WidgetTemplateEntity@ViewModelTypeName','zh-CN','ViewModelTypeName','WidgetTemplateEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Width / Height','zh-CN','??? / ???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Width(px)','zh-CN','???(px)',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Word Spacing','zh-CN','?????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('w-resize','zh-CN','??????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('XS Screen','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Yes','zh-CN','???',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your account has been created successfully','en-GB','Your account has been created successfully',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your account has been created successfully','en-US','Your account has been created successfully',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your account has been created successfully','zh-CN','??????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your basket is empty','zh-CN','????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your email address','en-GB','Your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your email address','en-US','Your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your email address','zh-CN','?????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Your name','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zip Code','en-GB','Zip Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zip Code','en-US','Zip Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zip Code','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zone','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('Zone Name','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@ActionType','zh-CN','ActionType','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@CreateBy','zh-CN','CreateBy','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@CreatebyName','zh-CN','?????????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@CreateDate','zh-CN','????????????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Description','zh-CN','??????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@HeadingCode','zh-CN','HeadingCode','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@ID','zh-CN','ID','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LastUpdateBy','zh-CN','LastUpdateBy','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LastUpdateByName','zh-CN','?????????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LastUpdateDate','zh-CN','????????????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@LayoutId','zh-CN','??????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@PageId','zh-CN','Page','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Status','zh-CN','??????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@Title','zh-CN','??????','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneEntity@ZoneName','zh-CN','ZoneName','ZoneEntity','EntityProperty');
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('ZoneID','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Sign out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Sign out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Save',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Product',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-GB','Sign In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-US','Sign In',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????','en-GB','Please input your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????','en-US','Please input your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Separator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Separator',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Toolbar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Toolbar',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-GB','Gap',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-US','Gap',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-GB','Jumbotron',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-US','Jumbotron',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Please input your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Please input your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????20','en-GB','The length of the password should be less than 20',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????20','en-US','The length of the password should be less than 20',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Code',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????????????????????????????????????????????????????','zh-CN','??????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Notification',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Notification',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('???????????????','en-GB','Please confirm your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('???????????????','en-US','Please confirm your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Layer',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Layer',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Commercial',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Commercial',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????QQ??????','en-GB','Sign in with QQ',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????QQ??????','en-US','Sign in with QQ',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Help',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Help',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Sign in with weibo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Sign in with weibo',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????????????????','en-GB','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????????????????','en-US','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????????????????','en-GB','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????????????????','en-US','The email you entered is not formatted correctly',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Enter your password',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('???????????????????????????????????????','en-GB','Enter your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('???????????????????????????????????????','en-US','Enter your email address',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Document',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Image Caption',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Image Right',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????????????????','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????????????????','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Image Left',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Sign Out',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Tow Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Tow Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Three Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Three Column Text',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-GB','Username is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????????????????','en-US','Username is required',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????50','en-GB','The length of the name should be less than 50',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????50','en-US','The length of the name should be less than 50',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','zh-CN','????????????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????????????????????????????','en-GB','Click category to sort the products',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????????????????????????????','en-US','Click category to sort the products',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????????????????????????????','en-GB','Click product category then add tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????????????????????????????','en-US','Click product category then add tag',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-GB','Header',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-US','Header',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','User Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','User Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????200','en-GB','The length of the email should be less than 200',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????200','en-US','The length of the email should be less than 200',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','zh-CN','MD Screen',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-GB','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????','en-US','Theme',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-GB','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','en-US','Property',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('??????','zh-CN','??????',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Display Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Display Name',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('???????????????','en-GB','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('???????????????','en-US','Style',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-GB','Fluid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('?????????','en-US','Fluid',NULL,NULL);
INSERT INTO [Language] ([LanKey],[CultureName],[LanValue],[Module],[LanType]) VALUES ('????????????????????????????????????????????????????????????????????????????????????','zh-CN','????????????????????????????????????????????????????????????????????????????????????',NULL,NULL);
INSERT INTO [Forms] ([ID],[Title],[FieldsData],[NotificationReceiver],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('5ed56d90ac154e73befa6fbc981ae3ae','????????????','[{"ID":"f05da60a6e3b448fadbf7c5c040a7d5c","Name":"Label","DisplayName":"???????????????????????????","Value":null,"Description":"???????????????ZKEACMS??????????????????????????????","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"41481e6eefa048feae380460b0cd5661","Name":"SingleLine","DisplayName":"??????","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"bfd1418684a64890a7099f764baa24b3","Name":"Number","DisplayName":"??????","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-6","FieldOptions":null,"AdditionalSettings":null},{"ID":"7e635c8fdd124b6b94f037d3bf112bc0","Name":"Email","DisplayName":"????????????","Value":null,"Description":"","Placeholder":"","IsRequired":true,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"4d61bb5f733c47778975cc6cfbc84123","Name":"SingleLine","DisplayName":"QQ","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"b85aeb9beaf64f509726f16ba582ec3c","Name":"SingleLine","DisplayName":"??????","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-4","FieldOptions":null,"AdditionalSettings":null},{"ID":"a2aea72c496e4a458265f7ceadb3653a","Name":"Address","DisplayName":"????????????","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"0932ca1f1f7f4af098d51e4b1ac18b94","Name":"SingleLine","DisplayName":"????????????","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null},{"ID":"572c61930769464d97f3d31771ecf65e","Name":"Radio","DisplayName":"?????????????????????ZKEACMS","Value":null,"Description":"","Placeholder":null,"IsRequired":true,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"????????????","Value":"70a915caf7a84e9086d5dbdf26ed3053"},{"DisplayText":"?????????","Value":"419a7d1d91974282af5c26688fbe0e8c"},{"DisplayText":"????????????","Value":"227f6d2f6b39479aaf2d5b79dbefdc5c"},{"DisplayText":"????????????","Value":"ef50fb3bccf74d6487320e53781fb1ec"}],"AdditionalSettings":null},{"ID":"845830a5c8be4b81866a8cef83049899","Name":"Checkbox","DisplayName":"???????????????ZKEACMS?????????","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"??????","Value":"5f0fbb9faa0343e0958a896fe3cead4f"},{"DisplayText":"??????","Value":"65902e51d35142019c4aab8badff9e35"},{"DisplayText":"??????","Value":"944343b3ed904b94a9db6950dbdcccf3"}],"AdditionalSettings":null},{"ID":"2fe6e4baf01e4cb897986991c920df56","Name":"Dropdown","DisplayName":"?????????ZKEACMS?????????","Value":null,"Description":"","Placeholder":null,"IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":[{"DisplayText":"?????????","Value":"fc3929826e364318b7a3436d991fb097"},{"DisplayText":"?????????","Value":"619e09c2864b41ae81f4f90e7cab92ba"},{"DisplayText":"????????????","Value":"fd1279a07150490f9a1f69c85298e22c"},{"DisplayText":"????????????","Value":"ef19983754504a9482232dd6be01f34d"}],"AdditionalSettings":null},{"ID":"2868de2d8e9b4d269da891342e6dc95b","Name":"Paragraph","DisplayName":"?????????????????????","Value":null,"Description":"","Placeholder":"","IsRequired":false,"Size":4,"Column":"col-md-12","FieldOptions":null,"AdditionalSettings":null}]',NULL,NULL,'',NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:07:58.013');
INSERT INTO [DBVersion] ([ID],[Major],[Minor],[Revision],[Build]) VALUES (1,3,6,0,0);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'RecordStatus','Active','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'RecordStatus','Inactive','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'ArticleCategory','News','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'ArticleCategory','Company News','2',2,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'ArticleCategory','Industry News','3',3,3,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,'UserEntity@Sex','Male','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,'UserEntity@Sex','Female','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (8,'UserEntity@MaritalStatus','Unmarried','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (9,'UserEntity@MaritalStatus','Married','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (11,'UserEntity@UserTypeCD','Administrator','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (12,'ArticleTopWidget@PartialView','Default','Widget.ArticleTops',1,0,1,NULL,'~/images/article/005.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (13,'ArticleListWidget@PartialView','Default','Widget.ArticleList',1,0,1,NULL,'~/images/article/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (14,'ArticleListWidget@PartialView','Banner','Widget.ArticleList-Snippet',2,0,1,NULL,'~/images/article/001.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (15,'ProductListWidget@PartialView','Default','Widget.ProductList',1,0,1,NULL,'~/images/product/003.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (16,'ProductListWidget@Columns','3 Columns','col-xs-12 col-sm-6 col-md-4',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (17,'ProductListWidget@Columns','4 Columns','col-xs-12 col-sm-6 col-md-4 col-lg-3',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (18,'CarouselWidget@PartialView','Default','Widget.Carousel',1,0,1,NULL,'~/images/carousel/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (19,'ArticleSummaryWidget@Style','Default','bs-callout-default',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (20,'ArticleSummaryWidget@Style','Danger','bs-callout-danger',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (21,'ArticleSummaryWidget@Style','Warning','bs-callout-warning',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (22,'ArticleSummaryWidget@Style','Information','bs-callout-info',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (23,'ArticleSummaryWidget@Style','Success','bs-callout-success',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (24,'ArticleSummaryWidget@PartialView','Default','Widget.ArticleSummary',1,0,1,NULL,'~/images/article/012.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (25,'ProductCategoryWidget@PartialView','Default','Widget.ProductCategory',1,0,1,NULL,'~/images/product/000.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (26,'ArticleTypeWidget@PartialView','Default','Widget.ArticleType',1,0,1,NULL,'~/images/article/009.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (27,'UserEntity@UserTypeCD','Customer','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (28,'Order@OrderStatus','Unpaid','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (29,'Order@OrderStatus','Cancel','2',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (30,'Order@OrderStatus','Paid','3',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (31,'Order@OrderStatus','Shipped','4',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (32,'Order@OrderStatus','Traid Finished','5',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (33,'Order@OrderStatus','Refunded','6',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (34,'Order@OrderStatus','Refunding','7',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (35,'ProductListWidget@PartialView','List','Widget.ProductList.A',2,0,1,NULL,'~/images/product/004.png',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (36,'RuleItem@Condition','And','and',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (37,'RuleItem@Condition','Or','or',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (38,'RuleItem@FunctionName','Equals','Equals',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (39,'RuleItem@FunctionName','Not Equals','NotEquals',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (40,'RuleItem@FunctionName','Greater Than','GreaterThan',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (41,'RuleItem@FunctionName','Greater Than Or Equals','GreaterThanOrEquals',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (42,'RuleItem@FunctionName','Less Than','LessThan',5,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (43,'RuleItem@FunctionName','Less Than Or Equals','LessThanOrEquals',6,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (44,'RuleItem@FunctionName','Starts With','StartsWith',7,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (45,'RuleItem@FunctionName','Ends With','EndsWith',8,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (46,'RuleItem@FunctionName','Not Starts With','NotStartsWith',9,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (47,'RuleItem@FunctionName','Not Ends With','NotEndsWith',10,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (48,'RuleItem@FunctionName','Contains','Contains',11,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (49,'RuleItem@FunctionName','Not Contains','NotContains',12,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (50,'RuleItem@FunctionName','In','In',13,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (51,'RuleItem@FunctionName','Not In','NotIn',14,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (52,'RuleItem@Property','Url','ValueOf(''Url'')',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (53,'RuleItem@Property','Query String','ValueOf(''QueryString'')',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (54,'RuleItem@Property','User-Agent','ValueOf(''UserAgent'')',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (55,'RuleItem@Property','Today','ValueOf(''Now'')',4,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (56,'NavigationWidget@PartialView','Default','Widget.Navigation',1,0,1,NULL,'~/images/navigation/000.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (57,'NavigationWidget@PartialView','Style A','Widget.Navigation.A',2,0,1,NULL,'~/images/navigation/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (58,'NavigationWidget@PartialView','Style B','Widget.Navigation.B',3,0,1,NULL,'~/images/navigation/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (59,'NavigationWidget@PartialView','Style C','Widget.Navigation.C',4,0,1,NULL,'~/images/navigation/003.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (60,'NavigationWidget@PartialView','Style D','Widget.Navigation.D',5,0,1,NULL,'~/images/navigation/004.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (61,'NavigationWidget@PartialView','Style E','Widget.Navigation.E',6,0,1,NULL,'~/images/navigation/005.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (62,'NavigationWidget@PartialView','Style F','Widget.Navigation.F',7,0,1,NULL,'~/images/navigation/006.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (63,'NavigationWidget@PartialView','Style G','Widget.Navigation.G',8,0,1,NULL,'~/images/navigation/007.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (64,'ArticleListWidget@PartialView','Style A','Widget.ArticleList.A',3,0,1,NULL,'~/images/article/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (65,'ArticleListWidget@PartialView','Style B','Widget.ArticleList.B',4,0,1,NULL,'~/images/article/003.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (66,'ArticleListWidget@PartialView','Style C','Widget.ArticleList.C',5,0,1,NULL,'~/images/article/004.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (67,'ArticleTopWidget@PartialView','Style A','Widget.ArticleTops.A',2,0,1,NULL,'~/images/article/006.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (68,'ArticleTopWidget@PartialView','Style B','Widget.ArticleTops.B',3,0,1,NULL,'~/images/article/007.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (69,'ArticleTopWidget@PartialView','Style C','Widget.ArticleTops.C',4,0,1,NULL,'~/images/article/008.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (70,'ArticleTypeWidget@PartialView','Style A','Widget.ArticleType.A',2,0,1,NULL,'~/images/article/010.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (71,'ArticleTypeWidget@PartialView','Style B','Widget.ArticleType.B',3,0,1,NULL,'~/images/article/011.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (72,'ArticleSummaryWidget@PartialView','Style A','Widget.ArticleSummary.A',2,0,1,NULL,'~/images/article/013.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (73,'ArticleSummaryWidget@PartialView','Style B','Widget.ArticleSummary.B',3,0,1,NULL,'~/images/article/014.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (74,'ArticleSummaryWidget@PartialView','Style C','Widget.ArticleSummary.C',4,0,1,NULL,'~/images/article/015.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (75,'ProductCategoryWidget@PartialView','Style A','Widget.ProductCategory.A',2,0,1,NULL,'~/images/product/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (76,'ProductCategoryWidget@PartialView','Style B','Widget.ProductCategory.B',3,0,1,NULL,'~/images/product/002.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (77,'CarouselWidget@PartialView','Style A','Widget.Carousel.A',2,0,1,NULL,'~/images/carousel/001.png','',0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (78,'StaticPageSetting@CacheProvider','Memory Cache','MemoryCache',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (79,'StaticPageSetting@CacheProvider','Database Cache','Database',2,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (80,'StaticPageSetting@CacheProvider','File Cache','File',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (81,'CultureSetting@CultureMode','Single domain','1',1,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataDictionary] ([ID],[DicName],[Title],[DicValue],[Order],[Pid],[IsSystem],[ImageUrl],[ImageThumbUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (82,'CultureSetting@CultureMode','Standalone domain','2',3,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Alipay.AopSdk.AspnetCore.AlipayOptions','{"AppId":null,"Uid":null,"Gatewayurl":null,"PrivateKey":null,"AlipayPublicKey":null,"SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,NULL,NULL,'2019-04-24 19:55:03.627',NULL,NULL,'2019-04-24 19:55:03.627');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Currency.CurrencyOption','{"CurrencyID":4,"Name":"Chinese Renmenbi","Code":"CNY","Symbol":"???"}',NULL,NULL,NULL,'admin','ZKEASOFT','2021-03-06 22:16:39.503','admin','ZKEASOFT','2021-03-06 22:16:43.467');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.LiveChatScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:35.293',NULL,NULL,'2019-04-07 16:38:35.293');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.GlobalScripts.Models.StatisticsScript','{"Location":0,"Script":null}',NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:38:36.007',NULL,NULL,'2019-04-07 16:38:36.007');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Message.Models.MessageNotificationConfig','{"MessageNotifyEmails":null,"CommentNotifyEmails":null}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-08-15 15:25:53.917','admin','ZKEASOFT','2018-08-15 15:25:53.917');
INSERT INTO [DataArchived] ([ID],[Data],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ZKEACMS.Shop.AliPayConfigOptions','{"AppId":"2016082000296332","Uid":"2088102172250345","Gatewayurl":"https://openapi.alipaydev.com/gateway.do","PrivateKey":"MIIEowIBAAKCAQEAtlGrLGZsH3qj0UFh8p/P5X89l780lHoc26ulyPUMD2mkVS3ZyBl71lSdjqtf/TTqA3+zFIPlv3DRZIF7IiUEm2cU+x2E6huUTUr1ELO+Xyvs+3goIVCn9zCijMklRl3yrR9e136qIX81FmD33BJHk3y9qLLS/wa362kXraCMkhI7R+neHE9SPZyo0xYnmGX8z69dRBQnbuWDhMGb3tWM2EvLpVCg4AoaHLozW1ZMG5e4+qYrOQ81tUl1/oWQB4znd63k9SHAHLNc9KPllws+WKYKWwL9kbwk3OuOWX9T5NZTjU/gC8iVWbgzN9kLWg8UwBD0p0oJukXoZl7HJ1D9SwIDAQABAoIBAQCzobWwcl2XimL7WpshzRmtuXc7GvW4ULQ8L1uRqvat/N0f26QWhh1AaHAwUGOr+8WRmvEbhnUH8SUuDHEAjE6EusSuQkBh1LiCixb31ND9vi6o+ZM4d9p2L2IIqmpicVAYCK+OTMtdY5MvsGylVRFWnHHVVBOVl84AULQ2qte1Vj0DPfExhGEC/Esn6w68nFrKgmnvPEhCX864uMlkhdxrbuRr0FqSjbr7ApNAsreu248IFO8w8Bu8hReDdLm/tD/wXvDLj28NM3XHj7y6OEjmToNP/D2pCK0qLlhBlF+FDMWhTFnreNRsVR7a7msEANPjikxWERJI0Pl0tqcOPXo5AoGBAOKhGX4ym7OSNB8GZGYGHiR2tOU14xdJUkPrQa8XJTcW2Lrh4DjEbu1o9gNUmniU92mnXVFwX/bQrB5zRwcWucK0mSBGkcrIt+f2GrtGkeVr5UpW+uqjvPzvpLUn1hO5jnIVhZLc7+dQGY822bN3VyZJrkHUV/AQHj6waICEY7BdAoGBAM3ye6gheERozivEBNcayE0qdu3EQicSVadR8rNQw8spudOlWTRCQIyNVcOEbq5X4+Uzm3n4pLqTNaeosU1ayI84w38o/0A8uEGzKIKunzqZ2tnIqr55XSscbA4B0UXvmJsVZ3NX3pFWRQgIAHky3zq0alW7q/XrhtMnfyPHpCnHAoGARG14EQ6ezJ18d1GqxtNaDpB5FiwrIUDWQgOqlX9bkUKoteS1mu5UwAJNJbxJ19bCzXfnSUuw7gkbryYHcDCAbjWxdnlYU+4++R7p+1nXe3oUhVm18Vr3GTgSd1BL5zDDvdaZujpThXg9/2wEV5fVDI56uw2ub6GuQCdrpkJTB1ECgYA4A6jQbPIKITtaOgFbBCTQoCkiuEuJ1vnG/Yn2bZQjUOEDCKj/hrmJwPM/r2hvMOaCM4wpG5CqUlm4lTBMKtH76mN51Yu/TASNkg4FpTsXtDsLGwIdtmK51AwrryDdVbJ7E9JEU/TsMLur2IlQbZ67l9CIKvg1de8AxXBWKfmjhwKBgBQYQf3m0Ouiyz0iWxDEpbxZNaAaAM9mB+lI7dnJnmXU7uk9ysWd5Xg+YY+3tqqXVR/GVlXsPNJpqQDgrkG5GTqrt+YjA5tT+wuu0PMQICIhsVuYGBjtZcQqq564JM2OoMALpVUvulOiT3U3QUQ2bSgjlYFccSBkH6gjhFncFVJP","AlipayPublicKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4gYZ2vzwi6QcwE6L/fDPqNI7ZFIBxnV2DJVsLW57dr2XZ6QihsGrU7i32kpDshFTS1d5l+rMzfDOxudkNlbQgGkdw7Yu/BENNpOWf/pAz9iz0EMQHxOFapXklEls17fPKksQf1cfGweVJ64wQVPr2c386CA3ckMFxGyAdl+UfIUH3rVhzmo2d0xRe2Gp3eJLXB1LiDPDDWKy3MkJwos6VWF/+hO9Wsx/paNCvfwCKKlaAF2yeEU6MEG+XTDpIQUNyMnF9PYWh98lxfSWoOC2NbZRm/7TBFPvzjWDtkTJLW7N3etOTAz1VL6vmg2CCG6OpX/zs8fJ9RJeCHexAaozGwIDAQAB","SignType":"RSA2","CharSet":"UTF-8","IsKeyFromFile":false}',NULL,NULL,NULL,'admin','ZKEASOFT','2018-04-11 17:02:14.577','admin','ZKEASOFT','2018-04-11 17:02:14.577');
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'Australian Dollar',NULL,'AUD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'Brazilian Real',NULL,'BRL','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'Canadian Dollar',NULL,'CAD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (4,'Chinese Renmenbi',NULL,'CNY','???',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (5,'Czech Koruna',NULL,'CZK','K??',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (6,'Danish Krone',NULL,'DKK','kr',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (7,'Euro',NULL,'EUR','???',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (8,'Hong Kong Dollar',NULL,'HKD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (9,'Hungarian Forint',NULL,'HUF','HUF',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (10,'Indian Rupee',NULL,'INR','INR',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (11,'Israeli New Shekel',NULL,'ILS','???',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (12,'Japanese Yen',NULL,'JPY','???',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (13,'Malaysian Ringgit',NULL,'MYR','MYR',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (14,'Mexican Peso',NULL,'MXN','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (15,'New Taiwan Dollar',NULL,'TWD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (16,'New Zealand Dollar',NULL,'NZD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (17,'Norwegian Krone',NULL,'NOK','NOK',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (18,'Philippine Peso',NULL,'PHP','PHP',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (19,'Polish Zloty',NULL,'PLN','z??',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (20,'Pound Sterling',NULL,'GBP','??',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (21,'Russian Ruble',NULL,'RUB','RUB',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (22,'Singapore Dollar',NULL,'SGD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (23,'Swedish Krona',NULL,'SEK','SEK',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (24,'Swiss Franc',NULL,'CHF','CHF',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (25,'Thai Baht',NULL,'THB','???',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [Currency] ([ID],[Title],[Description],[Code],[Symbol],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (26,'United States Dollar',NULL,'USD','$',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('00f62c5acfe840e0bee3ca2979f0f025','?????????',NULL,9,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:13:55.010','admin','ZKEASOFT','2016-06-29 14:13:22.937',NULL,NULL,1,'~/images/template%20(6).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('01b59004dd1e4f68afa98c9c80d86f4c','??????',NULL,1,NULL,'be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 17:59:05.133','admin','ZKEASOFT','2017-10-15 18:20:39.980',NULL,NULL,0,NULL,0,'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('02dd343bb4f24322bcf3daf8ada7565d','?????????',NULL,2,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:31.030','admin','ZKEASOFT','2017-03-19 21:05:31.030',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{"ID":"02dd343bb4f24322bcf3daf8ada7565d","WidgetName":"?????????","Position":2,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":[],"Title":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:44.953","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:44.953","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('062018a8e5cf48b4a0d90296e7f4e965','?????????',NULL,2,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-11 10:01:58.757','admin','ZKEASOFT','2016-03-11 10:01:58.757',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('09617f6142934daaadee6cfb9df6d66f','??????',NULL,4,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:53:07.263','admin','ZKEASOFT','2016-03-24 10:49:44.100',NULL,NULL,1,'~/images/template%20(2).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('0f66ab8ff0df44e2b5e57fd8d8c5d8ff','????????????',NULL,8,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:23:51.277','admin','ZKEASOFT','2016-06-29 14:12:54.387',NULL,NULL,1,'~/images/template (15).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('1433264e95f545ab97e6a481fa3747ea','?????????',NULL,2,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:36.467','admin','ZKEASOFT','2017-12-03 17:11:36.467',NULL,NULL,0,NULL,0,'{"CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('155c6511dd9c4cc1b3ccb27d5ad4b8ab','??????',NULL,1,NULL,'9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','Widget.Form','ZKEACMS.FormGenerator','ZKEACMS.FormGenerator.Service.FormWidgetService','ZKEACMS.FormGenerator.Models.FormWidget',NULL,'','admin','ZKEASOFT','2017-10-15 18:20:42.213','admin','ZKEASOFT','2017-10-15 18:20:42.213',NULL,NULL,0,NULL,0,'{"FormID":"5ed56d90ac154e73befa6fbc981ae3ae","CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('19350341920b4827bf2a4e458ad24a58','?????????',NULL,1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,'','admin','ZKEASOFT','2016-03-27 15:14:34.677','admin','ZKEASOFT','2020-03-21 14:01:56.237',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('1fb967867e3b440e86336bc5a51e8719','??????????????????',NULL,17,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:40:26.767','admin','ZKEASOFT','2016-06-29 14:19:30.777',NULL,NULL,1,'~/images/template%20(12).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('2b3eb61307d24c50a6b3aaa75db3810e','?????????',NULL,11,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:06:17.637','admin','ZKEASOFT','2016-06-29 14:14:54.330',NULL,NULL,1,'~/images/template%20(5).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('2b510992f0174e668ca53116434e065c','??????',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:15:37.333','admin','ZKEASOFT','2017-10-15 18:00:21.587',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3017aef0eabc451b81daebe6bae68857','??????',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.950','admin','ZKEASOFT','2017-10-15 18:11:44.950',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('34567e55bacd40dbaf9794d5032dd26e','?????????',NULL,4,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.977','admin','ZKEASOFT','2017-03-19 21:05:30.977',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":"admin","CreatebyName":"ZKEASOFT","CreateDate":"2017-03-19T21:04:56.38","LastUpdateBy":"admin","LastUpdateByName":"ZKEASOFT","LastUpdateDate":"2017-03-19T21:04:56.38","ActionType":1,"ID":"34567e55bacd40dbaf9794d5032dd26e","WidgetName":"?????????","Position":4,"LayoutID":null,"PageID":"534e07f396b14b7584a833d270356cb7","ZoneID":"d5f02570e4814439acc86a1874cb8f07","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":[],"Title":null}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3466e616139645d2b1e1d9935d231922','????????????','????????????',1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.877','admin','ZKEASOFT','2016-05-15 20:56:40.877',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('357a58069e8047a289e10b920061d57d','?????????',NULL,3,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.900','admin','ZKEASOFT','2017-03-19 21:05:30.900',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3aa8b53e7ad143ff818855a7abcb3fdd','????????????',NULL,1,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.290','admin','ZKEASOFT','2017-12-03 17:11:47.290',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3b8beb945c9f4c9390a6122d8b4788d5','?????????',NULL,2,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.347','admin','ZKEASOFT','2017-10-15 18:11:45.347',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('3e3783f4b7ca421488f2bf08d32fe2f0','?????????',NULL,2,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.850','admin','ZKEASOFT','2016-05-15 20:56:40.850',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('416c5402962b41548c83fabaa5492b42','????????????',NULL,1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:20:31.667','admin','ZKEASOFT','2016-03-11 11:51:20.640',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('41e075ab1b89453388494a539eec55b9','?????????',NULL,1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.Carousel','ZKEACMS','ZKEACMS.Common.Service.CarouselWidgetService','ZKEACMS.Common.Models.CarouselWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.633','admin','ZKEASOFT','2017-10-15 18:11:36.633',NULL,NULL,0,'~/images/Widget.Carousel.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('43bb869688ee4752a3127dd19ccc6caa','??????',NULL,1,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:20.407','admin','ZKEASOFT','2017-03-19 21:04:29.773',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('481574ebc98b4cdf9a07e3f20c1ab78d','??????????????????',NULL,12,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:48.870','admin','ZKEASOFT','2016-06-29 14:15:23.317',NULL,NULL,1,'~/images/template%20(7).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('4d67b2d10f4a425586e3b1115f7f7072','?????????',NULL,3,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:15.683','admin','ZKEASOFT','2017-03-19 21:05:15.683',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('50f810582d28440eb3bdff9ee5b1ef24','?????????????????????',NULL,13,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:36:23.247','admin','ZKEASOFT','2016-06-29 14:16:05.733',NULL,NULL,1,'~/images/template (17).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('55b73e54fd054de4847960bdac350c6d','??????????????????',NULL,15,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','align-center image-circle','admin','ZKEASOFT','2016-03-09 14:33:40.533','admin','ZKEASOFT','2016-06-29 14:17:49.737',NULL,NULL,1,'~/images/template%20(10).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('56991d0ff59d4c1db27aff3a50fcb382','??????',NULL,2,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:51:35.577','admin','ZKEASOFT','2016-06-29 14:10:19.703',NULL,NULL,1,'~/images/template%20(1).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('604b2461f7c545e28dbb21fb15def5c7','????????????','????????????',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:13:42.000','admin','ZKEASOFT','2017-10-15 17:18:36.063',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('62ca3b6b6ea644b4a64501021b02f13b','?????????',NULL,2,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:16:08.137','admin','ZKEASOFT','2017-10-15 18:00:21.613',NULL,NULL,0,'~/images/Widget.HTML.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('6bb06e46293c46f084e83751a0832d36','????????????',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.867','admin','ZKEASOFT','2016-05-15 20:56:40.867',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('6ee67036e78b4b498d932ab2d76757fb','??????',NULL,1,NULL,NULL,'ZONE-0','Widget.Navigation','ZKEACMS','ZKEACMS.Common.Service.NavigationWidgetService','ZKEACMS.Common.Models.NavigationWidget',NULL,'full','admin','ZKEASOFT','2018-05-21 23:44:21.393','admin','ZKEASOFT','2020-03-21 13:44:19.637',NULL,NULL,0,NULL,0,NULL,1);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7679a5060035444d85fe49dc3c02cada','??????',NULL,1,NULL,'534e07f396b14b7584a833d270356cb7','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.853','admin','ZKEASOFT','2017-03-19 21:05:30.853',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('787d9ad849dd40d0905f22ae072d8507','????????????',NULL,1,NULL,'a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:19.903','admin','ZKEASOFT','2016-03-10 23:20:19.903',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7e7a1d5b8d644333a7b3341509fc960f','????????????','????????????',2,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.773','admin','ZKEASOFT','2017-10-15 18:11:36.773',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('7f77f09c3fcd4d498a4aa3b1c9508d7d','????????????','????????????',2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 17:03:14.000','admin','ZKEASOFT','2017-10-15 17:04:42.893',NULL,NULL,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('80f365c7991a49a0b04aa11006018814','????????????','????????????',1,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin',NULL,'2015-09-01 10:09:22.000','admin','ZKEASOFT','2017-10-15 17:03:50.207',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('88ab49212dee47bba878a52bec86f501','????????????','????????????',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-3','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.793','admin','ZKEASOFT','2017-10-15 18:11:36.793',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8c5b69f614b641c0a5f7a8e318de8df3','ZKEACMS ??????',NULL,2,NULL,'0880a4dfdc184ff99b88c88325716d1b','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin',NULL,'2015-09-01 09:54:38.000','admin','ZKEASOFT','2020-03-21 13:47:22.757',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8cc061c2e2514ef9b85bbecdec3f84ab','?????????',NULL,5,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 13:55:12.377','admin','ZKEASOFT','2016-03-09 13:55:12.377',NULL,NULL,1,'~/images/template%20(3).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8df64186d2fd4d63a9f9bb3b6e34cd2a','????????????','????????????',1,NULL,'e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:21:20.527','admin','ZKEASOFT','2016-05-15 21:04:35.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('8ea46d2923ad4d62958c565b19bb172d','??????',NULL,1,NULL,'068c85b8de8744e7a81b1d1010583308','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.857','admin','ZKEASOFT','2016-05-15 20:56:40.857',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('942b4ac54f3e4dfca006172bf4122da4','?????????',NULL,4,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.Message','ZKEACMS.Message','ZKEACMS.Message.Service.MessageWidgetService','ZKEACMS.Message.Models.MessageWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:56.380','admin','ZKEASOFT','2017-03-19 21:04:56.380',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Message.png',0,'{"FormView":null,"ExtendData":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1,"ID":"942b4ac54f3e4dfca006172bf4122da4","WidgetName":"?????????","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"3ca302874c164b7b9691ca948300417b","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.Message","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageWidget","StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendFields":null,"Title":null}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('94624262dc00460cbbc1e0f51711e712','????????????',NULL,1,NULL,'4b889b430aa44517bbad38a57c745cc5','ZONE-1','Widget.ProductDetail','ZKEACMS.Product','ZKEACMS.Product.Service.ProductDetailWidgetService','ZKEACMS.Product.Models.ProductDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.783','admin','ZKEASOFT','2016-03-10 23:24:38.783',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('a64ad266b3bd4e0eb4e2df09b550fe55','?????????',NULL,2,NULL,'1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','Widget.MessageBox','ZKEACMS.Message','ZKEACMS.Message.Service.MessageBoxWidgetService','ZKEACMS.Message.Models.MessageBoxWidget',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:04:44.953','admin','ZKEASOFT','2017-03-19 21:04:44.953',NULL,NULL,0,'~/Plugins/ZKEACMS.Message/Content/Image/Widget.MessageBox.png',0,'{"ID":"a64ad266b3bd4e0eb4e2df09b550fe55","WidgetName":"?????????","Position":1,"LayoutID":null,"PageID":"1c93b61690ce49d7af8e1ea45ac58eb9","ZoneID":"4cf5d05f2b954a7e8904713ad6781a61","IsTemplate":false,"Thumbnail":null,"IsSystem":false,"PartialView":"Widget.MessageBox","AssemblyName":"Easy.CMS.Message","ServiceTypeName":"Easy.CMS.Message.Service.MessageBoxWidgetService","ViewModelTypeName":"Easy.CMS.Message.Models.MessageBoxWidget","FormView":null,"StyleClass":null,"CustomClass":"","CustomStyle":"","ExtendData":null,"ExtendFields":null,"Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('a686b84212f94b3b8315093b2e8b883d','????????????',NULL,NULL,NULL,NULL,'ZONE-X','Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,'footer','admin','ZKEASOFT','2018-05-21 23:44:55.063','admin','ZKEASOFT','2018-05-21 23:44:55.063',NULL,NULL,0,NULL,0,NULL,2);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('b568ff7f4a894870adaf9afadf787bf9','?????????',NULL,14,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:20:29.887','admin','ZKEASOFT','2016-06-29 14:16:58.140',NULL,NULL,1,'~/images/template%20(9).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('bb7dab4f077745ef8b5b425eaabb423c','??????',NULL,1,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:28:47.827','admin','ZKEASOFT','2016-06-29 14:09:41.597',NULL,NULL,1,'~/images/template (16).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('c71d1f1c48944d6a9e232b6813261e04','?????????',NULL,2,NULL,'c5b97a044c9844529fc48383d141e73c','ZONE-1','Widget.Comments','ZKEACMS.Message','ZKEACMS.Message.Service.CommentsWidgetService','ZKEACMS.Message.Models.CommentsWidget',NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.253','admin','ZKEASOFT','2017-12-03 17:11:47.253',NULL,NULL,0,NULL,0,'{"CustomClass":"","CustomStyle":"","ActionType":1}',NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ca9f8809636d448cbd4f3beb418465b3','????????????',NULL,1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','Widget.ArticleList','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleListWidgetService','ZKEACMS.Article.Models.ArticleListWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.317','admin','ZKEASOFT','2017-10-15 18:11:45.317',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('cd21a7bf68b44f6e8d178b153288a26e','ZKEACMS ??????',NULL,3,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-1','Widget.ArticleSummary','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleSummaryWidgetService','ZKEACMS.Article.Models.ArticleSummaryWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.807','admin','ZKEASOFT','2017-10-15 18:11:36.807',NULL,0,0,NULL,0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('de8d94fd51cb4e73b00518dbb2f134d3','????????????','????????????',1,NULL,'d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','Widget.ArticleType','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleTypeWidgetService','ZKEACMS.Article.Models.ArticleTypeWidget',NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:45.367','admin','ZKEASOFT','2017-10-15 18:11:45.367',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleType.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e0783dbbcc564322a1f2e3ca2833dbd4','????????????','????????????',1,NULL,'50fa3579e7434555a22f095dcb4ea35e','ZONE-2','Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.733','admin','ZKEASOFT','2017-10-15 18:11:36.733',NULL,0,0,'~/images/Widget.Section.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e5ba6adb117440959757b98e4289430f','??????',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-1','Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:31:24.887','admin','ZKEASOFT','2016-03-27 15:16:41.790',NULL,NULL,0,'~/images/Widget.Image.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e88916cc41b3465b9ae954bafac5f796','????????????',NULL,1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-2','Widget.ProductList','ZKEACMS.Product','ZKEACMS.Product.Service.ProductListWidgetService','ZKEACMS.Product.Models.ProductListWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:21.907','admin','ZKEASOFT','2016-03-10 23:31:03.770',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('e8fd1019bab045e5927ec30abaaa1aba','????????????',NULL,1,NULL,'a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','Widget.ArticleDetail','ZKEACMS.Article','ZKEACMS.Article.Service.ArticleDetailWidgetService','ZKEACMS.Article.Models.ArticleDetailWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:12.857','admin','ZKEASOFT','2016-03-10 21:24:12.857',NULL,NULL,0,'~/Plugins/ZKEACMS.Article/Content/Image/Widget.ArticleDetail.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('eb7657f5bcbd4e98977a42950936e7ac','????????????','????????????',1,NULL,'9d84599edb2443439a53e8d906815c8f','ZONE-3','Widget.ProductCategory','ZKEACMS.Product','ZKEACMS.Product.Service.ProductCategoryWidgetService','ZKEACMS.Product.Models.ProductCategoryWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:28:35.323','admin','ZKEASOFT','2016-05-15 20:56:37.497',NULL,NULL,0,'~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png',0,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('ed837392097f4e60b812bc57111dd762','?????????',NULL,16,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 14:36:24.463','admin','ZKEASOFT','2016-06-29 14:18:22.983',NULL,NULL,1,'~/images/template%20(11).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f41174cfa4d247f4974c47f4d2b000fd','????????????',NULL,7,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm',NULL,'admin','ZKEASOFT','2016-03-09 21:21:37.693','admin','ZKEASOFT','2016-06-29 14:11:06.067',NULL,NULL,1,'~/images/template (14).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f6de0d62d3974ee2bf2ded3fbbc82c2b','??????',NULL,6,NULL,NULL,NULL,'Widget.HTML','ZKEACMS','ZKEACMS.Common.Service.HtmlWidgetService','ZKEACMS.Common.Models.HtmlWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 14:00:46.400','admin','ZKEASOFT','2016-03-09 14:08:21.673',NULL,NULL,1,'~/images/template%20(4).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('f6f11ba2fec844de883acf0a1fe3eb89','??????????????????',NULL,10,NULL,NULL,NULL,'Widget.Section','ZKEACMS.SectionWidget','ZKEACMS.SectionWidget.Service.SectionWidgetService','ZKEACMS.SectionWidget.Models.SectionWidget','SectionWidgetForm','image-circle','admin','ZKEASOFT','2016-03-09 14:15:44.227','admin','ZKEASOFT','2016-06-29 14:13:44.223',NULL,NULL,1,'~/images/template%20(8).png',1,NULL,NULL);
INSERT INTO [CMS_WidgetBase] ([ID],[WidgetName],[Title],[Position],[LayoutId],[PageId],[ZoneId],[PartialView],[AssemblyName],[ServiceTypeName],[ViewModelTypeName],[FormView],[StyleClass],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[IsTemplate],[Thumbnail],[IsSystem],[ExtendData],[RuleID]) VALUES ('fee7f4d7d7e641b0bfa74491a543d245','??????',NULL,3,NULL,NULL,NULL,'Widget.Image','ZKEACMS','ZKEACMS.Common.Service.ImageWidgetService','ZKEACMS.Common.Models.ImageWidget',NULL,NULL,'admin','ZKEASOFT','2016-03-09 21:14:46.133','admin','ZKEASOFT','2016-03-09 21:14:46.133',NULL,NULL,1,'~/images/template (13).png',1,NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('00f62c5acfe840e0bee3ca2979f0f025',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('0f66ab8ff0df44e2b5e57fd8d8c5d8ff',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('1fb967867e3b440e86336bc5a51e8719',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('2b3eb61307d24c50a6b3aaa75db3810e',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('481574ebc98b4cdf9a07e3f20c1ab78d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('55b73e54fd054de4847960bdac350c6d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('604b2461f7c545e28dbb21fb15def5c7','????????????',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('7e7a1d5b8d644333a7b3341509fc960f',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('7f77f09c3fcd4d498a4aa3b1c9508d7d',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('80f365c7991a49a0b04aa11006018814','??????',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('88ab49212dee47bba878a52bec86f501','??????',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('b568ff7f4a894870adaf9afadf787bf9',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('e0783dbbcc564322a1f2e3ca2833dbd4','????????????',NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('ed837392097f4e60b812bc57111dd762',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('f41174cfa4d247f4974c47f4d2b000fd',NULL,NULL);
INSERT INTO [SectionWidget] ([ID],[SectionTitle],[IsHorizontal]) VALUES ('f6f11ba2fec844de883acf0a1fe3eb89',NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('0015be62210742c083c3a9dad4b72fb5','???1','e0783dbbcc564322a1f2e3ca2833dbd4','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.740','admin','ZKEASOFT','2017-10-15 18:11:36.740',NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('1','???1','80f365c7991a49a0b04aa11006018814','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('10','???','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('11','???','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('12','???','55b73e54fd054de4847960bdac350c6d','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('13','???','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('14','???','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('15','???','ed837392097f4e60b812bc57111dd762','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('16','???','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('17','???','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('18','???','1fb967867e3b440e86336bc5a51e8719','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('2','???1','604b2461f7c545e28dbb21fb15def5c7','SectionTemplate.Default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('40','???','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('41','???','f41174cfa4d247f4974c47f4d2b000fd','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('42','???','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('43','???','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',3,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('44','???','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','SectionTemplate.Default',2,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-4');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('5','G1','2b3eb61307d24c50a6b3aaa75db3810e','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('50082fd30e01404fbb4fe6101353b1d5','???1','88ab49212dee47bba878a52bec86f501','SectionTemplate.Default',0,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800',NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('6','G1','00f62c5acfe840e0bee3ca2979f0f025','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('7','G1','f6f11ba2fec844de883acf0a1fe3eb89','SectionTemplate.ImageRight',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('8','G1','481574ebc98b4cdf9a07e3f20c1ab78d','SectionTemplate.ListView',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('80cb176412cf457a81ae7a1f9fa33ef6','???1','7f77f09c3fcd4d498a4aa3b1c9508d7d','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 17:03:17.247','admin','ZKEASOFT','2017-10-15 17:03:17.247','');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('9','???','b568ff7f4a894870adaf9afadf787bf9','SectionTemplate.Default',1,NULL,NULL,NULL,NULL,NULL,NULL,'col-sm-6');
INSERT INTO [SectionGroup] ([ID],[GroupName],[SectionWidgetId],[PartialView],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[PercentWidth]) VALUES ('9ce2c15af93c4fd782e17a1e7e35963f','???1','7e7a1d5b8d644333a7b3341509fc960f','SectionTemplate.Default',1,'admin','ZKEASOFT','2017-10-15 18:11:36.780','admin','ZKEASOFT','2017-10-15 18:11:36.780','');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('083536d64b2f4840aa548e7117eb5c8d','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,7,'admin','ZKEASOFT','2017-10-15 18:11:36.767','admin','ZKEASOFT','2017-10-15 18:11:36.767');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('08f659a819194f7ca0a41b668a2dee13','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.800','admin','ZKEASOFT','2017-10-15 18:11:36.800');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1','80f365c7991a49a0b04aa11006018814','1',1,2,'admin',NULL,'2015-09-01 10:09:51.457','admin',NULL,'2015-09-01 10:12:05.037');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('105','f41174cfa4d247f4974c47f4d2b000fd','40',4,1,'admin','ZKEASOFT','2016-03-09 21:22:05.273','admin','ZKEASOFT','2016-03-09 21:22:05.273');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('106','f41174cfa4d247f4974c47f4d2b000fd','40',3,2,'admin','ZKEASOFT','2016-03-09 21:22:14.723','admin','ZKEASOFT','2016-03-09 21:22:14.723');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('107','f41174cfa4d247f4974c47f4d2b000fd','41',4,1,'admin','ZKEASOFT','2016-03-09 21:22:39.543','admin','ZKEASOFT','2016-03-09 21:22:39.543');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('108','f41174cfa4d247f4974c47f4d2b000fd','41',3,2,'admin','ZKEASOFT','2016-03-09 21:22:46.500','admin','ZKEASOFT','2016-03-09 21:22:46.500');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('109','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.287','admin','ZKEASOFT','2016-03-09 21:23:51.287');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('110','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','42',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.290','admin','ZKEASOFT','2016-03-09 21:23:51.290');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('111','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',4,1,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('112','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','43',3,2,'admin','ZKEASOFT','2016-03-09 21:23:51.293','admin','ZKEASOFT','2016-03-09 21:23:51.293');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('113','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',4,1,'admin','ZKEASOFT','2016-03-09 21:24:36.340','admin','ZKEASOFT','2016-03-09 21:24:36.340');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('114','0f66ab8ff0df44e2b5e57fd8d8c5d8ff','44',3,2,'admin','ZKEASOFT','2016-03-09 21:24:43.533','admin','ZKEASOFT','2016-03-09 21:24:43.533');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('11fb7122ccd24686876238c6138aead2','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,5,'admin','ZKEASOFT','2017-10-15 18:11:36.760','admin','ZKEASOFT','2017-10-15 18:11:36.760');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('13','2b3eb61307d24c50a6b3aaa75db3810e','5',2,1,'admin','ZKEASOFT','2016-03-09 14:07:06.270','admin','ZKEASOFT','2016-03-09 14:07:06.270');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('14','2b3eb61307d24c50a6b3aaa75db3810e','5',4,2,'admin','ZKEASOFT','2016-03-09 14:07:14.397','admin','ZKEASOFT','2016-03-09 14:07:14.397');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('15','2b3eb61307d24c50a6b3aaa75db3810e','5',3,3,'admin','ZKEASOFT','2016-03-09 14:07:22.330','admin','ZKEASOFT','2016-03-09 14:07:22.330');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('16','00f62c5acfe840e0bee3ca2979f0f025','6',2,1,'admin','ZKEASOFT','2016-03-09 14:14:25.737','admin','ZKEASOFT','2016-03-09 14:14:25.737');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('163','604b2461f7c545e28dbb21fb15def5c7','2',1,4,'admin','ZKEASOFT','2017-03-19 20:58:41.647','admin','ZKEASOFT','2017-03-19 20:58:41.647');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('164','604b2461f7c545e28dbb21fb15def5c7','2',1,7,'admin','ZKEASOFT','2017-03-19 20:59:12.037','admin','ZKEASOFT','2017-03-19 20:59:12.037');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('165','80f365c7991a49a0b04aa11006018814','1',3,3,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:02:22.540');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('17','00f62c5acfe840e0bee3ca2979f0f025','6',4,2,'admin','ZKEASOFT','2016-03-09 14:14:33.683','admin','ZKEASOFT','2016-03-09 14:14:33.683');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('18','00f62c5acfe840e0bee3ca2979f0f025','6',3,3,'admin','ZKEASOFT','2016-03-09 14:14:50.897','admin','ZKEASOFT','2016-03-09 14:14:50.897');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('19','f6f11ba2fec844de883acf0a1fe3eb89','7',2,1,'admin','ZKEASOFT','2016-03-09 14:15:44.233','admin','ZKEASOFT','2016-03-09 14:15:44.233');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1c8ddf59f53f453188ce9c115f648a85','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',1,1,'admin','ZKEASOFT','2017-10-15 17:03:36.227','admin','ZKEASOFT','2017-10-15 17:03:36.227');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('20','f6f11ba2fec844de883acf0a1fe3eb89','7',4,2,'admin','ZKEASOFT','2016-03-09 14:15:44.237','admin','ZKEASOFT','2016-03-09 14:15:44.237');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('21','f6f11ba2fec844de883acf0a1fe3eb89','7',3,3,'admin','ZKEASOFT','2016-03-09 14:15:44.240','admin','ZKEASOFT','2016-03-09 14:15:44.240');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('22','481574ebc98b4cdf9a07e3f20c1ab78d','8',2,1,'admin','ZKEASOFT','2016-03-09 14:15:48.877','admin','ZKEASOFT','2016-03-09 14:15:48.877');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2261e8417e5541d5bbde6c743cdcfb7c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,4,'admin','ZKEASOFT','2017-10-15 18:11:36.757','admin','ZKEASOFT','2017-10-15 18:11:36.757');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('23','481574ebc98b4cdf9a07e3f20c1ab78d','8',4,2,'admin','ZKEASOFT','2016-03-09 14:15:48.877','admin','ZKEASOFT','2016-03-09 14:15:48.877');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('24','481574ebc98b4cdf9a07e3f20c1ab78d','8',3,3,'admin','ZKEASOFT','2016-03-09 14:15:48.880','admin','ZKEASOFT','2016-03-09 14:15:48.880');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('25','b568ff7f4a894870adaf9afadf787bf9','9',2,1,'admin','ZKEASOFT','2016-03-09 14:21:44.433','admin','ZKEASOFT','2016-03-09 14:21:44.433');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('26','b568ff7f4a894870adaf9afadf787bf9','9',3,2,'admin','ZKEASOFT','2016-03-09 14:21:53.837','admin','ZKEASOFT','2016-03-09 14:21:53.837');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('27','b568ff7f4a894870adaf9afadf787bf9','10',2,1,'admin','ZKEASOFT','2016-03-09 14:22:35.620','admin','ZKEASOFT','2016-03-09 14:22:35.620');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('28','b568ff7f4a894870adaf9afadf787bf9','10',3,2,'admin','ZKEASOFT','2016-03-09 14:24:34.193','admin','ZKEASOFT','2016-03-09 14:24:34.193');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('29','55b73e54fd054de4847960bdac350c6d','11',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('2fde1f872b9d423d87866cb4e1d4e9fb','604b2461f7c545e28dbb21fb15def5c7','2',1,6,'admin','ZKEASOFT','2017-10-15 17:18:30.710','admin','ZKEASOFT','2017-10-15 17:18:30.710');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('3','604b2461f7c545e28dbb21fb15def5c7','2',1,2,'admin',NULL,'2015-09-01 10:15:07.310','admin',NULL,'2015-09-01 10:15:07.310');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('30','55b73e54fd054de4847960bdac350c6d','11',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.580','admin','ZKEASOFT','2016-03-09 14:33:40.580');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('31','55b73e54fd054de4847960bdac350c6d','12',2,1,'admin','ZKEASOFT','2016-03-09 14:33:40.587','admin','ZKEASOFT','2016-03-09 14:33:40.587');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('32','55b73e54fd054de4847960bdac350c6d','12',3,3,'admin','ZKEASOFT','2016-03-09 14:33:40.587','admin','ZKEASOFT','2016-03-09 14:33:40.587');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('33','55b73e54fd054de4847960bdac350c6d','11',4,2,'admin','ZKEASOFT','2016-03-09 14:34:38.457','admin','ZKEASOFT','2016-03-09 14:34:38.457');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('34','55b73e54fd054de4847960bdac350c6d','12',4,2,'admin','ZKEASOFT','2016-03-09 14:34:51.847','admin','ZKEASOFT','2016-03-09 14:34:51.847');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('35','ed837392097f4e60b812bc57111dd762','13',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('36','ed837392097f4e60b812bc57111dd762','13',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.470','admin','ZKEASOFT','2016-03-09 14:36:24.470');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('37','ed837392097f4e60b812bc57111dd762','14',2,1,'admin','ZKEASOFT','2016-03-09 14:36:24.490','admin','ZKEASOFT','2016-03-09 14:36:24.490');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('38','ed837392097f4e60b812bc57111dd762','14',3,2,'admin','ZKEASOFT','2016-03-09 14:36:24.493','admin','ZKEASOFT','2016-03-09 14:36:24.493');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('39','ed837392097f4e60b812bc57111dd762','15',2,1,'admin','ZKEASOFT','2016-03-09 14:38:16.067','admin','ZKEASOFT','2016-03-09 14:38:16.067');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('4','604b2461f7c545e28dbb21fb15def5c7','2',1,5,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:18:02.197');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('40','ed837392097f4e60b812bc57111dd762','15',3,2,'admin','ZKEASOFT','2016-03-09 14:38:27.630','admin','ZKEASOFT','2016-03-09 14:38:27.630');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('41','1fb967867e3b440e86336bc5a51e8719','16',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.777','admin','ZKEASOFT','2016-03-09 14:40:26.777');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('42','1fb967867e3b440e86336bc5a51e8719','16',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.780','admin','ZKEASOFT','2016-03-09 14:40:26.780');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('43','1fb967867e3b440e86336bc5a51e8719','17',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('44','1fb967867e3b440e86336bc5a51e8719','17',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.783','admin','ZKEASOFT','2016-03-09 14:40:26.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('45','1fb967867e3b440e86336bc5a51e8719','18',2,1,'admin','ZKEASOFT','2016-03-09 14:40:26.787','admin','ZKEASOFT','2016-03-09 14:40:26.787');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('45add364d0574b3687908dea124e429f','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,3,'admin','ZKEASOFT','2017-10-15 18:11:36.757','admin','ZKEASOFT','2017-10-15 18:11:36.757');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('46','1fb967867e3b440e86336bc5a51e8719','18',3,3,'admin','ZKEASOFT','2016-03-09 14:40:26.787','admin','ZKEASOFT','2016-03-09 14:40:26.787');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('47','1fb967867e3b440e86336bc5a51e8719','16',4,2,'admin','ZKEASOFT','2016-03-09 14:41:13.710','admin','ZKEASOFT','2016-03-09 14:41:13.710');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('48','1fb967867e3b440e86336bc5a51e8719','17',4,2,'admin','ZKEASOFT','2016-03-09 14:42:01.137','admin','ZKEASOFT','2016-03-09 14:42:01.137');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('49','1fb967867e3b440e86336bc5a51e8719','18',4,2,'admin','ZKEASOFT','2016-03-09 14:42:20.190','admin','ZKEASOFT','2016-03-09 14:42:20.190');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('5','604b2461f7c545e28dbb21fb15def5c7','2',1,1,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:17:12.377');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('513f11827367468a9fc870ac534cbc6a','88ab49212dee47bba878a52bec86f501','50082fd30e01404fbb4fe6101353b1d5',3,3,'admin','ZKEASOFT','2017-10-15 18:11:36.803','admin','ZKEASOFT','2017-10-15 18:11:36.803');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6','604b2461f7c545e28dbb21fb15def5c7','2',1,3,'admin','ZKEASOFT','2016-03-01 10:45:25.393','admin','ZKEASOFT','2016-03-01 10:45:25.393');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('6c34eb97f4d142cf92485f496aa7749b','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,2,'admin','ZKEASOFT','2017-10-15 18:11:36.753','admin','ZKEASOFT','2017-10-15 18:11:36.753');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('81f7765ff0e649c1b7912c482be6195c','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.747','admin','ZKEASOFT','2017-10-15 18:11:36.747');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('8308cd484f8d450da9bfadc11398b302','e0783dbbcc564322a1f2e3ca2833dbd4','0015be62210742c083c3a9dad4b72fb5',1,6,'admin','ZKEASOFT','2017-10-15 18:11:36.763','admin','ZKEASOFT','2017-10-15 18:11:36.763');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('cfa29c5af91141598e9ade186f1ba4ba','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',3,2,'admin','ZKEASOFT','2017-10-15 18:11:36.783','admin','ZKEASOFT','2017-10-15 18:11:36.783');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e748a75135904442860c52822af33c7d','7f77f09c3fcd4d498a4aa3b1c9508d7d','80cb176412cf457a81ae7a1f9fa33ef6',3,2,'admin','ZKEASOFT','2017-10-15 17:04:41.027','admin','ZKEASOFT','2017-10-15 17:04:41.027');
INSERT INTO [SectionContent] ([ID],[SectionWidgetId],[SectionGroupId],[SectionContentType],[Order],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e8b4787cc6f240a8bfcae2ac26e06d79','7e7a1d5b8d644333a7b3341509fc960f','9ce2c15af93c4fd782e17a1e7e35963f',1,1,'admin','ZKEASOFT','2017-10-15 18:11:36.783','admin','ZKEASOFT','2017-10-15 18:11:36.783');
INSERT INTO [ProductListWidget] ([ID],[IsPageable],[ProductCategoryID],[DetailPageUrl],[Columns],[PageSize]) VALUES ('6bb06e46293c46f084e83751a0832d36',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9);
INSERT INTO [ProductListWidget] ([ID],[IsPageable],[ProductCategoryID],[DetailPageUrl],[Columns],[PageSize]) VALUES ('e88916cc41b3465b9ae954bafac5f796',1,1,'~/product/detail','col-xs-6 col-sm-4 col-md-4',9);
INSERT INTO [ProductDetailWidget] ([ID],[CustomerClass]) VALUES ('787d9ad849dd40d0905f22ae072d8507',NULL);
INSERT INTO [ProductDetailWidget] ([ID],[CustomerClass]) VALUES ('94624262dc00460cbbc1e0f51711e712',NULL);
INSERT INTO [ProductCategoryWidget] ([ID],[ProductCategoryID],[TargetPage]) VALUES ('3466e616139645d2b1e1d9935d231922',1,NULL);
INSERT INTO [ProductCategoryWidget] ([ID],[ProductCategoryID],[TargetPage]) VALUES ('eb7657f5bcbd4e98977a42950936e7ac',1,NULL);
INSERT INTO [NavigationWidget] ([ID],[CustomerClass],[Title],[Logo],[AlignClass],[IsTopFix],[RootID],[ShowBasket]) VALUES ('6ee67036e78b4b498d932ab2d76757fb','container',NULL,'~/images/logo_zkea.png','navbar-left',NULL,'#',0);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('2b510992f0174e668ca53116434e065c','~/images/bg4.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('3017aef0eabc451b81daebe6bae68857','~/images/bg4.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('43bb869688ee4752a3127dd19ccc6caa','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('7679a5060035444d85fe49dc3c02cada','http://www.zkea.net/UpLoad/Images/20160318/09e179985c582366.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('8ea46d2923ad4d62958c565b19bb172d','~/images/bg3.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('e5ba6adb117440959757b98e4289430f','~/images/bg3.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [ImageWidget] ([ID],[ImageUrl],[Width],[Height],[AltText],[Link],[ImageUrlMd],[ImageUrlSm]) VALUES ('fee7f4d7d7e641b0bfa74491a543d245','~/images/30.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('062018a8e5cf48b4a0d90296e7f4e965','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('09617f6142934daaadee6cfb9df6d66f','<p>?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS???????????????????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS????????????????????????????????????????????????</p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('357a58069e8047a289e10b920061d57d','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('3b8beb945c9f4c9390a6122d8b4788d5','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('3e3783f4b7ca421488f2bf08d32fe2f0','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('4d67b2d10f4a425586e3b1115f7f7072','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('50f810582d28440eb3bdff9ee5b1ef24','<div>
<div class="row">
<div class="col-sm-6"><img src="/Images/28.jpg" alt="" /></div>
<div class="col-sm-6">
<h3>????????????????????????</h3>
<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>&nbsp;</p>
<p><a class="btn btn-info" href="#">Read More</a></p>
</div>
</div>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('56991d0ff59d4c1db27aff3a50fcb382','<div class="page-header">
<h1>ZKEASOFT</h1>
</div>
<p>ZKEASOFT ?????????????????????????????????????????????????????????????????????????????????????????????</p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('62ca3b6b6ea644b4a64501021b02f13b','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('8cc061c2e2514ef9b85bbecdec3f84ab','<hr />');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('a686b84212f94b3b8315093b2e8b883d','<div id="footer">ZKEACMS????????????????????????????????????????????????
<p>Copyright @&nbsp;2015 ZKEASOFT. All Rights Reserved | <a href="http://www.zkea.net/" target="_blank" rel="noopener">www.zkea.net</a></p>
</div>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('bb7dab4f077745ef8b5b425eaabb423c','<h1 style="text-align: center; font-size: 3em;">ZKEASOFT</h1>
<p>&nbsp;</p>
<p style="text-align: center;">ZKEASOFT ?????????????????????????????????????????????????????????????????????????????????????????????</p>
<p style="text-align: center;"><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>?????????<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>?????????ASP.NET MVC4???????????????CMS???</p>
<p style="text-align: center;">ZKEACMS???????????????????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p style="text-align: center;">ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p style="text-align: center;">ZKEACMS????????????????????????????????????????????????</p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;"><a class="btn btn-info" href="#">Read More</a></p>');
INSERT INTO [HtmlWidget] ([ID],[HTML]) VALUES ('f6de0d62d3974ee2bf2ded3fbbc82c2b','<div class="space">&nbsp;</div>');
INSERT INTO [CMS_Theme] ([ID],[Title],[Url],[UrlDebugger],[Thumbnail],[IsActived],[Status],[Description],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Default','??????','~/themes/Default/css/Theme.min.css','~/themes/Default/css/Theme.css','~/themes/Default/thumbnail.jpg',1,1,NULL,'admin','ZKEASOFT','2016-04-04 22:17:10.790','admin','ZKEASOFT','2016-04-04 22:21:01.487');
INSERT INTO [CMS_Rule] ([RuleID],[Title],[ZoneName],[RuleExpression],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[RuleItems]) VALUES (1,'????????????','??????','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:34.623','admin','ZKEASOFT','2018-05-21 23:43:34.623','[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]');
INSERT INTO [CMS_Rule] ([RuleID],[Title],[ZoneName],[RuleExpression],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[RuleItems]) VALUES (2,'????????????','??????','StartsWith(ValueOf(''Url''),''/'')',NULL,1,'admin','ZKEASOFT','2018-05-21 23:43:52.343','admin','ZKEASOFT','2018-05-21 23:43:52.343','[{"Condition":"and","FunctionName":"StartsWith","Property":"ValueOf(''Url'')","Value":"/","Title":null,"Description":null,"Status":null,"CreateBy":null,"CreatebyName":null,"CreateDate":null,"LastUpdateBy":null,"LastUpdateByName":null,"LastUpdateDate":null,"ActionType":1}]');
INSERT INTO [CMS_Redirection] ([ID],[Title],[InComingUrl],[DestinationURL],[IsPermanent],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[IsPattern]) VALUES (1,'??????','~/','~/index',0,NULL,1,'admin','ZKEASOFT','2017-08-14 14:58:06.000','admin','ZKEASOFT','2020-08-01 22:21:26.837',0);
INSERT INTO [CMS_Message] ([ID],[Title],[Email],[PostMessage],[Reply],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES (1,'ZKEASOFT','zkea@zkea.net','ZKEACMS?????????ASP.NET MVC4???????????????CMS????????????????????????????????????','KEACMS?????????????????????????????????????????????????????????????????????????????????????????????',1,'admin','ZKEASOFT','2017-03-19 21:02:34.260','admin','ZKEASOFT','2017-03-19 21:02:34.260',NULL);
INSERT INTO [CMS_Message] ([ID],[Title],[Email],[PostMessage],[Reply],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES (2,'ZKEASOFT','zkea@zkea.net','ZKEACMS???????????????????????????','ZKEACMS????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',1,'admin','ZKEASOFT','2017-03-19 21:03:09.967','admin','ZKEASOFT','2017-03-19 21:03:09.967',NULL);
INSERT INTO [CMS_Media] ([ID],[ParentID],[Title],[MediaType],[Url],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description]) VALUES ('6056810a7ede46bb94b55b2756323640','#','??????',1,NULL,NULL,'admin','ZKEASOFT','2016-04-01 21:42:14.960','admin','ZKEASOFT','2016-04-01 21:42:14.960',NULL);
INSERT INTO [CMS_Layout] ([ID],[LayoutName],[Title],[ContainerClass],[Status],[Description],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[ImageUrl],[ImageThumbUrl],[Theme]) VALUES ('0846a33e56bf45d5aae602ef40d87444','??????',NULL,'container',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:06:44.200','admin','ZKEASOFT','2016-03-10 21:06:44.200','~/images/layout.jpg','~/images/layout.jpg','Default');
INSERT INTO [CMS_Layout] ([ID],[LayoutName],[Title],[ContainerClass],[Status],[Description],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[ImageUrl],[ImageThumbUrl],[Theme]) VALUES ('1dae90cf6a8547538cc0c369b9943c01','??????',NULL,'container',1,NULL,NULL,NULL,'admin',NULL,'2015-08-31 11:56:31.750','admin',NULL,'2015-08-31 11:56:31.750','~/images/layout.jpg','~/images/layout.jpg','Default');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0338e740ea064e5a88d6223fd476506f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.650','admin','ZKEASOFT','2018-05-21 23:45:46.650',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0387a1373f59466a91feb96bb69aadca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.987','admin','ZKEASOFT','2018-05-21 23:46:12.987',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('07384e5dc4f34a199d4ca73b3317b1f2','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.190','admin','ZKEASOFT','2018-05-21 23:42:49.190',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('095b8b8b28144248a2b0eff648e7fc48','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.930','admin','ZKEASOFT','2018-05-21 23:45:21.930',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0c44eb9149b34ffaaa44d6976d11e1d8','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.307','admin','ZKEASOFT','2018-05-21 23:46:19.307',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('0e5c5a55882b4a34a77f3de1f0f36a4c','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.117','admin','ZKEASOFT','2018-05-21 23:46:15.117',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1319756527364a5da511499b37a1eed5','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.973','admin','ZKEASOFT','2018-05-21 23:42:39.973',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('14a23e1671924f758113054ed008adec','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.727','admin','ZKEASOFT','2018-05-21 23:46:28.727',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('17ef6a804c524ed298492e404ad5576b','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.303','admin','ZKEASOFT','2018-05-21 23:46:19.303',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('18f2e25482b444ba8861238637861ba5','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.747','admin','ZKEASOFT','2018-05-21 23:46:34.747',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('19d3d679eaf74a21bf4f123487eaee0d','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1c232c2d572f415082e74771e37e3580','0846a33e56bf45d5aae602ef40d87444',NULL,'??????',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.637',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('1cd27416b7db429bb639d8950cc29793','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.197','admin','ZKEASOFT','2018-05-21 23:42:49.197',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('23ec6afdd2ea49dd8fb5839ae2bec741','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.983','admin','ZKEASOFT','2018-05-21 23:42:39.983',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('25ce97efa1484065995e6e5aaade9a83','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.160','admin','ZKEASOFT','2018-05-21 23:42:49.160',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2921f81e4531493694790faed3ed76e9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.310','admin','ZKEASOFT','2018-05-21 23:46:19.310',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('294c86a5d87a46d49f41999c495344ea','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.730','admin','ZKEASOFT','2018-05-21 23:46:28.730',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('2fd26e7c5a844bea8a2422d074d73109','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.330','admin','ZKEASOFT','2018-05-21 23:45:43.330',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('302009d870f74aa1b5b55dc6f1c6385f','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('34f9c91a64ee4986bec02073ea77035d','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.927','admin','ZKEASOFT','2018-05-21 23:45:21.927',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('360d6da3007e41d68c521c3154173c7a','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.783','admin','ZKEASOFT','2018-05-21 23:45:45.783',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('39af0cedd23a42d08c2c93e7b0dbaee0','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.357','admin','ZKEASOFT','2018-05-21 23:46:09.357',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3b3f74427bf84da999406f98f7d8cdd7','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.690','admin','ZKEASOFT','2018-05-21 23:45:46.690',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3ca302874c164b7b9691ca948300417b','1dae90cf6a8547538cc0c369b9943c01',NULL,'?????????',NULL,'admin',NULL,'2015-08-31 11:58:54.257','admin','ZKEASOFT','2017-11-19 17:48:39.823',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('3f166bd62afb4a888801ec561cbc15ef','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.987','admin','ZKEASOFT','2018-05-21 23:42:39.987',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('40a562598d3a44a98646519094631628','1dae90cf6a8547538cc0c369b9943c01',NULL,'??????',NULL,'admin',NULL,'2015-08-31 11:58:54.253','admin','ZKEASOFT','2017-11-19 17:48:39.840',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('4cf5d05f2b954a7e8904713ad6781a61','1dae90cf6a8547538cc0c369b9943c01',NULL,'?????????',NULL,'admin',NULL,'2015-08-31 11:58:54.257','admin','ZKEASOFT','2017-11-19 17:48:39.847',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('572963d3322b4cddb7d94d6bec2f08c7','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.343','admin','ZKEASOFT','2018-05-21 23:45:43.343',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('57c4f0c9fb31439c913d0221c20a6343','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.113','admin','ZKEASOFT','2018-05-21 23:46:15.113',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('58f65b43d383423a9456102ea06450c1','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.740','admin','ZKEASOFT','2018-05-21 23:46:34.740',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5d3fdb35e2c54313850c69c401548b4d','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.753','admin','ZKEASOFT','2018-05-21 23:46:34.753',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('5d84136b25ea4bd4a65779e0bb7acc3d','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.680','admin','ZKEASOFT','2018-05-21 23:45:46.680',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6920822269c34d5781b7df72fa37df16','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.917','admin','ZKEASOFT','2018-05-21 23:45:21.917',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('6bba8443507f4273b2b61048f7c71f40','0846a33e56bf45d5aae602ef40d87444',NULL,'??????',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.887','admin','ZKEASOFT','2017-11-19 17:48:10.903',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7480ffc27b034c51aca983367316bb7c','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.353','admin','ZKEASOFT','2018-05-21 23:46:09.353',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7577ca3b1628498c8f38b42545f3c1b3','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.120','admin','ZKEASOFT','2018-05-21 23:46:15.120',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('75be97a54a4b430ca6d26b8285bbce8d','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.347','admin','ZKEASOFT','2018-05-21 23:45:43.347',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('787c9336ef3341d4b63e710f16281424','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7c1d057dff154fa0836ebe82b5f08b6b','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.787','admin','ZKEASOFT','2018-05-21 23:45:45.787',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('7fe7ceb43d734faca8a21e78185995d6','1dae90cf6a8547538cc0c369b9943c01',NULL,'??????',NULL,'admin',NULL,'2015-08-31 11:58:54.260','admin','ZKEASOFT','2017-11-19 17:48:39.873',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('82e28c8ca83c4a52847b2f759b4d1ab0','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.757','admin','ZKEASOFT','2018-05-21 23:46:34.757',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('85b6e66b7b3345e9a482af084da307d3','0846a33e56bf45d5aae602ef40d87444',NULL,'??????',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.890','admin','ZKEASOFT','2017-11-19 17:48:10.963',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8b3a4cd737594c00a7e34c17c1bbc9fc','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.760','admin','ZKEASOFT','2018-05-21 23:45:45.760',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('8d4f87b76dfa4c96ae71734ef5ad08fd','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.657','admin','ZKEASOFT','2018-05-21 23:45:47.657',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('93ed2f72cef64bf891e0a1ef999c0ebc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.800','admin','ZKEASOFT','2018-05-21 23:45:44.800',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9774034c2832414e9ccaa39b43685710','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.670','admin','ZKEASOFT','2018-05-21 23:45:47.670',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9b5eab51ed78479f9a3b6cd88f30865c','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9c39ce55ae2b46fbaab97287436b651f','0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:43.340','admin','ZKEASOFT','2018-05-21 23:45:43.340',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9c87f7474bcf450a942838b42335a928','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('9ccbb73c31ba46caa173b1ff5208cd4e','1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:49.193','admin','ZKEASOFT','2018-05-21 23:42:49.193',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a30b21857de2411982aa4f40e0fcba59','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.993','admin','ZKEASOFT','2018-05-21 23:46:12.993',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a4bd66363b6a4f2ea1d21ed601c69866','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.797','admin','ZKEASOFT','2018-05-21 23:45:44.797',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('a979c68e8f49405fa3c5cc21fafdb7b9','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.117','admin','ZKEASOFT','2018-05-21 23:46:15.117',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('aae6dbf58fff429d9a32627933854a8f','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.693','admin','ZKEASOFT','2018-05-21 23:45:46.693',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('af49758840b345a6ab910d11a691fc99','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.667','admin','ZKEASOFT','2018-05-21 23:45:47.667',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('b0a92bfb56704f8aaf7dade22c3db2d2','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.977','admin','ZKEASOFT','2018-05-21 23:42:39.977',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('be7a1e6a999b4264aab2b5ac593909a8','0846a33e56bf45d5aae602ef40d87444',NULL,'??????',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.527','admin','ZKEASOFT','2017-11-19 17:48:10.967',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('bed6101f906b4e50b3ba034bfe39d184','1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:42:39.833','admin','ZKEASOFT','2018-05-21 23:42:39.833',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c1f4cb36e7924ff99ff38aeb3983eca3','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.343','admin','ZKEASOFT','2018-05-21 23:46:09.343',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c22c6484c2864c82932ec6ad0a20492a','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.923','admin','ZKEASOFT','2018-05-21 23:45:21.923',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c291af01f0b443c3ad59b5b289d97e1f','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.307','admin','ZKEASOFT','2018-05-21 23:46:19.307',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('c7bcd0a9d172432bafbf9f5a986685f2','0846a33e56bf45d5aae602ef40d87444',NULL,'?????????',NULL,'admin','ZKEASOFT','2016-03-10 21:08:20.893','admin','ZKEASOFT','2017-11-19 17:48:10.967',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ca49f8b95d724a3bb1cc01a10ca72cb9','1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:19.297','admin','ZKEASOFT','2018-05-21 23:46:19.297',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d5a2daad909b4ecfb02988584d8903ad','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.777','admin','ZKEASOFT','2018-05-21 23:45:45.777',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d5f02570e4814439acc86a1874cb8f07','1dae90cf6a8547538cc0c369b9943c01',NULL,'?????????',NULL,'admin',NULL,'2015-08-31 11:58:54.257','admin','ZKEASOFT','2017-11-19 17:48:39.887',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('d79708e9937541c9833467ed6f31ebda','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.980','admin','ZKEASOFT','2018-05-21 23:46:12.980',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('db297e847b15465cb4ee5d46cd7ca168','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('de442cdec7044de895680750884b1eb4','0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:45.773','admin','ZKEASOFT','2018-05-21 23:45:45.773',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('df2ff4bd579d4e6cb8855b196ba2c322','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.810','admin','ZKEASOFT','2018-05-21 23:45:44.810',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e333b823cf0e4d40a7999bc2787370b2','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.723','admin','ZKEASOFT','2018-05-21 23:46:28.723',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('e74560705e8c414bbb284cc95dc54d8a','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ea3ca53e83924909bfab5e9242583a93','0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:21.927','admin','ZKEASOFT','2018-05-21 23:45:21.927',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ea5cdd077bf44e16b8fc4a22433d63ca','0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:12.997','admin','ZKEASOFT','2018-05-21 23:46:12.997',NULL,NULL,'ZONE-2');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eaaf42be824141679c05866ad9a8acf2','0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:09.350','admin','ZKEASOFT','2018-05-21 23:46:09.350',NULL,NULL,'ZONE-1');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('ee21c0c23a834cfaae370413da4630cc','0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:44.780','admin','ZKEASOFT','2018-05-21 23:45:44.780',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('eeb31d7a5ee7485ea014708e14f66cac','1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:47.673','admin','ZKEASOFT','2018-05-21 23:45:47.673',NULL,NULL,'ZONE-4');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f41ee7803dc6431bafb45ff035fca916','1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:45:46.637','admin','ZKEASOFT','2018-05-21 23:45:46.637',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f4f64f6755be449c8ccb6c5969749b19','0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:28.733','admin','ZKEASOFT','2018-05-21 23:46:28.733',NULL,NULL,'ZONE-0');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('f844832366834170a8c8caeb8c64b96b','1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','?????????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:15.107','admin','ZKEASOFT','2018-05-21 23:46:15.107',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Zone] ([ID],[LayoutId],[PageId],[ZoneName],[Title],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate],[Description],[Status],[HeadingCode]) VALUES ('fb0f4ea5b0ed44289f665eec3b829ea2','0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','??????',NULL,'admin','ZKEASOFT','2018-05-21 23:46:34.750','admin','ZKEASOFT','2018-05-21 23:46:34.750',NULL,NULL,'ZONE-3');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('068c85b8de8744e7a81b1d1010583308','9d84599edb2443439a53e8d906815c8f',1,'#','??????',0,'~/product','0846a33e56bf45d5aae602ef40d87444','??????',NULL,4,NULL,1,0,'2016-05-15 20:56:40.843',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-05-15 20:56:40.843','admin','ZKEASOFT','2016-05-15 20:56:40.843');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('0880a4dfdc184ff99b88c88325716d1b',NULL,0,'#','??????',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','????????????ZKEACMS????????????',NULL,1,NULL,1,0,'2017-10-15 18:11:36.000',NULL,NULL,'[]','[]','admin',NULL,'2015-08-31 13:27:16.000','admin','ZKEASOFT','2020-03-21 14:01:56.337');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('1c93b61690ce49d7af8e1ea45ac58eb9',NULL,0,'#','????????????',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01',' ????????????',NULL,7,NULL,1,1,'2017-03-19 21:05:28.837',' ????????????',' ????????????',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:03:50.763','admin','ZKEASOFT','2017-03-19 21:05:16.280');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('4b889b430aa44517bbad38a57c745cc5','a8d73e29b1eb4b7ea43420e2b6bf2c1b',1,'9d84599edb2443439a53e8d906815c8f','????????????',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2016-03-10 23:24:38.777',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:24:38.780','admin','ZKEASOFT','2016-03-10 23:24:38.780');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('50fa3579e7434555a22f095dcb4ea35e','0880a4dfdc184ff99b88c88325716d1b',1,'#','??????',1,'~/index','1dae90cf6a8547538cc0c369b9943c01','????????????ZKEACMS????????????',NULL,1,NULL,1,0,'2017-10-15 18:11:36.273',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:36.277','admin','ZKEASOFT','2017-10-15 18:11:36.810');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('534e07f396b14b7584a833d270356cb7','1c93b61690ce49d7af8e1ea45ac58eb9',1,'#','????????????',0,'~/contact','1dae90cf6a8547538cc0c369b9943c01',' ????????????',NULL,7,NULL,1,0,'2017-03-19 21:05:30.803',' ????????????',' ????????????',NULL,NULL,'admin','ZKEASOFT','2017-03-19 21:05:30.833','admin','ZKEASOFT','2017-03-19 21:05:31.050');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('9ce910ba45a24fd2af804d6d0de7bba3','be49e3ec3b5a4f5eae3edaf8ba64f185',1,'#','????????????',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','???????????? | ZKEASOFT',NULL,5,NULL,1,0,'2017-10-15 18:20:42.203',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:20:42.207','admin','ZKEASOFT','2017-10-15 18:20:42.217');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('9d84599edb2443439a53e8d906815c8f',NULL,0,'#','??????',0,'~/product','0846a33e56bf45d5aae602ef40d87444','??????',NULL,4,NULL,1,1,'2016-05-15 20:56:40.763',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:18:10.430','admin','ZKEASOFT','2016-05-14 15:01:42.697');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('a3d735320eb04c63bf3258d7b44e30f8',NULL,0,'e371628aa3ff46c3a167f121c7a3f32b','????????????',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2017-12-03 17:11:47.220',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 21:24:03.240','admin','ZKEASOFT','2017-12-03 17:11:47.223');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('a8d73e29b1eb4b7ea43420e2b6bf2c1b',NULL,0,'9d84599edb2443439a53e8d906815c8f','????????????',0,'~/product/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,1,'2016-03-10 23:24:38.743',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 23:20:11.263','admin','ZKEASOFT','2016-03-10 23:24:38.737');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('be49e3ec3b5a4f5eae3edaf8ba64f185',NULL,0,'#','????????????',0,'~/questionnaire','1dae90cf6a8547538cc0c369b9943c01','???????????? | ZKEASOFT',NULL,5,NULL,1,1,'2017-10-15 18:20:42.193',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 17:58:52.057','admin','ZKEASOFT','2017-10-15 18:20:42.193');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('c5b97a044c9844529fc48383d141e73c','a3d735320eb04c63bf3258d7b44e30f8',1,'e371628aa3ff46c3a167f121c7a3f32b','????????????',0,'~/article/detail','0846a33e56bf45d5aae602ef40d87444',NULL,NULL,1,NULL,1,0,'2017-12-03 17:11:47.237',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-12-03 17:11:47.243','admin','ZKEASOFT','2017-12-03 17:11:47.307');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('d070f202bb2f45ddbd35f0a7cfee1dfa','e371628aa3ff46c3a167f121c7a3f32b',1,'#','??????',0,'~/article','0846a33e56bf45d5aae602ef40d87444','??????',NULL,3,NULL,1,0,'2017-10-15 18:11:44.947',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2017-10-15 18:11:44.947','admin','ZKEASOFT','2017-10-15 18:11:45.367');
INSERT INTO [CMS_Page] ([ID],[ReferencePageID],[IsPublishedPage],[ParentId],[PageName],[IsHomePage],[Url],[LayoutId],[Title],[Content],[DisplayOrder],[Description],[Status],[IsPublish],[PublishDate],[MetaKeyWorlds],[MetaDescription],[Script],[Style],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('e371628aa3ff46c3a167f121c7a3f32b',NULL,0,'#','??????',0,'~/article','0846a33e56bf45d5aae602ef40d87444','??????',NULL,3,NULL,1,1,'2017-10-15 18:11:44.940',NULL,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-09 12:45:01.000','admin','ZKEASOFT','2017-10-15 18:11:44.940');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (219,'0846a33e56bf45d5aae602ef40d87444',NULL,'<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.063','admin','ZKEASOFT','2017-11-19 17:48:11.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (220,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.333','admin','ZKEASOFT','2017-11-19 17:48:11.333');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (221,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:11.337','admin','ZKEASOFT','2017-11-19 17:48:11.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (222,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.340','admin','ZKEASOFT','2017-11-19 17:48:11.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (223,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.347','admin','ZKEASOFT','2017-11-19 17:48:11.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (224,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.350','admin','ZKEASOFT','2017-11-19 17:48:11.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (225,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:11.353','admin','ZKEASOFT','2017-11-19 17:48:11.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (226,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.357','admin','ZKEASOFT','2017-11-19 17:48:11.357');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (227,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.370','admin','ZKEASOFT','2017-11-19 17:48:11.370');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (228,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.373','admin','ZKEASOFT','2017-11-19 17:48:11.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (229,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:11.647','admin','ZKEASOFT','2017-11-19 17:48:11.647');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (230,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (231,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.650','admin','ZKEASOFT','2017-11-19 17:48:11.650');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (232,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:11.667','admin','ZKEASOFT','2017-11-19 17:48:11.667');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (233,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:11.950','admin','ZKEASOFT','2017-11-19 17:48:11.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (234,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:11.983','admin','ZKEASOFT','2017-11-19 17:48:11.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (235,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:11.987','admin','ZKEASOFT','2017-11-19 17:48:11.987');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (236,'0846a33e56bf45d5aae602ef40d87444',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:12.223','admin','ZKEASOFT','2017-11-19 17:48:12.223');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (237,'0846a33e56bf45d5aae602ef40d87444',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:12.270','admin','ZKEASOFT','2017-11-19 17:48:12.270');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (238,'0846a33e56bf45d5aae602ef40d87444',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:12.500','admin','ZKEASOFT','2017-11-19 17:48:12.500');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (239,'0846a33e56bf45d5aae602ef40d87444',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:12.757','admin','ZKEASOFT','2017-11-19 17:48:12.757');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (240,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:39.997','admin','ZKEASOFT','2017-11-19 17:48:39.997');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (241,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.013','admin','ZKEASOFT','2017-11-19 17:48:40.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (242,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-0','admin','ZKEASOFT','2017-11-19 17:48:40.017','admin','ZKEASOFT','2017-11-19 17:48:40.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (243,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (244,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.023','admin','ZKEASOFT','2017-11-19 17:48:40.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (245,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.027','admin','ZKEASOFT','2017-11-19 17:48:40.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (246,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-1','admin','ZKEASOFT','2017-11-19 17:48:40.027','admin','ZKEASOFT','2017-11-19 17:48:40.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (247,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (248,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (249,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.030','admin','ZKEASOFT','2017-11-19 17:48:40.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (250,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-2','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (251,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.043','admin','ZKEASOFT','2017-11-19 17:48:40.043');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (252,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.047','admin','ZKEASOFT','2017-11-19 17:48:40.047');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (253,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.047','admin','ZKEASOFT','2017-11-19 17:48:40.047');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (254,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-3','admin','ZKEASOFT','2017-11-19 17:48:40.047','admin','ZKEASOFT','2017-11-19 17:48:40.047');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (255,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.053','admin','ZKEASOFT','2017-11-19 17:48:40.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (256,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2017-11-19 17:48:40.057','admin','ZKEASOFT','2017-11-19 17:48:40.057');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (257,'1dae90cf6a8547538cc0c369b9943c01',NULL,'<zone>','admin','ZKEASOFT','2017-11-19 17:48:40.057','admin','ZKEASOFT','2017-11-19 17:48:40.057');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (258,'1dae90cf6a8547538cc0c369b9943c01',NULL,'ZONE-4','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (259,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</zone>','admin','ZKEASOFT','2017-11-19 17:48:40.063','admin','ZKEASOFT','2017-11-19 17:48:40.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (260,'1dae90cf6a8547538cc0c369b9943c01',NULL,'</div></div></div></div></div>','admin','ZKEASOFT','2017-11-19 17:48:40.073','admin','ZKEASOFT','2017-11-19 17:48:40.073');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (261,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.053','admin','ZKEASOFT','2018-05-21 23:42:40.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (262,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.110','admin','ZKEASOFT','2018-05-21 23:42:40.110');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (263,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-0','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (264,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.113','admin','ZKEASOFT','2018-05-21 23:42:40.113');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (265,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.117','admin','ZKEASOFT','2018-05-21 23:42:40.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (266,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.117','admin','ZKEASOFT','2018-05-21 23:42:40.117');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (267,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-1','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (268,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (269,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.120','admin','ZKEASOFT','2018-05-21 23:42:40.120');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (270,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (271,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-2','admin','ZKEASOFT','2018-05-21 23:42:40.123','admin','ZKEASOFT','2018-05-21 23:42:40.123');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (272,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.127','admin','ZKEASOFT','2018-05-21 23:42:40.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (273,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.127','admin','ZKEASOFT','2018-05-21 23:42:40.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (274,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.130','admin','ZKEASOFT','2018-05-21 23:42:40.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (275,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-3','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (276,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (277,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:42:40.133','admin','ZKEASOFT','2018-05-21 23:42:40.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (278,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','<zone>','admin','ZKEASOFT','2018-05-21 23:42:40.137','admin','ZKEASOFT','2018-05-21 23:42:40.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (279,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','ZONE-4','admin','ZKEASOFT','2018-05-21 23:42:40.137','admin','ZKEASOFT','2018-05-21 23:42:40.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (280,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</zone>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (281,'1dae90cf6a8547538cc0c369b9943c01','50fa3579e7434555a22f095dcb4ea35e','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:42:40.140','admin','ZKEASOFT','2018-05-21 23:42:40.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (282,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:54.990','admin','ZKEASOFT','2018-05-21 23:45:54.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (283,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.003','admin','ZKEASOFT','2018-05-21 23:45:55.003');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (284,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-0','admin','ZKEASOFT','2018-05-21 23:45:55.007','admin','ZKEASOFT','2018-05-21 23:45:55.007');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (285,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.010','admin','ZKEASOFT','2018-05-21 23:45:55.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (286,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (287,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.013','admin','ZKEASOFT','2018-05-21 23:45:55.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (288,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-1','admin','ZKEASOFT','2018-05-21 23:45:55.020','admin','ZKEASOFT','2018-05-21 23:45:55.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (289,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.023','admin','ZKEASOFT','2018-05-21 23:45:55.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (290,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.033','admin','ZKEASOFT','2018-05-21 23:45:55.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (291,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.037','admin','ZKEASOFT','2018-05-21 23:45:55.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (292,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-2','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (293,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.050','admin','ZKEASOFT','2018-05-21 23:45:55.050');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (294,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.053','admin','ZKEASOFT','2018-05-21 23:45:55.053');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (295,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.060','admin','ZKEASOFT','2018-05-21 23:45:55.060');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (296,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-3','admin','ZKEASOFT','2018-05-21 23:45:55.063','admin','ZKEASOFT','2018-05-21 23:45:55.063');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (297,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.067','admin','ZKEASOFT','2018-05-21 23:45:55.067');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (298,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (299,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','<zone>','admin','ZKEASOFT','2018-05-21 23:45:55.070','admin','ZKEASOFT','2018-05-21 23:45:55.070');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (300,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','ZONE-4','admin','ZKEASOFT','2018-05-21 23:45:55.073','admin','ZKEASOFT','2018-05-21 23:45:55.073');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (301,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</zone>','admin','ZKEASOFT','2018-05-21 23:45:55.077','admin','ZKEASOFT','2018-05-21 23:45:55.077');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (302,'1dae90cf6a8547538cc0c369b9943c01','0880a4dfdc184ff99b88c88325716d1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:45:55.087','admin','ZKEASOFT','2018-05-21 23:45:55.087');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (303,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.367','admin','ZKEASOFT','2018-05-21 23:46:09.367');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (304,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.373','admin','ZKEASOFT','2018-05-21 23:46:09.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (305,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (306,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.380','admin','ZKEASOFT','2018-05-21 23:46:09.380');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (307,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (308,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.383','admin','ZKEASOFT','2018-05-21 23:46:09.383');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (309,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:09.387','admin','ZKEASOFT','2018-05-21 23:46:09.387');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (310,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.390','admin','ZKEASOFT','2018-05-21 23:46:09.390');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (311,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (312,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.393','admin','ZKEASOFT','2018-05-21 23:46:09.393');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (313,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:09.397','admin','ZKEASOFT','2018-05-21 23:46:09.397');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (314,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.397','admin','ZKEASOFT','2018-05-21 23:46:09.397');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (315,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (316,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.400','admin','ZKEASOFT','2018-05-21 23:46:09.400');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (317,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:09.407','admin','ZKEASOFT','2018-05-21 23:46:09.407');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (318,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.410','admin','ZKEASOFT','2018-05-21 23:46:09.410');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (319,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:09.417','admin','ZKEASOFT','2018-05-21 23:46:09.417');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (320,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','<zone>','admin','ZKEASOFT','2018-05-21 23:46:09.420','admin','ZKEASOFT','2018-05-21 23:46:09.420');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (321,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:09.423','admin','ZKEASOFT','2018-05-21 23:46:09.423');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (322,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</zone>','admin','ZKEASOFT','2018-05-21 23:46:09.427','admin','ZKEASOFT','2018-05-21 23:46:09.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (323,'0846a33e56bf45d5aae602ef40d87444','d070f202bb2f45ddbd35f0a7cfee1dfa','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:09.427','admin','ZKEASOFT','2018-05-21 23:46:09.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (324,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.003','admin','ZKEASOFT','2018-05-21 23:46:13.003');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (325,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (326,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:13.010','admin','ZKEASOFT','2018-05-21 23:46:13.010');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (327,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (328,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.013','admin','ZKEASOFT','2018-05-21 23:46:13.013');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (329,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.017','admin','ZKEASOFT','2018-05-21 23:46:13.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (330,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:13.017','admin','ZKEASOFT','2018-05-21 23:46:13.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (331,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.017','admin','ZKEASOFT','2018-05-21 23:46:13.017');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (332,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (333,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.020','admin','ZKEASOFT','2018-05-21 23:46:13.020');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (334,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (335,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.023','admin','ZKEASOFT','2018-05-21 23:46:13.023');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (336,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.027','admin','ZKEASOFT','2018-05-21 23:46:13.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (337,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.027','admin','ZKEASOFT','2018-05-21 23:46:13.027');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (338,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (339,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.030','admin','ZKEASOFT','2018-05-21 23:46:13.030');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (340,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (341,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','<zone>','admin','ZKEASOFT','2018-05-21 23:46:13.033','admin','ZKEASOFT','2018-05-21 23:46:13.033');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (342,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:13.037','admin','ZKEASOFT','2018-05-21 23:46:13.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (343,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</zone>','admin','ZKEASOFT','2018-05-21 23:46:13.037','admin','ZKEASOFT','2018-05-21 23:46:13.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (344,'0846a33e56bf45d5aae602ef40d87444','068c85b8de8744e7a81b1d1010583308','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:13.037','admin','ZKEASOFT','2018-05-21 23:46:13.037');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (345,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.127','admin','ZKEASOFT','2018-05-21 23:46:15.127');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (346,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.130','admin','ZKEASOFT','2018-05-21 23:46:15.130');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (347,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (348,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.133','admin','ZKEASOFT','2018-05-21 23:46:15.133');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (349,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.137','admin','ZKEASOFT','2018-05-21 23:46:15.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (350,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.137','admin','ZKEASOFT','2018-05-21 23:46:15.137');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (351,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (352,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.140','admin','ZKEASOFT','2018-05-21 23:46:15.140');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (353,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (354,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (355,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:15.143','admin','ZKEASOFT','2018-05-21 23:46:15.143');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (356,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.147','admin','ZKEASOFT','2018-05-21 23:46:15.147');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (357,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.147','admin','ZKEASOFT','2018-05-21 23:46:15.147');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (358,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (359,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:15.150','admin','ZKEASOFT','2018-05-21 23:46:15.150');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (360,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.153','admin','ZKEASOFT','2018-05-21 23:46:15.153');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (361,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:15.157','admin','ZKEASOFT','2018-05-21 23:46:15.157');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (362,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','<zone>','admin','ZKEASOFT','2018-05-21 23:46:15.160','admin','ZKEASOFT','2018-05-21 23:46:15.160');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (363,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:15.167','admin','ZKEASOFT','2018-05-21 23:46:15.167');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (364,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</zone>','admin','ZKEASOFT','2018-05-21 23:46:15.167','admin','ZKEASOFT','2018-05-21 23:46:15.167');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (365,'1dae90cf6a8547538cc0c369b9943c01','9ce910ba45a24fd2af804d6d0de7bba3','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:15.173','admin','ZKEASOFT','2018-05-21 23:46:15.173');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (366,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.317','admin','ZKEASOFT','2018-05-21 23:46:19.317');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (367,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.320','admin','ZKEASOFT','2018-05-21 23:46:19.320');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (368,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (369,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.323','admin','ZKEASOFT','2018-05-21 23:46:19.323');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (370,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.327','admin','ZKEASOFT','2018-05-21 23:46:19.327');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (371,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (372,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:19.330','admin','ZKEASOFT','2018-05-21 23:46:19.330');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (373,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.337','admin','ZKEASOFT','2018-05-21 23:46:19.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (374,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.337','admin','ZKEASOFT','2018-05-21 23:46:19.337');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (375,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (376,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:19.340','admin','ZKEASOFT','2018-05-21 23:46:19.340');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (377,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (378,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.343','admin','ZKEASOFT','2018-05-21 23:46:19.343');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (379,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.347','admin','ZKEASOFT','2018-05-21 23:46:19.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (380,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:19.347','admin','ZKEASOFT','2018-05-21 23:46:19.347');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (381,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (382,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:19.350','admin','ZKEASOFT','2018-05-21 23:46:19.350');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (383,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','<zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (384,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (385,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</zone>','admin','ZKEASOFT','2018-05-21 23:46:19.353','admin','ZKEASOFT','2018-05-21 23:46:19.353');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (386,'1dae90cf6a8547538cc0c369b9943c01','534e07f396b14b7584a833d270356cb7','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:19.357','admin','ZKEASOFT','2018-05-21 23:46:19.357');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (387,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.740','admin','ZKEASOFT','2018-05-21 23:46:28.740');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (388,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.747','admin','ZKEASOFT','2018-05-21 23:46:28.747');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (389,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:28.747','admin','ZKEASOFT','2018-05-21 23:46:28.747');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (390,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (391,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.753','admin','ZKEASOFT','2018-05-21 23:46:28.753');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (392,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (393,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:28.760','admin','ZKEASOFT','2018-05-21 23:46:28.760');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (394,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (395,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.763','admin','ZKEASOFT','2018-05-21 23:46:28.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (396,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.767','admin','ZKEASOFT','2018-05-21 23:46:28.767');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (397,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:28.770','admin','ZKEASOFT','2018-05-21 23:46:28.770');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (398,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.780','admin','ZKEASOFT','2018-05-21 23:46:28.780');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (399,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.783','admin','ZKEASOFT','2018-05-21 23:46:28.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (400,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (401,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:28.790','admin','ZKEASOFT','2018-05-21 23:46:28.790');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (402,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.797','admin','ZKEASOFT','2018-05-21 23:46:28.797');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (403,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:28.797','admin','ZKEASOFT','2018-05-21 23:46:28.797');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (404,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','<zone>','admin','ZKEASOFT','2018-05-21 23:46:28.803','admin','ZKEASOFT','2018-05-21 23:46:28.803');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (405,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (406,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</zone>','admin','ZKEASOFT','2018-05-21 23:46:28.810','admin','ZKEASOFT','2018-05-21 23:46:28.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (407,'0846a33e56bf45d5aae602ef40d87444','c5b97a044c9844529fc48383d141e73c','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:28.817','admin','ZKEASOFT','2018-05-21 23:46:28.817');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (408,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.763','admin','ZKEASOFT','2018-05-21 23:46:34.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (409,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.767','admin','ZKEASOFT','2018-05-21 23:46:34.767');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (410,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-0','admin','ZKEASOFT','2018-05-21 23:46:34.770','admin','ZKEASOFT','2018-05-21 23:46:34.770');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (411,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (412,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.773','admin','ZKEASOFT','2018-05-21 23:46:34.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (413,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.777','admin','ZKEASOFT','2018-05-21 23:46:34.777');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (414,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-1','admin','ZKEASOFT','2018-05-21 23:46:34.777','admin','ZKEASOFT','2018-05-21 23:46:34.777');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (415,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (416,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.783','admin','ZKEASOFT','2018-05-21 23:46:34.783');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (417,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.797','admin','ZKEASOFT','2018-05-21 23:46:34.797');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (418,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-2','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (419,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.800','admin','ZKEASOFT','2018-05-21 23:46:34.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (420,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.803','admin','ZKEASOFT','2018-05-21 23:46:34.803');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (421,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.810','admin','ZKEASOFT','2018-05-21 23:46:34.810');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (422,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-3','admin','ZKEASOFT','2018-05-21 23:46:34.817','admin','ZKEASOFT','2018-05-21 23:46:34.817');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (423,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (424,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-21 23:46:34.820','admin','ZKEASOFT','2018-05-21 23:46:34.820');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (425,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','<zone>','admin','ZKEASOFT','2018-05-21 23:46:34.827','admin','ZKEASOFT','2018-05-21 23:46:34.827');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (426,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','ZONE-4','admin','ZKEASOFT','2018-05-21 23:46:34.827','admin','ZKEASOFT','2018-05-21 23:46:34.827');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (427,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</zone>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (428,'0846a33e56bf45d5aae602ef40d87444','4b889b430aa44517bbad38a57c745cc5','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-21 23:46:34.833','admin','ZKEASOFT','2018-05-21 23:46:34.833');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (429,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.443','admin','ZKEASOFT','2018-05-22 11:31:26.443');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (430,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (431,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:26.453','admin','ZKEASOFT','2018-05-22 11:31:26.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (432,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.457','admin','ZKEASOFT','2018-05-22 11:31:26.457');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (433,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.457','admin','ZKEASOFT','2018-05-22 11:31:26.457');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (434,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.457','admin','ZKEASOFT','2018-05-22 11:31:26.457');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (435,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:26.460','admin','ZKEASOFT','2018-05-22 11:31:26.460');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (436,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (437,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.463','admin','ZKEASOFT','2018-05-22 11:31:26.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (438,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.467','admin','ZKEASOFT','2018-05-22 11:31:26.467');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (439,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:26.467','admin','ZKEASOFT','2018-05-22 11:31:26.467');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (440,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.470','admin','ZKEASOFT','2018-05-22 11:31:26.470');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (441,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (442,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.473','admin','ZKEASOFT','2018-05-22 11:31:26.473');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (443,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:26.477','admin','ZKEASOFT','2018-05-22 11:31:26.477');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (444,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (445,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:26.480','admin','ZKEASOFT','2018-05-22 11:31:26.480');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (446,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (447,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:26.483','admin','ZKEASOFT','2018-05-22 11:31:26.483');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (448,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:26.487','admin','ZKEASOFT','2018-05-22 11:31:26.487');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (449,'0846a33e56bf45d5aae602ef40d87444','e371628aa3ff46c3a167f121c7a3f32b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:26.487','admin','ZKEASOFT','2018-05-22 11:31:26.487');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (450,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.517','admin','ZKEASOFT','2018-05-22 11:31:31.517');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (451,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.520','admin','ZKEASOFT','2018-05-22 11:31:31.520');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (452,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:31.537','admin','ZKEASOFT','2018-05-22 11:31:31.537');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (453,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.547','admin','ZKEASOFT','2018-05-22 11:31:31.547');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (454,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.560','admin','ZKEASOFT','2018-05-22 11:31:31.560');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (455,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.580','admin','ZKEASOFT','2018-05-22 11:31:31.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (456,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:31.593','admin','ZKEASOFT','2018-05-22 11:31:31.593');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (457,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.607','admin','ZKEASOFT','2018-05-22 11:31:31.607');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (458,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.617','admin','ZKEASOFT','2018-05-22 11:31:31.617');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (459,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (460,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:31.620','admin','ZKEASOFT','2018-05-22 11:31:31.620');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (461,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.627','admin','ZKEASOFT','2018-05-22 11:31:31.627');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (462,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.640','admin','ZKEASOFT','2018-05-22 11:31:31.640');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (463,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.653','admin','ZKEASOFT','2018-05-22 11:31:31.653');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (464,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:31.663','admin','ZKEASOFT','2018-05-22 11:31:31.663');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (465,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.677','admin','ZKEASOFT','2018-05-22 11:31:31.677');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (466,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:31.687','admin','ZKEASOFT','2018-05-22 11:31:31.687');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (467,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','<zone>','admin','ZKEASOFT','2018-05-22 11:31:31.700','admin','ZKEASOFT','2018-05-22 11:31:31.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (468,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:31.713','admin','ZKEASOFT','2018-05-22 11:31:31.713');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (469,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</zone>','admin','ZKEASOFT','2018-05-22 11:31:31.723','admin','ZKEASOFT','2018-05-22 11:31:31.723');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (470,'0846a33e56bf45d5aae602ef40d87444','a3d735320eb04c63bf3258d7b44e30f8','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:31.737','admin','ZKEASOFT','2018-05-22 11:31:31.737');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (471,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (472,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.700','admin','ZKEASOFT','2018-05-22 11:31:35.700');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (473,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:35.713','admin','ZKEASOFT','2018-05-22 11:31:35.713');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (474,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.723','admin','ZKEASOFT','2018-05-22 11:31:35.723');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (475,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.737','admin','ZKEASOFT','2018-05-22 11:31:35.737');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (476,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.750','admin','ZKEASOFT','2018-05-22 11:31:35.750');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (477,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:35.763','admin','ZKEASOFT','2018-05-22 11:31:35.763');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (478,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.773','admin','ZKEASOFT','2018-05-22 11:31:35.773');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (479,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.787','admin','ZKEASOFT','2018-05-22 11:31:35.787');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (480,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.800','admin','ZKEASOFT','2018-05-22 11:31:35.800');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (481,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:35.813','admin','ZKEASOFT','2018-05-22 11:31:35.813');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (482,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.823','admin','ZKEASOFT','2018-05-22 11:31:35.823');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (483,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.837','admin','ZKEASOFT','2018-05-22 11:31:35.837');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (484,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.850','admin','ZKEASOFT','2018-05-22 11:31:35.850');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (485,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:35.860','admin','ZKEASOFT','2018-05-22 11:31:35.860');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (486,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.873','admin','ZKEASOFT','2018-05-22 11:31:35.873');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (487,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:35.887','admin','ZKEASOFT','2018-05-22 11:31:35.887');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (488,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','<zone>','admin','ZKEASOFT','2018-05-22 11:31:35.897','admin','ZKEASOFT','2018-05-22 11:31:35.897');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (489,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:35.910','admin','ZKEASOFT','2018-05-22 11:31:35.910');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (490,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</zone>','admin','ZKEASOFT','2018-05-22 11:31:35.923','admin','ZKEASOFT','2018-05-22 11:31:35.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (491,'0846a33e56bf45d5aae602ef40d87444','9d84599edb2443439a53e8d906815c8f','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:35.937','admin','ZKEASOFT','2018-05-22 11:31:35.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (492,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<div class="main custom-style container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (493,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.900','admin','ZKEASOFT','2018-05-22 11:31:39.900');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (494,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (495,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.903','admin','ZKEASOFT','2018-05-22 11:31:39.903');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (496,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>
    <div class="container main"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.907','admin','ZKEASOFT','2018-05-22 11:31:39.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (497,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.907','admin','ZKEASOFT','2018-05-22 11:31:39.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (498,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:39.907','admin','ZKEASOFT','2018-05-22 11:31:39.907');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (499,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.910','admin','ZKEASOFT','2018-05-22 11:31:39.910');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (500,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div><div class="additional row"><div class="additional col-md-8"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (501,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.913','admin','ZKEASOFT','2018-05-22 11:31:39.913');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (502,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:39.917','admin','ZKEASOFT','2018-05-22 11:31:39.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (503,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.917','admin','ZKEASOFT','2018-05-22 11:31:39.917');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (504,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div><div class="additional col-md-4"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.920','admin','ZKEASOFT','2018-05-22 11:31:39.920');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (505,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.923','admin','ZKEASOFT','2018-05-22 11:31:39.923');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (506,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:39.927','admin','ZKEASOFT','2018-05-22 11:31:39.927');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (507,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.930','admin','ZKEASOFT','2018-05-22 11:31:39.930');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (508,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div><div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (509,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','<zone>','admin','ZKEASOFT','2018-05-22 11:31:39.933','admin','ZKEASOFT','2018-05-22 11:31:39.933');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (510,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:39.937','admin','ZKEASOFT','2018-05-22 11:31:39.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (511,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</zone>','admin','ZKEASOFT','2018-05-22 11:31:39.937','admin','ZKEASOFT','2018-05-22 11:31:39.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (512,'0846a33e56bf45d5aae602ef40d87444','a8d73e29b1eb4b7ea43420e2b6bf2c1b','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:39.937','admin','ZKEASOFT','2018-05-22 11:31:39.937');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (513,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.950','admin','ZKEASOFT','2018-05-22 11:31:43.950');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (514,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (515,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:43.953','admin','ZKEASOFT','2018-05-22 11:31:43.953');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (516,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.957','admin','ZKEASOFT','2018-05-22 11:31:43.957');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (517,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.957','admin','ZKEASOFT','2018-05-22 11:31:43.957');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (518,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.963','admin','ZKEASOFT','2018-05-22 11:31:43.963');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (519,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:43.967','admin','ZKEASOFT','2018-05-22 11:31:43.967');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (520,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.967','admin','ZKEASOFT','2018-05-22 11:31:43.967');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (521,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.970','admin','ZKEASOFT','2018-05-22 11:31:43.970');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (522,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.973','admin','ZKEASOFT','2018-05-22 11:31:43.973');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (523,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:43.977','admin','ZKEASOFT','2018-05-22 11:31:43.977');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (524,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.980','admin','ZKEASOFT','2018-05-22 11:31:43.980');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (525,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (526,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.983','admin','ZKEASOFT','2018-05-22 11:31:43.983');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (527,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:43.987','admin','ZKEASOFT','2018-05-22 11:31:43.987');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (528,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.987','admin','ZKEASOFT','2018-05-22 11:31:43.987');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (529,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (530,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','<zone>','admin','ZKEASOFT','2018-05-22 11:31:43.990','admin','ZKEASOFT','2018-05-22 11:31:43.990');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (531,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:43.993','admin','ZKEASOFT','2018-05-22 11:31:43.993');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (532,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</zone>','admin','ZKEASOFT','2018-05-22 11:31:43.997','admin','ZKEASOFT','2018-05-22 11:31:43.997');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (533,'1dae90cf6a8547538cc0c369b9943c01','be49e3ec3b5a4f5eae3edaf8ba64f185','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:44.000','admin','ZKEASOFT','2018-05-22 11:31:44.000');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (534,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<div class="main custom-style container-fluid" style=""><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.357','admin','ZKEASOFT','2018-05-22 11:31:49.357');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (535,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.360','admin','ZKEASOFT','2018-05-22 11:31:49.360');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (536,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-0','admin','ZKEASOFT','2018-05-22 11:31:49.373','admin','ZKEASOFT','2018-05-22 11:31:49.373');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (537,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.387','admin','ZKEASOFT','2018-05-22 11:31:49.387');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (538,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div><div class="container main custom-style"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.397','admin','ZKEASOFT','2018-05-22 11:31:49.397');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (539,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.410','admin','ZKEASOFT','2018-05-22 11:31:49.410');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (540,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-1','admin','ZKEASOFT','2018-05-22 11:31:49.427','admin','ZKEASOFT','2018-05-22 11:31:49.427');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (541,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.440','admin','ZKEASOFT','2018-05-22 11:31:49.440');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (542,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div><div class="additional row"><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.453','admin','ZKEASOFT','2018-05-22 11:31:49.453');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (543,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.463','admin','ZKEASOFT','2018-05-22 11:31:49.463');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (544,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-2','admin','ZKEASOFT','2018-05-22 11:31:49.477','admin','ZKEASOFT','2018-05-22 11:31:49.477');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (545,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.490','admin','ZKEASOFT','2018-05-22 11:31:49.490');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (546,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div><div class="additional col-md-6"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.503','admin','ZKEASOFT','2018-05-22 11:31:49.503');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (547,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.517','admin','ZKEASOFT','2018-05-22 11:31:49.517');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (548,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-3','admin','ZKEASOFT','2018-05-22 11:31:49.527','admin','ZKEASOFT','2018-05-22 11:31:49.527');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (549,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.540','admin','ZKEASOFT','2018-05-22 11:31:49.540');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (550,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>
    <div class="main container-fluid"><div class="additional row"><div class="additional col-md-12"><div class="colContent row"><div class="additional zone">','admin','ZKEASOFT','2018-05-22 11:31:49.553','admin','ZKEASOFT','2018-05-22 11:31:49.553');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (551,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','<zone>','admin','ZKEASOFT','2018-05-22 11:31:49.567','admin','ZKEASOFT','2018-05-22 11:31:49.567');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (552,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','ZONE-4','admin','ZKEASOFT','2018-05-22 11:31:49.580','admin','ZKEASOFT','2018-05-22 11:31:49.580');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (553,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</zone>','admin','ZKEASOFT','2018-05-22 11:31:49.593','admin','ZKEASOFT','2018-05-22 11:31:49.593');
INSERT INTO [CMS_LayoutHtml] ([LayoutHtmlId],[LayoutId],[PageId],[Html],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (554,'1dae90cf6a8547538cc0c369b9943c01','1c93b61690ce49d7af8e1ea45ac58eb9','</div></div></div></div></div>','admin','ZKEASOFT','2018-05-22 11:31:49.607','admin','ZKEASOFT','2018-05-22 11:31:49.607');
INSERT INTO [Carousel] ([ID],[Title],[Height],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'??????',NULL,NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.203','admin','ZKEASOFT','2016-03-27 15:17:54.050');
INSERT INTO [CarouselWidget] ([ID],[CarouselID]) VALUES ('19350341920b4827bf2a4e458ad24a58',1);
INSERT INTO [CarouselWidget] ([ID],[CarouselID]) VALUES ('41e075ab1b89453388494a539eec55b9',1);
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'???1',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg1.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.217','admin','ZKEASOFT','2016-03-27 15:17:54.053');
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'???2',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg2.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.570','admin','ZKEASOFT','2016-03-27 15:17:54.420');
INSERT INTO [CarouselItem] ([ID],[Title],[CarouselID],[CarouselWidgetID],[TargetLink],[ImageUrl],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'???3',1,NULL,'http://www.zkea.net/zkeacms/donate','~/images/bg3.jpg',NULL,1,'admin','ZKEASOFT','2016-03-27 15:14:17.573','admin','ZKEASOFT','2016-03-27 15:17:54.433');
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('8df64186d2fd4d63a9f9bb3b6e34cd2a',1,NULL);
INSERT INTO [ArticleTypeWidget] ([ID],[ArticleTypeID],[TargetPage]) VALUES ('de8d94fd51cb4e73b00518dbb2f134d3',1,NULL);
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'??????',NULL,0,NULL,1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:18.000','admin','ZKEASOFT','2017-10-15 18:18:33.430');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'????????????',NULL,1,'company',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:24.000','admin','ZKEASOFT','2018-08-15 15:31:38.347');
INSERT INTO [ArticleType] ([ID],[Title],[Description],[ParentID],[Url],[Status],[SEOTitle],[SEOKeyWord],[SEODescription],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (3,'????????????',NULL,1,'industry',1,NULL,NULL,NULL,'admin','ZKEASOFT','2016-03-10 13:50:29.000','admin','ZKEASOFT','2018-08-15 15:31:42.810');
INSERT INTO [ArticleSummaryWidget] ([ID],[SubTitle],[Style],[DetailLink],[Summary]) VALUES ('8c5b69f614b641c0a5f7a8e318de8df3','ZKEACMS ??????','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core ?????????.Net Core???????????????CMS??????????????????????????????????????????????????????????????????????????????????????????<a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>???</p>
<p>ZKEACMS??????????????????????????????ZKEACMS????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????ZKEACMS???</p>
<p>ZKEACMS?????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????.Net Core 2.0</p>
<h3>?????????</h3>
<p>???????????????<a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>????????????</h3>
<p>??????ZKEACMS??????????????????</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>');
INSERT INTO [ArticleSummaryWidget] ([ID],[SubTitle],[Style],[DetailLink],[Summary]) VALUES ('cd21a7bf68b44f6e8d178b153288a26e','ZKEACMS ??????','bs-callout-default','https://github.com/SeriaWei/ZKEACMS.Core','<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS" target="_blank" rel="noopener">ZKEACMS</a> Core ?????????.Net Core???????????????CMS??????????????????????????????????????????????????????????????????????????????????????????<a href="http://www.zkea.net/licenses" target="_blank" rel="noopener">http://www.zkea.net/licenses</a>???</p>
<p>ZKEACMS??????????????????????????????ZKEACMS????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????ZKEACMS???</p>
<p>ZKEACMS?????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????.Net Core 2.0</p>
<h3>?????????</h3>
<p>???????????????<a href="http://demo.zkea.net" target="_blank" rel="noopener">http://demo.zkea.net</a></p>
<h3>????????????</h3>
<p>??????ZKEACMS??????????????????</p>
<p><a href="http://www.zkea.net/cloud" target="_blank" rel="noopener">http://www.zkea.net/cloud</a></p>
<p></p>');
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('416c5402962b41548c83fabaa5492b42',1,'~/article/detail',1,5);
INSERT INTO [ArticleListWidget] ([ID],[ArticleTypeID],[DetailPageUrl],[IsPageable],[PageSize]) VALUES ('ca9f8809636d448cbd4f3beb418465b3',1,'~/article/detail',1,5);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('3aa8b53e7ad143ff818855a7abcb3fdd',NULL);
INSERT INTO [ArticleDetailWidget] ([ID],[CustomerClass]) VALUES ('e8fd1019bab045e5927ec30abaaa1aba',NULL);
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (1,'ZKEACMS ??????','ZKEACMS?????????EasyFrameWork????????? ASP .NET MVC ??????????????? .Net CMS???  ZKEACMS???????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????','ZKEACMS','ZKEACMS?????????EasyFrameWork????????? ASP .NET MVC ??????????????? .Net CMS???  ZKEACMS???????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',1,2,NULL,'<h3>??????</h3>
<p><a href="https://github.com/SeriaWei/ASP.NET-MVC-CMS">ZKEACMS</a>?????????<a href="http://www.zkea.net/easyframework">EasyFrameWork</a>????????? ASP .NET MVC ??????????????? .Net CMS???</p>
<p>ZKEACMS???????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS??????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>ZKEACMS????????????????????????????????????????????????</p>
<h4><a href="http://www.zkea.net/zkeacms/createpage" target="_blank" rel="noopener">???????????????????????????</a></h4>
<h3>????????????</h3>
<p>Microsoft VisualStudio 2013</p>
<p><span>.Net FrameWork 4.0???MVC 4</span></p>
<p>Microsoft Sql Server 2008 ??????</p>
<h3>????????????</h3>
<p>ZKEACMS ?????????ASP.NET MVC???????????????CMS?????????????????????ZKEACMS??????????????????</p>
<p>??????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????</p>
<h3>????????????</h3>
<p>ZKEACMS????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>????????????????????????????????????????????????????????????????????????ZKEASOFT??????????????????<a href="http://www.zkea.net/zkeacms/document" target="_blank" rel="noopener">??????</a></p>
<h3>????????????</h3>
<p>ZKEACMS???????????????BootStrap?????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???PC????????????????????????????????????????????????????????????????????????</p>
<h3>????????????</h3>
<p>????????????????????????????????????????????????????????????&ldquo;???&rdquo;???&ldquo;???&rdquo;??????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>????????????????????????????????????????????????????????????12???????????????????????????????????????12???????????????????????????????????????????????????&ldquo;????????????&rdquo;???????????????????????????????????????</p>
<h3>????????????</h3>
<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<h3>????????????</h3>
<p>ZKEACMS ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>????????????????????????????????????????????????????????????????????????</p>
<p><span>ZKEACMS ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</span></p>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:41:19.000','zkeacms','admin','ZKEASOFT','2017-11-19 23:41:19.000','admin','ZKEASOFT','2019-04-24 21:52:43.060');
INSERT INTO [Article] ([ID],[Title],[Summary],[MetaKeyWords],[MetaDescription],[Counter],[ArticleTypeID],[Description],[ArticleContent],[Status],[ImageThumbUrl],[ImageUrl],[IsPublish],[PublishDate],[Url],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES (2,'ZKEACMS For .Net Core','??????CMS???ZKEACMS Core??? ???ZKEACMS??? .Net Core ???????????????????????? CMS???????????? .Net Core ?????????????????????????????? Windows, MAC OS, Linux, Docker ????????????','ZKEACMS .Net Core','??????CMS???ZKEACMS Core??? ???ZKEACMS??? .Net Core ???????????????????????? CMS???????????? .Net Core ?????????????????????????????? Windows, MAC OS, Linux, Docker ????????????',1,3,NULL,'<h3>???????????????</h3>
<p>??????CMS???ZKEACMS Core??? ???ZKEACMS??? .Net Core ???????????????????????? CMS???????????? .Net Core ?????????????????????????????? Windows, MAC OS, Linux, Docker ????????????</p>
<p>????????????CMS???ZKEACMS Core?????????????????????????????????ZKEACMS??????????????????????????????????????????????????????????????????????????????ZKEACMS???????????????????????????</p>
<p><img src="http://ww4.sinaimg.cn/mw690/005zTNGqgw1f5e6o2kejlg30dw08an3g.gif" /></p>
<h3>?????? .NET Core</h3>
<p>.NET Core ???.NET Framework?????????????????????????????????????????????????????????????????????????????? (Windows???Mac OSX???Linux) ????????????????????????????????? (Application Framework)????????????????????????&nbsp;FreeBSD&nbsp;??? Alpine ???????????????????????????????????????????????????????????????????????????????????????????????????????????? .NET ??????&nbsp;Mono&nbsp;?????????</p>
<p>ZKEACMS Core ??????ASP .NET MVC Core ???????????????ZKEACMS v2.3?????????????????????MVC4????????????????????????MVC Core???????????????????????????tag helper???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? .NET Core ???????????????</p>
<h3>????????????</h3>
<p>??????.Net Core??????????????????CMS???ZKEACMS Core??? ?????????????????????????????? ASP .NET Core??????????????????????????????????????????????????????????????? Core ?????????CMS???????????????????????????????????????????????????????????????</p>
<p>??????????????? .Net core CMS ??????????????????????????????????????????????????? ZKEACMS ??????????????????????????????????????????????????? ??????CMS???ZKEACMS Core??? ??????????????????</p>
<h3>Entity Framework Core</h3>
<p>Entity Framework Core&nbsp;??? Entity Framework ??? .Net Core ?????????Entity Framework&nbsp;???????????? ADO.NET ????????????????????????????????????????????? (O/R Mapping) ?????????????????????Entity Framework??????????????????????????????????????????????????????????????????SQLServer???MySql???ORACLE???SQLite??????</p>
<p>??????CMS???ZKEACMS Core??? ?????????EasyFramework??????ORM????????????????????? Entity Framework Core ????????????????????????????????????????????????????????????????????????Entity Framework????????????????????????????????????????????????????????????????????????</p>
<h3>????????????????????????</h3>
<p>??????CMS???ZKEACMS Core??? ?????????????????????????????????????????????????????????DLL?????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<p>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>
<div>
<div>
<div>
<div>
<p></p>
</div>
</div>
</div>
</div>',1,'/images/09.jpg',NULL,1,'2017-11-19 23:53:23.000','zkeacms-core','admin','ZKEASOFT','2017-11-19 23:53:16.000','admin','ZKEASOFT','2019-04-24 21:52:54.903');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Animation_Widget_FadeInUp','false',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.083',NULL,NULL,'2022-07-29 20:42:10.083');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EnableCustomerAccount','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:31.003',NULL,NULL,'2022-07-29 20:42:31.003');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('EnableResponsiveDesign','true',NULL,NULL,1,NULL,NULL,'2020-03-14 11:32:07.333',NULL,NULL,'2020-03-14 11:32:07.333');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('ExpandAllPage','true',NULL,NULL,1,'admin','ZKEASOFT','2018-04-11 17:01:47.230','admin','ZKEASOFT','2018-04-11 17:01:47.233');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('Favicon','~/favicon.ico',NULL,NULL,NULL,'admin','ZKEASOFT','2017-03-19 20:57:33.627','admin','ZKEASOFT','2017-03-19 20:57:33.627');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('OuterChainPicture','false',NULL,NULL,1,NULL,NULL,'2019-07-31 12:09:28.430',NULL,NULL,'2019-07-31 12:09:28.430');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('PinNavigation','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:10.387',NULL,NULL,'2022-07-29 20:42:10.387');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_Logo_Mini','/images/logo_min.png',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.370','admin','ZKEASOFT','2021-03-06 22:16:20.370');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('SiteInformation_SiteName','ZKEASOFT',NULL,NULL,1,'admin','ZKEASOFT','2021-03-06 22:16:20.310','admin','ZKEASOFT','2021-03-06 22:16:20.310');
INSERT INTO [ApplicationSetting] ([SettingKey],[Value],[Title],[Description],[Status],[CreateBy],[CreatebyName],[CreateDate],[LastUpdateBy],[LastUpdateByName],[LastUpdateDate]) VALUES ('UseImageCaptcha','true',NULL,NULL,1,NULL,NULL,'2022-07-29 20:42:39.537',NULL,NULL,'2022-07-29 20:42:39.537');
COMMIT;

