---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: cucumber, java
---
Maven Dependencies
------------------

Running cucumber-jvm with phantomjs needs these dependencies in the pom.

        <dependencies>
            <dependency>
                <groupId>info.cukes</groupId>
                <artifactId>cucumber-picocontainer</artifactId>
                <scope>test</scope>
            </dependency>
            <dependency>
                <groupId>info.cukes</groupId>
                <artifactId>cucumber-junit</artifactId>
                <scope>test</scope>
            </dependency>
            <dependency>
                <groupId>org.seleniumhq.selenium</groupId>
                <artifactId>selenium-common</artifactId>
                <version>2.0b1</version>
                <scope>test</scope>
            </dependency>
            <dependency>
                <groupId>org.seleniumhq.selenium</groupId>
                <artifactId>selenium-java</artifactId>
                <version>2.44.0</version>
                <scope>test</scope>
            </dependency>
            <dependency>
                <groupId>com.github.detro.ghostdriver</groupId>
                <artifactId>phantomjsdriver</artifactId>
                <version>1.1.0</version>
                <scope>test</scope>
            </dependency>

            <dependency>
                <groupId>junit</groupId>
                <artifactId>junit</artifactId>
                <version>4.11</version>
                <scope>test</scope>
            </dependency>
        </dependencies>
        
