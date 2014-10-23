
##We are team Fyodor Dostoevsky:
- [stefan.sinapov]() ( Стефан Синапов )
- [LazarDL](https://github.com/LazarDL) ( Лазар Лазаров )
- [anilak](https://github.com/kalinalazarova1) ( Калина Лазарова )
- [adzhazhev](https://github.com/adzhazhev) ( Александър Джажев )

[GitHub](https://github.com/WebFormsTeamFyodorDostoevsky/ASP-NET-Web-Forms-Teamwork)

Our ASP.NET Web Forms application is a web site for free advertisements for exchange of services without the **mediation of money**.

It has user registration and supports three roles: **user**, **admin** and **banned**.

Each user profile can be edited and it supplies information for the user **skills**, **rating**, **comments** and **published advertisements**.

In the Administration menu accessible for the users in admin role is possible to **create/edit** categories, **edit/delete/update/ban/unban** users or **make them admins**.

It is also possible to **approve** advertisements or **edit** or **delete** them.

The site uses **Master page** for the common layout between the pages and **sitemap** for the main menu. The application also has different
menus for different roles of users.

For the database back-end is used SQL Server and Entity Framework with code-first.

We have **7 list views** with server-side paging and sorting and **2 repeaters** with paging. As a base for the application is used the Visual Studio Web Forms template. **Twitter Bootstrap** is used for the styling.

For the viewing of the details of the commented barter is used **Ajax Control Toolkit CollapsiblePanelExtender**. All the entered data is validated 
through asp validators elements and all the text field are properly escaped when visualized in the html. 

We have a user defined **ASCX user control** - **Notifier** which visualizes messages to the user and another one **ImageFromUrl**, which allows the user to give url of image from the web instead of uploading.

We use **file upload** in the user profiles and in the advertisements. 

**Statistics information** on the home page is **cached** to avoid excess http requests. 

#### [Read assignment...](https://github.com/WebFormsTeamFyodorDostoevsky/ASP-NET-Web-Forms-Teamwork/blob/master/Documentation/Assignment.md)