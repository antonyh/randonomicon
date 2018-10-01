---
layout: post
title: Cucumber - Taking screenshots
date:   2018-09-19 22:25:52 +0100
categories: cucumber, java, testing
---
Cucumber - Taking screenshots
==================================

This code hooks an 'after' event to the tests, and if it fails a
screenshot is taken and put into the target folder. The example uses
millis-since-1970 to give a unique name.

    import org.openqa.selenium.WebDriverException;
    import org.openqa.selenium.OutputType;
    import org.openqa.selenium.TakesScreenshot;
    import cucumber.api.Scenario;
    import cucumber.api.java.After;
    import java.io.File;



        @After
        public void embedScreenshot(Scenario scenario){
            if(scenario.isFailed()){
                try {
                    File srcFile = ((TakesScreenshot) webDriver).getScreenshotAs(OutputType.FILE);
                    System.out.println("File:" + srcFile);
                    org.apache.commons.io.FileUtils.copyFile(srcFile, new File("target/screenshot-" + new java.util.Date().getTime() + ".png"));
                } catch (WebDriverException somePlatformsDontSupportScreenshots) {
                    System.err.println(somePlatformsDontSupportScreenshots.getMessage());
                } catch (java.io.IOException ioe){
                    System.err.println("ioexception: " + ioe.getMessage());
                }
            }
        }
