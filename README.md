## Instructors ##
[Grant Erickson](https://github.com/GrantErickson), [Meg Woodford](https://github.com/mmwoodfo), and [Mark Michaelis](https://github.com/MarkMichaelis)
For general questions, we suggest asking in Teams so that others can help as well. We encourage people to work together and collaborate. Please feel free to help your fellow students out. Though it is possible to privately message people directly, as much as possible, we encourage open discussion on the main chat so that others can benefit as well.
You can also send an e-mail to: [EWU-Instructors@IntelliTect.com](EWU-Instructors@IntelliTect.com) for final grade or general questions.

## GitHub Information
We will be using GitHub for all class lectures and assignments. All work will be submitted via GitHub pull requests.
* Please sign up for a GitHub if you do not already have one. 
* You can get added benefits for signing up for a free [GitHub Student Developer Pack](https://education.github.com/pack).  
* **IMPORTANT** : Please fill out this **[form](https://docs.google.com/forms/d/e/1FAIpQLSdlpBMhof2gxL64vrqLg9o0Uc4di5lYejpo10XUBiMoyb-Xxg/viewform?usp=sf_link)** with your GitHub information. This is used by us so we can appropriately grade assignments.

## Prerequisites
This class will build on CSCD-371. It will be very difficult if you have not taken the CSCD-371 that was offered in Winter. We will be building on much of what was presented in that class. Here are the things the instructors will assume you already know in addition to all standard classes taken by juniors and seniors in the CS program as of Winter.
* Good grasp of the C# programming language
* Good familiarity with web development (as taught in the CSCD-371 Winter) HTML, CSS, JS
* Familiarity with development environments like Visual Studio and VS Code
* Understanding of how Git source control works with the ability to perform standard development workflows
* Understanding of GitHub especially doing pull requests
* Good grasp of programming theory: OOP, data structures, etc.

## Tech Stack References

### Front End
* [VueJs 3](https://vuejs.org/)
* [VuetifyJs 3](https://vuetifyjs.com/en/)
* [TypeScript](https://www.typescriptlang.org/docs/) ([Style Guide](https://google.github.io/styleguide/tsguide.html))
* [Vitest](https://vitest.dev/)
* [npm](https://docs.npmjs.com/)
* [Axios](https://axios-http.com/docs/intro) (Calling APIs)
* Interesting reading about creating a front-end framework: https://18alan.space/posts/how-hard-is-it-to-build-a-frontend-framework.html#reactivity
* [Responsiveness and Media Queries](https://engineering.kablamo.com.au/posts/2023/media-queries-and-responsive-design/)

### Back End
* [.NET](https://dotnet.microsoft.com/en-us/)
* [C#](https://learn.microsoft.com/en-us/dotnet/csharp/) ([Essential C# Web Site](https://essentialcsharp.com/home))
* [ASP.NET 7.0](https://docs.microsoft.com/en-us/aspnet/core/?view=aspnetcore-7.0)
* [Entity Framework 7](https://learn.microsoft.com/en-us/ef)
* [ASP.NET Core Identity](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/identity?view=aspnetcore-7.0&tabs=visual-studio)

### DevOps
* [Azure](https://docs.microsoft.com/en-us/azure/?product=popular)
* [Azure AppService](https://docs.microsoft.com/en-us/azure/app-service/)
* [Azure SQL](https://docs.microsoft.com/en-us/azure/azure-sql/)
* [GitHub Actions](https://docs.github.com/en/actions)
* [GitHub Actions YAML](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
* [SignalR](https://docs.microsoft.com/en-us/aspnet/core/signalr/introduction?view=aspnetcore-7.0) (Potentially)
* [Azure Deployment Action](https://learn.microsoft.com/en-us/azure/static-web-apps/build-configuration?tabs=github-actions#build-and-deploy)

## General Information:
* **Office Hours**: Office hours are available before class on Tuesday's and Thursdays starting at 1 PM. To ensure that an instructor will be available, please schedule an appointment 24-hours beforehand by sending a meeting request email to EWU-Instructors@IntelliTect.com. Alternative times may be available upon request.
* A list of topics covered in class will be recorded by students in the [**Lectures**](Lectures.md) markdown file. It will also contain a general schedule for the class, but this may be adjusted based on pacing.

### Homework and Assignments
* Homework will be hard and will take time to complete. Do not put it off. 
* Start homework early and come to class with questions. Starting homework late is a recipe for disaster and pain.
* All assignments, due dates, and grading information are in [**Assignments**](Assignments.md)
* Homework will be done in pairs. If you are experiencing issues, please contact an instructor.
* Code reviews are done individually, each student should review code that is not done by them or their partner.
* The day homework is initially due we will typically go over the assignment in class. (no guarantees)

## Computer Setup ##
- [Visual Studio Code](https://code.visualstudio.com/) This can largely be used as an alternative to Visual Studio. Many of us also use it as our catch-all lightweight text/code editor.
- [Azure for Students](https://azure.microsoft.com/en-us/free/students/) You will need to sign up for the free Azure student credits. This provides a place for us to deploy our application.
The course work will be cross-platform. However, in class the instructors will be working on Windows in both VSCode (for front end) and Visual Studio (for back end).
- [nodejs & npm (LTS)](https://nodejs.org/en/download/) Node Package Manager will provide tooling for bulding our front end web site.

### Recommended ###
- [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/). Version 17.5 or later. The community edition is fine, though we believe most students should have access to higher SKUs with EWU's MSDN (this assumption may be wrong). Lab computers should have Professional already installed. This will install .NET 7.0.
- [GitKraken](https://gitkraken.keboo.dev/) Though you can do all of the git interaction from within Visual Studio or on the command line, GitKraken is free for open source work. It also provides a nice graphical version of the commit history so you can see how various commits and branches relate. 
- [GitHub Student Developer Pack](https://education.github.com/students) Lots of great development tools and resources. The JetBrains products ReSharper (a plugin for Visual Studio), and Rider (a full C# IDE) are great tools for helping you write better code. 

### VS Code Extensions used in class ###
- [Vitest](https://marketplace.visualstudio.com/items?itemName=ZixuanChen.vitest-explorer) Unit testing extension
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) code formatting extension
- [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) Vue tooling
- [TypeScript vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin) Vue TypeScript Tooling
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

### Troubleshooting issues in VS Code
- Make sure you run `npm i` or `npm ci`
- Make sure all the extensions are installed
- Restart VS Code
- Pull the repo again and see if the unmodified version works

### Azure Issues
If you are having issues gettig Azure setup correctly and everything working, please check out this document: https://github.com/IntelliTect-Samples/EWU-CSCD379-2023-Spring/blob/main/SettingUpAzure.md
