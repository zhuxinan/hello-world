/*
SQLITE Backup
Source Server Version: 3.8.8
Source Database: main
Date: 2019/4/25 17:49:07
*/


-- ----------------------------
--  Table structure for "blogcategory"
-- ----------------------------
DROP TABLE IF EXISTS "blogcategory";
CREATE TABLE "blogcategory" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(20) NOT NULL);
INSERT INTO sqlite_sequence VALUES ("blogcategory",4);

-- ----------------------------
--  Table structure for "blogs_bloguser"
-- ----------------------------
DROP TABLE IF EXISTS "blogs_bloguser";
CREATE TABLE "blogs_bloguser" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user" varchar(20) NOT NULL);
INSERT INTO sqlite_sequence VALUES ("blogs_bloguser",9);

-- ----------------------------
--  Table structure for "comment"
-- ----------------------------
DROP TABLE IF EXISTS "comment";
CREATE TABLE "comment" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "post_id" integer NOT NULL REFERENCES "post" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "blogs_bloguser" ("id") DEFERRABLE INITIALLY DEFERRED, "pub_date" datetime NOT NULL);
INSERT INTO sqlite_sequence VALUES ("comment",10);

-- ----------------------------
--  Table structure for "post"
-- ----------------------------
DROP TABLE IF EXISTS "post";
CREATE TABLE "post" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(50) NOT NULL, "content" text NOT NULL, "views" integer NOT NULL, "author_id" integer NOT NULL REFERENCES "blogs_bloguser" ("id") DEFERRABLE INITIALLY DEFERRED, "category_id" integer NOT NULL REFERENCES "blogcategory" ("id") DEFERRABLE INITIALLY DEFERRED, "pub_date" datetime NOT NULL);
INSERT INTO sqlite_sequence VALUES ("post",5);

-- ----------------------------
--  Table structure for "post_tags"
-- ----------------------------
DROP TABLE IF EXISTS "post_tags";
CREATE TABLE "post_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "post_id" integer NOT NULL REFERENCES "post" ("id") DEFERRABLE INITIALLY DEFERRED, "tags_id" integer NOT NULL REFERENCES "tags" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO sqlite_sequence VALUES ("post_tags",14);

-- ----------------------------
--  Table structure for "tags"
-- ----------------------------
DROP TABLE IF EXISTS "tags";
CREATE TABLE "tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(20) NOT NULL);
INSERT INTO sqlite_sequence VALUES ("tags",7);

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO "blogcategory" VALUES (1,'python 后端');
INSERT INTO "blogcategory" VALUES (2,'web 前端');
INSERT INTO "blogcategory" VALUES (3,'Django 开发');
INSERT INTO "blogcategory" VALUES (4,'Django 教程');
INSERT INTO "blogs_bloguser" VALUES (1,'大牧');
INSERT INTO "blogs_bloguser" VALUES (2,'追梦人物');
INSERT INTO "blogs_bloguser" VALUES (3,'小飞虎');
INSERT INTO "blogs_bloguser" VALUES (4,'Hopetree');
INSERT INTO "blogs_bloguser" VALUES (5,'root');
INSERT INTO "blogs_bloguser" VALUES (6,'zxa');
INSERT INTO "blogs_bloguser" VALUES (7,'小飞飞');
INSERT INTO "blogs_bloguser" VALUES (8,'乌鸦坐飞机');
INSERT INTO "blogs_bloguser" VALUES (9,'尼古拉斯赵四');
INSERT INTO "comment" VALUES (1,'非常好，希望多发',2,2,'2019-04-24 02:35:00');
INSERT INTO "comment" VALUES (2,'真好，虽然不知道具体哪好，咱也不敢说，咱也不敢问',2,2,'2019-04-24 02:35:00');
INSERT INTO "comment" VALUES (3,'真棒',1,3,'2019-04-24 03:11:00');
INSERT INTO "comment" VALUES (4,'没看懂，不会',1,4,'2019-04-24 03:12:00');
INSERT INTO "comment" VALUES (5,'有没有简单点的',1,4,'2019-04-24 03:12:00');
INSERT INTO "comment" VALUES (6,'哈哈哈哈哈',2,2,'2019-04-24 11:32:22.196953');
INSERT INTO "comment" VALUES (7,'uuuuuuuuuuu',2,2,'2019-04-24 11:33:07.353558');
INSERT INTO "comment" VALUES (8,'真棒，看完就想学了',5,8,'2019-04-24 12:28:18.540260');
INSERT INTO "comment" VALUES (9,'不错',4,8,'2019-04-24 12:28:36.347428');
INSERT INTO "comment" VALUES (10,'呃......讲的不是很明确',3,7,'2019-04-24 12:28:56.991230');
INSERT INTO "post" VALUES (1,'Python Django 的学习路径','Python 基础
当你学到 Django 的时候，我们默认你已经有了 Python 基础。如果你没有 Python 基础，或者认为自己还需要在 Python 基础上多花一些时候，你可以选择从以下三本书着手。

《Python编程 从入门到实践》 （Python Crash Course: A Hands-On, Project-Based Introduction to Programming）这本书的作者就是 Django 项目的维护者之一。本书在学习 Python 基础的同时，可以学到一些 Python 的最佳实践（当然谈到最佳实践，有更多的进阶书籍的选择）。推荐本书的另一个原因是书籍质量不错，在美国亚马逊的 Python programming 排行榜上荣获“Best seller“，194个读者综合评分为4.4的高分（满分5分）。
《"笨办法"学Python(第3版)》 (Learn Python the Hard Way) 这本书简称“LPHW”，是经久不衰的 Python 入门书。本书强调的是肌肉记忆，强调的是编程犹如弹吉他，需要亲手实践、加强肌肉记忆。如果你对编程也没有太多概念，这本书会比较轻松的带你入门，增强你的编程自信心。
《Python 基础教程》(Beginning Python: From Novice to Professional) 如果在这三本中选一本必看的基础书，个人更偏好、也更推荐这一本。作者对基础知识的讲解清晰明了，内容简单但是并不肤浅。讲解过程通畅，基本不存在费解的情况。代码小片段实例比比皆是，马上就可以动手实践来理解概念，可以让人更容易记得住，学习的效果也是相当好。较深的概念有延展的接口，提供方向供后期自己去扩展。值得一提的是，目前这本书中文翻译是仍然是2009年英文版的 Python 2.7，而今年（2017年）4月Apress出版社继续推出了该书最新的第三版，已经使用 Python 3 的版本（暂无中文版）。作者 Magnus Lie Hetland 在 2006 年开始写作第一版至今，时隔11年还能继续推出最新版，而且内容质量靠谱，实在难能可贵。

Django 与 Python 开发环境问题
注意：目前在维护 Django 版本为：Django 1.8（长期支持版，LTS），Django 1.10，Django 1.11（最新版，长期支持版，LTS，也是最后一个支持 Python2的版本）。
Django 1.8 官方只维护到 2018 年 4 月，Django 官方会继续为其提供相应的安全补丁。考虑到 Django 1.8 版本即将过期，因此建议从目前开始新项目都采用 Django 1.11 开发。Django 1.11 将是最后一个兼容 Python 2 的 Django 版本，将维护至 2020 年 4 月。Django 2.0 即将在 2017 年 12 月推出，从 2.0 版本开始，Django 将只支持 Python 3。Python 3 逐渐成为 Python 开发的趋势，类似 Instagram 等大公司近两年逐渐向 Python 3 迁移。
Python 3 最引人注目的是其原生异步特点（Python 3.4 实验性引入原生异步，在 Python 3.6 正式成为原生内置标准库），但是 Python 的异步生态仍未大规模广泛建立。虽然 Python 异步 web 开发框架有老牌、稳定、庞大的 Twisted（2000年初开发）、以及 2009 年 Facebook 开源出来的 Tornado，但是当前 Python web 开发的主流仍旧是包括 Django 与 Flask 在内的 Python web 同步框架。异步开发特点是一旦选择异步，整条技术栈都要换成异步相关的库（这也意味着难度大、风险高），否则异步可能就会被阻塞。对比来看，目前异步对性能提升，还没有强大到吸引知名公司去使用 Python 进行异步开发。也许 Mozilla 可能会是第一批进行 Python 异步开发的公司。Mozilla（开发火狐浏览器 Firefox 的公司）的后台目前使用 Flask 开发，据其后台开发工程师 Tarek Ziade 在 2017 年 6 月的演讲称，后续的后台系统可能尝试用 aiohttp 进行开发。
如果学习资料是这些版本以前的版本，比如 Django 1.7，则不建议再学习已经过时的资料。对于书籍是否已经过时，Two Scoops 的作者 Daniel R. Greenfeld（也是Django的项目维护者）有一个书籍清单供参考（Current Django Books）。
Django 的版本以及 Python 开发环境至关重要，请在最开始学习 Django 的时候就引起重视。由于 Python、Django以及其他第三方包的版本不同，有时候会产生与学习资料不一样的结果。建议学习过程中注意两点：

为每一个项目建立虚拟环境，建立相对独立的开发环境
严格按照学习资料的版本进行开发。注意是 Python 2 还是 Python 3，Django 的版本、以及第三方包的版本号。

Django 基础
1. 视频
推荐使用慕课网的两门免费在线视频课程作为入门：

django初体检
django入门与实践

这两门课基本涵盖了 Django 最核心、同时也是最常用的部分，他们会给你建立一个 Django 的整体概念，便于消除你对 Django 的陌生感和恐惧感。
如果想进一步详细的了解 Django，有个综合性的教程名叫

《Django 企业开发实战》

该教程包含 gibbook 电子书（免费）以及视频部分（收费）。该教程之所以比较推荐，作者是搜狐的胡阳（博客地址）。阳哥长期在搜狐大量实际使用 Django，而且对源码比较熟悉，所以该教程讲得深入浅出，有不少独到的见解。
2. 文档
在有了视频的感性认识之后，建议马上阅读完 Django 文档的新手入门6个部分的内容，并亲手实践让代码能跑起来。文档是最权威也是最全面的 Django 参考资料。


Getting started Django 1.11 英文原版文档的新手入门部分。

Django 中文文档 1.8 Django 1.8 的中文文档（gitbook在线书）。

3. 书籍与博客
3.1 英文


Mastering Django: Core: The Complete Guide to Django 1.8 LTS 这本书就是大名鼎鼎的 Django Book 的最新版本。本书前7章是连贯的学习教程，可作为入门教材，后面的章节以讲解概念为主。《中文版的 Django Book》 使用的是 Django 1.1 版本，已经严重过时，中文版本仅供参考。作者的主页是  djangobook.com。

Hello Web App 作者之前主要从事前段工作，以一个新手的视角来完成本书。整书叙述流畅，以及跟着书完成代码。作者还有一本后续的书籍 Hello Web App: Intermediate Concepts ，内容稍微深一些。

另外有人也经常推荐以下内容，供参考：


Tango With Django: A beginner''s Guide to Web Development With Python / Django 1.9 值得注意的是这本书被列为 Two Scoops 的作者列为过时书籍。

Django Girls Tutorial Django Girl严格来说已经相当于是一个商业组织，因为该组织在卖周边、做培训，但是入门教程还是不错的，内容基本与 Tango with Django 类似。最近还推出该入门教程的扩展部分。

3.2 中文


自强学堂：Django 教程 内容详实免费。值得一提的是作者使用 Django 建站，完全是在实践 Django 的使用，而且作者从2015年至今一直在根据 Django 版本升级而更新教学内容，从最初的 Django 1.6 更新到了 Django 1.10。作者称最新版本的 Django 1.11 内容马上就要推出。



Django Girls 教程 Django Girls 的中文版，使用 Django 1.8。



追梦人物的博客 以 Django 1.10 为基础开发博客到部署的完整教程。

Django 进阶
1. 视频
中文视频内容有很多，但是从内容的深度、广度、教学实践、教学质量来看，推荐慕课网的强力 Django 内容。


强力django+杀手级xadmin打造上线标准的在线教育平台 慕课网付费课程。虽然收费，但是课程质量上佳。内含一个 refresh 的小项目和一个较大的系统项目，涉及 Django 的内容较广，完成后可以达到上线标准。常被誉为“Django课程的良心之作”。

英文视频中，美国的 Justin Mitchel 长期专注于做 Django 培训。他的部分教学视频也放在 YouTube 上。推荐三门系列课程，分别是完成一个基本博客，增加复杂功能，到使用 django-rest-framework。内容详实，值得一看。

Try Django 1.9
Advancing the Blog
Blog API with Django Rest Framework

2. 书籍

Two Scoops of Django：目前有两个版本 Two Scoops of Django: Best Practices for Django 1.11 和 Two Scoops of Django: Best Practices for Django 1.8 。这本书在 Django 的名气也是非常大，基本可以说影响过大多数 Django 开发人员，如果要进阶称为 Django 专业开发者，这本书是绕不过去的必看书籍。内容主要涵盖 Django 的最佳实践。
Django By Example 在进阶的课程中，本书算是不错的。虽然一些章节（比如第7章）部分代码仍然存在 bug，但是一方面作者正在该书主页不断进行代码更正，另一方面也是对中国读者最好的是，这本书已经由同在简书的 @夜夜月 进行了全书翻译：《Django By Example》中文版。
Django Unleashed 内容覆盖较广，很多内容在其他书籍中并没有提及，比如密码的hash与加密等。但是没有实战项目。
《Python Web 测试驱动方法》 虽然测试驱动的开发方法（Test-Driven Development，TDD）并不是每个项目都会采用，但是测试的思想与方法还是值得去掌握。Python 作为一门动态语言，没有静态类型检测的情况下，测试的重要性就显得尤为重要。本书使用 Django 的整个开发流程作为实例，作者不仅讲了开发过程单元测试和 Selenium 测试，同时也把部署的内容也覆盖到。内容始于 Django，但不仅仅是 Django，相信使用其他框架的 Python 开发者也可以从中获益匪浅。

3. 博客

Vitor Freitas: Simple is better than complex 作者是旅居芬兰的巴西人，博客上有76篇关于 Python、Django 以及网络开发的文字。文章质量较高，可以邮件订阅。
Huang Huang 的博客 之所以提到这个博客，主要因为作者认真写了三篇关于《High Perfomance Django》的阅读笔记：笔记一、笔记二、笔记三。从数据库优化、缓存、容灾、后台视图完善，这些一点一滴的内容都是 Django 项目开发过程中迟早会遇到的瓶颈，看一下这些内容也许就会对后面的解决方案有更深的理解。比如『话说Django orm性能为什么比原生的mysqldb慢』这篇文章就遇到了后台报表页面打开很慢的坑，这也是完善提高 Django 性能的地方。

Django RESTful API
Django 的 REST 化主要是两个第三方包：django-rest-framework 和 django-tastypie。虽然后者开发时间较早，但是最推荐的是前者，即 django-rest-framework。该框架内容更全，调试也方便。
1. 文档
django-rest-framework 的文档分为英文和中文。英文就是原版的网站，中文有两个作者的翻译，但都是只翻译了入门部分。

英文版文档
中文文档有两个，可以对照看：中文文档 Roy 版本 以及 中文文档 Eason版本。

2. 视频

Vue+Django REST framework 打造生鲜电商项目 可能是目前中文 Django 教学视频中最好的课程，教学时间长度与内容都有相当的保证。视频作者 Bobby 详细阐述了自己对的 Django 的理解，可以让人知道多种递进式 rest API 开发方式。得益于 Bobby 精益求精的态度，个人觉得干货的程度即使与国外的内容比较也是不逞多让。另外再加上与 Vue 前端的整体交互综合开发，已经可以初步满足一个中小企业的网络解决方案。
Build Your Own Backend REST API using Django REST Framework 作者是英国人 Mark Winterbottom，编程专业，而且讲课细致到位。



Blog API with Django Rest Framework 仍然是之前提到的美国人 Austin Mitchel 的 YouTube 课程。

3. 书籍与博客


《轻量级Django》 英文版是Lightweight Django: Using REST, WebSockets, and Backbone，严格来说这不是一本完全讲 rest-framework 的书，而是讲解如何从传统的 Django 过渡到前后端分离 Django 。

Building RESTful Python Web Services 内容涉及 Python 三大网络框架：Django，Flask以及Tornado。



Haiiiiiyun：Django REST 框架 V3 教程，讲到 rest 的7门课程。

Django 业界最新信息


Django: Under The Hood 专注于 Django 的内容，虽然著名的 PyCon 经常请 Django 专家去演讲，但是 Django: Under The Hood 基本都是 Django 的大牛，比如2016年压轴演讲是邀请了 Instgram 的后端去讲解 INS 如何用 Django 做成了如此规模巨大的社交图片分享网站。该组织近两年的演讲内容都分享在 YouTube 上可以找到。Django Under The Hood：YouTube地址

PyCon 也非常关注 Django 的发展。Django 并非完美无缺，在网络技术高速发展的今天，Django 也需要及时的进化以适应形势。在 PyCon 上，对 Django 热爱程序员们，提出了尖锐的 Django 问题，随后也有新的解决方案出来。的有代表性的演讲包括：


Why Django Sucks - PyCon SE 2015 作者提出 Django 在某些方面跟不上网络技术的发展趋势，提出了自己的三点建议。

Reinventing Django for the Real-Time Web - PyCon 2016 作者是 Django 的 Channel 部分的开发者，专注于 Socket 的包装与编程，以实现 Django 的服务器推送、异步 Socket 等功能。

Building Dynamic Dashboards With Django and D3 - PyCon US 2016 比较好的把 Django 与 React 以及 D3 结合在一起为警局提供数据看板项目。



修改记录
2017-10-23 更新内容

Python 基础部分：不再推荐《Python学习手册(第4版)》。基础书籍数量保持三本，增加推荐新书籍，本书不再推荐。

被删除内容：

《Python学习手册(第4版)》 （Learning Python, 5th Edition）本书中文是第四版，英文已经更新到第五版。该作者长期从事 Python 教育，他知道学习者通常会问什么问题，所以讲解也是比较详细。如果你需要快速入门 Python ，不推荐这本书。但是相信你在 Python 进阶过程中，迟早会遇到一些很 Pythonic 的问题，比如：字典的三种创建方式、列表推导式（list comprehension）和装饰器（decorator）。你可以在这里快速找到详细的讲解。作者的另外还有两本高质量的 Python 书值得一读：Python Pocket Reference: Python In Your Pocket (Pocket Reference (O''Reilly)) 以及Programming Python: Powerful Object-Oriented Programming。


Python 基础部分：增加推荐《Python 基础教程》
Django 进阶部分，2. 书籍：增加《Python Web 测试驱动方法》。
Django 进阶部分，3. 博客：增加 "Huang Huang 的博客"。
Django RESTful API，2. 视频：增加 "Vue+Django REST framework 打造生鲜电商项目"。
修改部分格式错误。',27,1,4,'2019-04-24 13:53:39.370988');
INSERT INTO "post" VALUES (2,'顶尖教程学习Python初学者的Django框架','Django是一个用Python编写的开源Web框架。它创建于大约12年前，但在2017年12月，Django 2发布了一系列全新的特性和功能！
Django对于Web开发人员来说是一个了不起的框架，因为它提供了数据库驱动的网站所需的基础结构，这些网站具有用户身份验证，内容管理，联系表单，文件上载等。您可以使用Django框架并利用已构建的这些组件，而不是从头开始创建所有这些功能，而是将时间集中在开发Web应用程序上。基于评级和评论和质量由专家策划的顶级django教程列表。让我们从以下课程开始学习python django框架。
<canvas class="progressiveMedia-canvas js-progressiveMedia-canvas" width="75" height="27" style="display: block; vertical-align: baseline; position: absolute; top: 0px; left: 0px; width: 368px; height: 136.891px; margin: auto; box-sizing: border-box; visibility: hidden; opacity: 0; backface-visibility: hidden; transition: visibility 0s linear 0.5s, opacity 0.1s ease 0.4s;"></canvas>
[图片上传失败...(image-eaeaa1-1553353537538)]
1.尝试Django 1.11 // Python Web开发
使用Django构建Web应用程序//＃1 Web开发框架Python。
Python是地球上最好的编程语言之一。原因如下：

它经过验证和可扩展
它是开源的
物联网和Raspberry Pi
它正在引领未来技术的变革

经验证和可扩展：Python运行Instagram的后端。它还运行着Pinterest，NASA，Mozilla以及无数其他人。它可以扩展。
物联网（IoT）和Raspberry PI Connected设备正在蓬勃发展。连接这些设备的最简单方法是使用Raspberry Pi并在Python中编写代码。Python是多功能的，因此它使用Raspberry Pi控制真实世界的对象变得简单。
如果你使用Python，你很可能需要安全存储并且可靠的互联网连接数据。这就是Django的用武之地.Django是一个Web框架，可以处理所有数据并比任何Web框架更好地处理它。
Django是Python的第一个Web框架，原因是：对初学者来说这很容易，但对于专业人士来说却足够强大。Instagram通过Django使用Python。Pinterest也是如此。和美国宇航局。和Mozilla。它可能不是他们使用的唯一技术，但它是......它们的骨干。
如果Python是底层技术背后的未来，那么Django将是它的近亲，如果你喜欢Python，Django很快就会成为你的朋友。
2.尝试Django 1.9 | 构建博客并学习Python的＃1库
逐步学习构建Django博客Web应用程序，并在当今的现实世界中获取您的项目。
三个项目教程，帮助您本月启动您的项目。本课程通过构建高级和现代博客向您介绍Django的基础知识; 用Python编写的＃1 Web框架。
在Blog API部分学习Django Rest Framework以构建功能强大的RESTful API服务。

Django很棒，很容易上手。分步教程是帮助您了解工作流程，让您开始做一些真实的事情，然后我们的目标是让您提问......“我为什么要做X？”或“我该怎么做？”这些是你不会不知道的问题。毕竟，问题会导致答案。

这是来自我们的编码企业家Youtube频道的免费版的Try Django 1.9教程系列。高分辨率视频下载也包括在内。
<canvas class="progressiveMedia-canvas js-progressiveMedia-canvas" width="75" height="56" style="display: block; vertical-align: baseline; position: absolute; top: 0px; left: 0px; width: 1246px; height: 934.5px; margin: auto; box-sizing: border-box; visibility: hidden; opacity: 0; backface-visibility: hidden; transition: visibility 0s linear 0.5s, opacity 0.1s ease 0.4s;"></canvas>
[图片上传失败...(image-ad97fb-1553353537538)]
3. Django 2和Python | 终极Web开发训练营
建立三个完整的网站，学习和前端Web开发，并使用DigitalOcean在线发布您的网站。
我相信我们做得最好。因此，在整个课程中，您将获得编码测验和挑战，以便您测试刚学到的内容。这种格式可以让你真正学习Django，而不仅仅是像机器人一样。
我们将在本课程中使用Python，因此如果您之前从未使用过Python，我们将从python复习开始，以帮助您提高速度（无需其他python经验）。
然后我们将开始制作三个完整的网站：
1 - 字数统计网站：一个简单的网站，用于计算一段文本中最常用的字词。你将学到如何：

安装Django
创建一个新项目
使用Django的URL路由
提交并处理HTML表单数据

2 - 个人投资组合：创建您自己的投资组合，向潜在的雇主展示您的简历，之前的项目和功能齐全的博客。你将学到如何：

将应用添加到您的项目中
使用包括SQLite和Postgres在内的数据库
访问管理面板
创建超级用户
创建虚拟环境
使用Bootstrap 4创建一个响应式网站
使用静态和媒体文件

3 - 产品寻找克隆：制作精彩网站的简化版，以分享新的技术产品。你将学到如何：

使用身份验证系统（注册，登录，注销）
重用模板
创建模型关系
通过Iconic添加图标

我还将引导您完成Git，这对于开发人员来说是一个很棒的工具，可以让您创建多个版本的代码。我将解释为什么这有用并帮助您理解为什么要使用它。
此外，我将向您展示如何获取您在本课程中所做的项目，并通过虚拟专用服务器在Web上实时发布这些项目。
4. Tweetme | 使用Django逐步构建类似Twitter的应用程序
通过构建一个像Twitter一样的真实项目，逐步学习Django 1.10，jQuery和Bootstrap。
社交媒体改变了我们彼此沟通的方式。社交媒体背后的力量使我们能够一起做出惊人的事情。究竟背后是什么？嗯..它是简单的Web应用程序概念，可以应用于您可以构建的所有和任何Web应用程序。
在本课程中，我们将教您Twitter的工作原理。现在，Twitter有数百名开发人员，所以我们实际构建的是Twitter曾经是什么的基础，通过学习更多Django的方式，这是绝对最简单的事情。
我们要学习什么：

Ajax + jQuery到“Tweet”消息
直接标记用户（@user）
使用Hashtags（#newtag）
集成Bootstrap
在Bootstrap模式中使用Ajax表单
Django Rest Framework
关注用户（通过Ajax）
喜欢帖子（通过Ajax）
转发帖子（通过Ajax）
基于类的视图
自定义模板标签
计算表单中的字符
基本注册
以及更多！

<canvas class="progressiveMedia-canvas js-progressiveMedia-canvas" width="75" height="45" style="display: block; vertical-align: baseline; position: absolute; top: 0px; left: 0px; width: 1246px; height: 767.531px; margin: auto; box-sizing: border-box; visibility: hidden; opacity: 0; backface-visibility: hidden; transition: visibility 0s linear 0.5s, opacity 0.1s ease 0.4s;"></canvas>
[图片上传失败...(image-d77d7b-1553353537536)]
5. Python电子商务| 构建Django电子商务Web应用程序
通过学习逐步构建自己的电子商务应用程序来启动您的业务。
本课程利用Python使用Django框架构建功能齐全的电子商务网站和应用程序。

Django专为速度而设计。功能和开发时间。
一些顶级科技公司建立在Django上：Instagram和Pinterest以一对夫妇为名。
Django是用Python编写的，因此它可以帮助您进一步掌握Python。
来自世界各地的开发人员的大力支持。遇到python或Django中的问题？快速谷歌搜索可能会产生答案（如果没有，我会尽力帮助你）。

6.使用Django REST Framework构建自己的后端REST API
最后，在这个完整的速成课程中创建App +功能完备的用户数据库，以构建REST API。
欢迎阅读如何使用Django，Django REST Framework，Python，Vagrant，VirtualBox，Atom和ModHeaders从头开始构建REST API的综合课程。
本课程中讲授的技能对于创造用户喜爱且不能没有的成功产品至关重要。
Facebook，Instagram，Snapchat，你的名字。这些应用程序都有自己的后端REST API，每天处理数百万个呼叫请求。如果没有后端REST API，您无法构建成功的应用程序。
它不仅对您正在构建的任何应用程序或MVP至关重要 - 您在本课程中学到的技能将使您成为工作场所中的kickass开发人员。
如果您是一名前端开发人员，并且参加了本课程，您将能够与您的同事“讲话”并了解所有项目的“幕后”，增加您的信心并赢得尊重你的同龄人
如果您是一名后端开发人员，本课程将帮助您提高当今市场上一些最受欢迎的技术的技能：Django，Django REST Framework和Python。
如果您是新手开发人员或刚刚开始您的职业生涯，本课程将为您提供一个非常实际的基础来建立您的投资组合并增加您的收入潜力。
在本课程中，您将学习构建自己的REST API的最佳实践方法。
您将学习如何创建本地开发服务器并在每一步中测试代码。
无论您是希望获得后端开发的一些经验，还是希望创建一个REST API来将您的应用程序理念变为现实，那么本课程适合您。
在本课程结束时，我保证您将构建一个功能齐全的REST API，可以处理：

创建和更新用户配置文件。
登录和身份验证。
发布状态更新。
查看状态更新Feed。

7. Django Core | 核心Django概念参考指南
深入探讨用Python编写的强大Django框架背后的核心概念。在Python 3中使用Django 1.10。
在本课程中，我们将深入探讨各种Django概念，为主题提供全面的指导，包括：

Django模型
模型实例方法和属性
模型级字段验证
模型如何映射到数据库和主键
Django表单和表单集
在Django中将数据与外键相关联
使用Django主机处理子域
表格验证
模型表格
基于功能的视图（FBV）
基于类的视图（CBV）
Django视图中的CRUD（创建检索更新删除列表）
Django模板
模板继承
模板快捷方式和过滤器
Django翻译
以及更多！

<canvas class="progressiveMedia-canvas js-progressiveMedia-canvas" width="75" height="41" style="display: block; vertical-align: baseline; position: absolute; top: 0px; left: 0px; width: 300px; height: 168px; margin: auto; box-sizing: border-box; visibility: hidden; opacity: 0; backface-visibility: hidden; transition: visibility 0s linear 0.5s, opacity 0.1s ease 0.4s;"></canvas>
[图片上传失败...(image-e7e79f-1553353537536)]
8. Django的终极初学者指南1.11
了解如何使用Django和Python制作和发布网站。我们将制作三个完整的应用程序并在线发布一个。
欢迎来到Django的Ultimate Beginner''s Guide。如果您是Django的新手，或者已经迷失在线教程，那么这就是您的选择。我将带你从一个绝对的初学者到实际创建三个完整的Django网站。我们还将介绍如何发布您的网站。
本课程以Python Refresher开头。Django是一个用Python编写的Web框架。如果您是Python新手，或者只是有点生疏，本节将尽快让您快速上手。您不需要成为Python专家来制作Django网站，但需要基础知识。在Python Refresher中，我将教你一个新的概念，向你展示一些例子，然后向你展示一个编码挑战，以确保你已经理解了这个概念。
我们将制作的三个网站如下：

猪拉丁语翻译 - 一个简单的两页网站，将任何文本转换为猪拉丁语！创建这个网站将教你Django的基础知识。
您的个人博客 - 不要使用WordPress或Tumblr分享您的想法; 制作自己的博客！本网站将教您如何使用数据库和数据模型。我们还将介绍如何使用静态和用户上传的图像！
Reddit Clone - 这是我们将在课程中制作的最先进，最复杂的网站。该网站主要关注创建用户帐户和身份验证，将教您本课程涵盖的更高级主题。

本课程涵盖哪些主要主题？

URL调度
基于功能和类的视图（FBV诉CBV）
如何开始一个新项目
如何在项目中创建应用程序以及它们为何如此重要
使用Virtualenv在虚拟环境中运行项目
在运行Ubuntu Linux的VPS（虚拟专用服务器）上发布站点
使用模板
调试
Gunicorn
处理GET和POST请求
使用数据库和模型
管理界面
静态和用户上传的图像
身份验证和用户帐户

9. Python和Django Full Stack Web Developer Bootcamp
学习使用HTML，CSS，Bootstrap，Javascript，jQuery，Python 3和Django构建网站。
欢迎使用Python和Django Full Stack Web Developer Bootcamp！在本课程中，我们将介绍使用Python，Django和更多Web技术构建网站所需了解的所有内容。
它将教您使用Python 3和Django构建出色的Web应用程序的最新技术。但我们不仅仅是教授这一点，我们还教授您需要了解的前端技术，包括HTML，CSS和Javascript。本课程可以为您提供一站式服务，满足您的一切需求！当您开始成为Web开发人员之旅时，它将作为您的许多问题的有用参考。
以下是本课程中主题的一小部分：

HTML5
CSS3
使用Javascript
jQuery的
Bootstrap 3和4
文档对象模型
蟒蛇
Django Basics
Django模板
Django表格
Django管理员自定义
ORM
基于类的视图
REST API
用户认证
还有更多！

10.尝试Django 1.10 | 创建URL缩短服务
Django是一个功能强大的Web框架，可以轻松构建Web应用程序，因此它是＃1 Python库的原因。
通常，主题包括：

我们如何使Kirr url缩短服务
Django项目设置
基于类的视图（和一些基于功能的视图）
模型，模型表单，表单，表单验证
覆盖模型保存方法
在Live Server上启动（通过Heroku）
直接在Django Fields上进行自定义验证
和更多

Django Framework（版本1.10）：Instagram和Pinterest等顶级网站使用的强大后端框架。Django使得使用功能强大的Web应用程序更容易用于所有类型的项目。Django是用Python编写的（并且是世界上最流行的Python库之一）。
Bootstrap（版本3.3）：一个功能强大的前端框架，被全球数千个站点使用。Bootstrap使得响应式Web应用程序变得更容易，因此它在任何移动设备和任何台式计算机上看起来都很棒。
Python 3：世界顶级编程语言之一。对于专家来说足够强大，对于初学者来说非常容易。为什么？它使用空格和换行符以及最少的特殊字符（例如！@＃$; *），这意味着它比大多数编程语言更接近英语。
我们所有的教程都有一个简单的目标：通过逐步培训让您真正快速地构建一些东西。
11. Django的项目：学习Django建筑项目

在本课程中，您将了解Django是什么，如何安装Django，如何使用它的终端，甚至如何使用这个惊人的框架设计网站和应用程序。
本课程涵盖的五个项目包括从简单到更复杂的网站和应用程序，您将掌握如何创建功能性网站，包括电子商务网站。
项目1：数据库驱动的网站 - 您将学习如何创建网站并将其与数据库绑定，以及如何在HTML页面中使用动态代码。
项目2：Django应用程序  - 您将学习如何构建一个完整的功能应用程序，以及如何使其与其他应用程序进行通信。
项目3：电子邮件发送表单  - 在此项目中，您将创建一个电子邮件表单，该表单将发送到真实的电子邮件帐户，以了解Django中的邮件如何工作。
项目4：电子商务网站  - 在这一个中，您将学习如何设计一个完整的电子商务网站，以及购物车和结账流程。
项目5：用户身份验证  - 您将学习如何进行用户身份验证，用户可以在其中注册，登录和修改其管理面板。',21,2,4,'2019-04-24 01:35:09.746548');
INSERT INTO "post" VALUES (3,'Django搭建个人博客','最近学着用Django搭建了个个人博客，目前域名正在备案中，现在把我这最近半个月的摸爬滚打经历记录下。

Django入门
Python核心编程
追梦人物的 Django博客教程
菜鸟Django教程
自强学堂Django教程
第一阶段：我首先看了Python核心编程中的Django章节，刚开始看的有些云里雾里。于是我去菜鸟教程那里按着Django教程的步骤搭建了下，菜鸟教程Django部分比较简单，之后对整体有了大致了解后再进一步看核心编程，发现能够比较容易理解了。

第二阶段：这里非常推荐追梦人物博主的博客教程，写的非常详细，按着博主的步骤就能够一步一步的把个人博客搭建起来，并且博主也提到了不少学习资料，对我们这些初学者能提供极大的帮助。另外自强学堂的内容我大致看了下，写的比较细，把个人博客搭建起来后再看可能效果会更好。

Django博客搭建
我这里就放一些我在搭建博客时用到的一些不错的资源。

Bootstrap模板：https://html5up.net/ 
这个网站提供了免费的响应式模板，我觉得很漂亮。

日历插件：http://www.jq22.com/yanshi11367 
这是我使用的日历插件，也可以在这个网站上找到一些别的datepicker的日历插件。

abowman:http://abowman.com/ 
这个网站很有趣，可以在网页上显示一个有趣的动图，有需要的可以自己插入网页。

域名和云服务器
我这里是在阿里云上学生优惠买的云服务器，域名也是直接在阿里云购买的。域名购买后记得要进行解析，还有备案（备案真的好麻烦）。

使用nginx后无法出现欢迎界面 
这个地方我摸索了好久，一直不知道怎么回事，在阿里云服务器上输入sudo service nginx start后，通过域名访问始终无法显示nginx的欢迎界面。后来发现原来是阿里云服务器的安全组设置中没有配置80端口。 
解决： 
进入阿里云ECS控制台->安全组->配置规则->公网入方向->快速配置规则->选中80端口和443端口，授权对象为0.0.0.0/0，确定即可。

在进展到用nginx和gunicorn步骤时始终出现欢迎界面。 
解决： 
进入/etc/nginx/sites-enabled删除default文件，原因是默认配置覆盖了我们的配置。

目前我还在慢慢学习中， 
待续… 
– 2018-09-12更新 
之前的django博客确实搭建成了，当时主要是为了成为一名网络开发工程师，摸索着完成了这一系列步骤。不过，现在转行成了一名算法工程师，也就没有心思继续维护之前的网站了。所以，为了简单，我采用了hexo+next+github的方式重新建立了新的博客，欢迎大家访问我的新的博客： 
hellodavid.top',3,2,4,'2019-04-24 12:06:45.786985');
INSERT INTO "post" VALUES (4,'面向对象的特征（封装、继承、多态）','面向对象的特征（封装、继承、多态）
封装
概念
把事物的一些特性封装成属性,将行为封装成方法

JAVA封装就是给类中成员添加访问权限来实现访问控制

访问权限修饰
private < 默认不写（注意不要添加default修饰）<  protected < public t

private ：最小权限，被它修饰的成员只能够在本类中可以访问到；

public  ：最大权限，任何地方和任何人都能访问；

优点
1.良好的封装能够减少耦合。

2.类内部的结构可以自由修改。

3.可以对成员变量进行更精确的控制。

4.隐藏信息，实现细节。

步骤
1.私有化字段与方法

2.给类中每一个字段提供set get 方法供外部访问

3.提供一个无参构造方法

继承
泛华：在多个子类的基础上面抽取共有属性的行为到一个父类中去
特化：在一个父类的基础上拓展子类特有的属性和行为，生成一个新的子类
1
2
继承的原则
父类存放共性，子类存放特性

继承的基本语法
class Animal{}
class Person extends Animal{} //目标就是为了继承到Animal,这个类型
A 就是B的父类; B是A的子类
1
2
3
子类继承父类中
1.非私有的字段及方法

2.父类特性

继承特点
1.单继承

2.多重继承

如果显式的类继承某一个类,该类继承隐式继承Object类,Object类是所有类的父类

多态
概念
编译时跟运行时类型不一致就产生了多态 .

父类类型的变量，存放子类类型的对象，可能存放子类类型的对象有多种可能

多态存在的前提：必须有继承关系

多态存在的三个必要条件
1.继承

2.重写

3.父类引用指向子类对象

当使用多态方式调用方法时，首先检查父类中是否有该方法，如果没有，则编译错误；如果有，再去调用子类的同名方法。

多态的好处
可以使程序有良好的扩展，并可以对所有类的对象进行通用处理。',2,1,1,'2019-04-24 12:09:20.784671');
INSERT INTO "post" VALUES (5,'为什么要学 Python？？？','如果你定期关注现今的科技发展，那么你可能想知道我为什么要写这篇文章告诉人们学习Python？
在2016年，Python取代Java成为高校中最受欢迎的语言，从那时起它受欢迎的程度就没有减退过。

但是，随着新时代的到来，Python正在不断发展壮大。如果你阅读编程和技术新闻或博客文章，那么你可能已经发现了Python的兴起，因为许多流行的开发人员社区，包括StackOverFlow和CodeAcademy都提到了Python作为主要编程语言的兴起。

但是，最大的问题是为什么程序员应该学习Python？

对于初学者来说很简单，从Python开始是最好的选择。因为它易于学习，功能强大，足以构建Web应用程序并自动化无聊的东西。实际上，几年前，脚本编写是学习Python的主要原因，这也是我被Python吸引并首选Perl的原因，而Perl是当时另一种流行的脚本语言。

对于有经验的程序员或已经了解Ruby，Java或JavaScript的人来说，学习Python意味着在你的工具库中获得一个新的强大工具，我还没有想出一个对工具说“不”的程序员，这是你学习一门新的编程语言时的正确查找方式。

正如经典的Automate the Boring Stuff with Python一书中所提到的，Python让你能够自动化琐碎的东西，让你专注于更多令人兴奋和有用的东西。

如果你是Java开发人员，那么也可以使用Groovy来实现这一点，但Groovy并未提供Python在API、库、框架和数据科学、机器学习以及Web开发等领域的广泛应用。



### 为什么2018年程序员应该学习Python？
如果你正在考虑学习Python但不确定为什么要学，那么这里有10个理由强调了2018年学习Python的好处。虽然，问题的答案取决于问问题的对象，对于初学者，学习Python是有道理的，因为学习Python主要原因是简便性。同样，对于想要进入数据科学和机器学习的有经验的程序员来说，学习Python是有意义的，因为它很快成为最常用的编程语言，并且有强大的API和可用于AI、数据科学和机器学习的库。

### 以下是在2018年学习Python的10个理由：

## 1.数据科学
这是许多程序员在2018年学习Python的一个最大的原因。我知道很多对投资银行的Java编程工作感到厌倦的朋友，由于令人兴奋的工作和高回报，他们正在Udemy学习Python来从事数据科学工作。

但是，是什么让Python成为数据科学和机器学习的首选语言？不久之前R语言不是最好的吗？我认为Python提供关于AI、DataScience、机器学习PyBrain，NumPy和PyMySQL的库和框架就是其中一个原因。

另一个原因是多样性，Python体验允许你比R做更多的事情，例如你可以创建脚本来自动化内容，进入Web开发等等。

如果你有兴趣在2018年成为数据科学家，我建议你查看关于Udemy的数据科学，深度学习和机器学习与Python课程。我已经购买了这门课程，这是一个非常棒的资源，有时花费不到10美元。

 




## 2.机器学习
这也是为什么程序员在2018年学习Python的另一个原因。机器学习的发展在过去的几年中是惊人的，它正在迅速改变我们周围的一切。

算法日渐复杂，最好的例子是谷歌的搜索算法，它现在可以通过聊天机器人来回答你所期望的答案，其中 Uber完全由算法驱动。

如果你对机器学习感兴趣，想要做一个宠物项目或只是想玩一玩，Python是唯一能让它变得简单的主要编程语言。

尽管Java中提供了机器学习库，但你会在Python中发现更多内容，因为开发人员社区更喜欢Python而不是其他任何关于数据科学和机器学习的内容。

如果你有兴趣使用Python进行Web开发，我建议你进一步在Udemy上查阅数据科学课程中的机器学习A-Z™：Hands-On Python和R。



 

## 3.网站开发
优质的开发是学习Python的另一个原因。它提供了许多好的库和框​​架，例如Django和Flask使Web开发变得非常简单。

PHP中需要花费数小时的任务可以在几分钟内完成。Python也被用于网络爬虫。像Reddit这样互联网上的一些流行网站是使用Python构建的。

如果你对使用Python进行Web开发感兴趣，我建议你加入JoshPortilla的Python和Django Full Stack Web Developer Bootcamp课程。

 



 

事实上，Udemy上有一个免费学习Python的课程。

## 4.简便
这是初学者学习Python的最大原因。当你第一次开始编程时，你肯定不希望从具有严格语法和奇怪规则的编程语言开始。

Python既可读又简单，它也更容易设置，而不需要处理任何类路径问题，如Java或C++等编译器问题。

只需安装Python就可以了。安装它时还会要求你在PATH中添加Python，这意味着你可以从计算机上的任何位置运行Python。

## 5.强大的社区
你需要一个社区来学习新技术，而在学习编程语言方面，朋友是你最大的资产，当你遇到问题时，就需要朋友的援助之手。

由于Google，你可以在几分钟内找到任何问题的解决方案，像StackOverflow这样的社区也将许多Python专家聚集在一起，来帮助新手。

## 6.库和框架
Python和Java之间的一个相似之处是可以执行任何操作的开源库，框架和模块的数量，它使应用程序开发变得非常容易。

想象一下，不用Java的Spring或Django和Flask创建一个Web应用程序，工作变得简单，因为只需要关注业务逻辑。

Python有满足不同需求的库。Django和Flask是Web开发中最受欢迎的两个，而NumPy和SciPy是用于数据科学的。

实际上，Python拥有最好的机器学习和数据科学库集合，如TensorFlow，Scikit-Learn，Keras，Pandas等等。

如果你想了解有关Python机器学习库的更多信息，我建议你加入Python for Data Science和Machine Learning Bootcamp课程，这是我最喜欢的课程之一。

## 7.自动化
由于某一次的脚本需求，我第一次了解了Python。我在使用通过UDP接收消息的应用程序时出现了问题，但我没有在日志中看到消息。

我想检查是否在该盒子和端口上接收了任何UDP流量，但我找不到一个方便的UNIX命令来做到这一点。

我的一位坐在我旁边的朋友正在学习Python，他在短短5分钟内编写了一个实用工具，使用了其中一个Python模块拦截UDP消息。

显然，我对他编写这样一个工具所花费的时间印象深刻，但这只是在编写脚本、工具和自动化时显示出了Python的强大功能。

如果你真的想知道Python对自动化有多大帮助，那么我最喜欢的就是使用Automate boring stuff with Python这本书，简直太棒了。



 

## 8.多用途
我喜欢Python的一个原因是它的瑞士军刀性质。它关系着方方面面，例如R在数据科学和机器学习方面表现得很好，而且在Web开发方面也无处不在。学习Python意味着你可以做很多事情。

你可以使用Django和Flask创建Web应用程序，可以使用NumPy，Scipy，Scikit-Learn和NLTK进行数据分析。

至少，你可以使用Python编写脚本来自动完成许多日常任务。

## 9.工作与成长
Python的发展速度非常快，持续时间很长，如果你刚刚开始编程生涯，那么学习一门不断发展的编程语言会很有意义。

它不仅可以帮助你快速找到工作，而且还可以加速你的职业发展。恕我直言，对于初学者来说，除了它的简便性，这应该是学习Python的最重要原因。

## 10.薪水
Python开发人员是收入最高的开发人员之一，特别是在数据科学，机器学习和Web开发方面。

平均而言，它们的报酬非常高，从70,000美元到150,000美元不等，具体取决于他们的经验，定位。

如果你有兴趣了解有关高薪技术工作的更多信息，我建议你查看一下2018年发布的关于软件工程师的10个最高薪技术工作的帖子。

学习Python的有用资源
如果你决定在2018年学习Python，那么这里有一些有用的Python书籍，课程和教程，可以在Python的美丽世界中开始你的旅程。

The Complete Python MasterClass
2．Python圣经 - 你需要用Python编程的一切

3．Pluralsight的Python基础知识

4.5门课程学习数据科学和机器学习

5.10个免费的Python编程电子书和PDF

6.2018年学习Python的五大课程

如果你仍然不确定学习Python，那么看看这个图像，它正确地展示了Python开发人员的生活：



这就是2018年学习Python的一些重要原因。正如我所说，了解当今世界的编程非常重要，如果你不知道编程，你就会遗漏一些东西，学习Python是开始学习编程的好方法。

对于已经了解Java或C++的程序员来说，学习Python不仅可以让你成为Polyglot程序员，还可以在工具库中为你提供一个强大的工具来编写脚本、创建一个Web应用程序，并在激动人心的数据科学和机器学习领域打开大门。

简而言之，如果你在2018年只学习一种编程语言，并且开始学习Python，The Complete Python MasterClass是最好的课程。

你可能喜欢的其他编程文章

前8个Python数据科学和机器学习库
10个面向程序员的机器学习和数据科学课程
你可以在2018年学习的10种编程语言
学习Scala编程语言的10个理由
5个面向数据科学家的免费R编程课程
Python程序员的前5个TensorFlow课程
学习数据科学和机器学习的五门课程
50+数据结构和算法面试问题
总结
感谢你看到了文章的最后...祝你的Python旅程好运！这肯定是一个很好的决定，并在不久的将来会得到回报。',11,2,1,'2019-04-24 12:11:52.424462');
INSERT INTO "post_tags" VALUES (1,1,1);
INSERT INTO "post_tags" VALUES (2,1,2);
INSERT INTO "post_tags" VALUES (3,1,7);
INSERT INTO "post_tags" VALUES (4,2,1);
INSERT INTO "post_tags" VALUES (5,2,2);
INSERT INTO "post_tags" VALUES (6,2,6);
INSERT INTO "post_tags" VALUES (7,2,7);
INSERT INTO "post_tags" VALUES (8,3,1);
INSERT INTO "post_tags" VALUES (9,3,5);
INSERT INTO "post_tags" VALUES (10,3,7);
INSERT INTO "post_tags" VALUES (11,4,2);
INSERT INTO "post_tags" VALUES (12,4,6);
INSERT INTO "post_tags" VALUES (13,5,2);
INSERT INTO "post_tags" VALUES (14,5,7);
INSERT INTO "tags" VALUES (1,'Django');
INSERT INTO "tags" VALUES (2,'Python');
INSERT INTO "tags" VALUES (3,'Java');
INSERT INTO "tags" VALUES (4,'前端');
INSERT INTO "tags" VALUES (5,'后端');
INSERT INTO "tags" VALUES (6,'随笔');
INSERT INTO "tags" VALUES (7,'文档');
