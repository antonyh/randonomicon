---
layout: post
title: Cucumber-JVM - sample step definitions
date:   2018-09-19 22:25:52 +0100
categories: cucumber, java
---
Sample step definitions
=======================

        @Given("^I am on the homepage$")
        public void i_am_on_the_homepage() throws Throwable {
            this.visit("/");
        }
        
        private void visit(String s) throws Exception {
            webDriver.get(HOST + s);
        }
        
        @When("^I change language to \"(.*?)\"$")
        public void i_change_language_to(String expected) throws Throwable {
            webDriver.findElement(By.className("dropdown-toggle")).click();
            webDriver.findElement(By.linkText(expected)).click();
        }

        @Then("^I should be on \"(.*?)\" page$")
        public void i_should_be_on_page(String expected) throws Throwable {
            assertEquals(expected, webDriver.getTitle());
        }
        
