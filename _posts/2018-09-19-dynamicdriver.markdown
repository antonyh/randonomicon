---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: cucumber, testing, selenium
---
Selenium: Using different web drivers
=====================================

This code negates the need to compile the driver into the test, allowing
a system variable to control the class used. This example uses
PhantomJS.

    import org.openqa.selenium.WebDriver;

            //PhantomJS 1.9.8 works
            String driver = "org.openqa.selenium.phantomjs.PhantomJSDriver";

            Class cls = Class.forName(driver);
            webDriver = (WebDriver)cls.newInstance(); 
