---
layout: post
title: Gherkin - an example
date:   2018-09-19 22:25:52 +0100
categories: gherkin, cucumber
---
    @wip @javascript
        Feature: Change locale
        As a visitor, I want to pick my region

        Scenario: When I am on the homepage I should see the country chooser
        Given I am on the homepage
        Then I should be on "Country Chooser" page

        Scenario: When I am on the homepage I should be able to change locale
        Given I am on the homepage
        When I change language to "German (Germany)"
        Then I should be on "DE Home Page (in German)" page
