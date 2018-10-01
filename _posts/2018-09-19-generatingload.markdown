---
layout: post
title: Gatling - Generating load 
date:   2018-09-19 22:25:52 +0100
categories: gatling, testing
---
Generating load with Gatling
============================

The recorded simulation is a single user walkthrough. This might be
useful in some cases, but in general making it soak the application in
requests will give you information on how it behaves under stress.

The most obvious way is to change

    setUp(scn.inject(atOnceUsers(1))).protocols(httpProtocol)

to some variation of:

    def users = 10
    setUp(scn.inject(atOnceUsers(users))).protocols(httpProtocol)

A list of options that you could apply is here:

      setUp(
        scn.inject(
            nothingFor(4 seconds) // 1 
            ,atOnceUsers(5) // 2                                                           
            ,rampUsers(10) over(5 seconds), // 3                                  
            ,constantUsersPerSec(5) during(60 seconds) // 4                                        
            ,constantUsersPerSec(20) during(15 seconds) randomized // 5 
            ,rampUsersPerSec(1) to 5 during(10 minutes) // 6                            
            ,rampUsersPerSec(10) to 20 during(10 minutes) randomized, // 7 
            ,splitUsers(1000) into(rampUsers(10) over(10 seconds)) separatedBy(10 seconds), // 8  
            ,splitUsers(1000) into(rampUsers(10) over(10 seconds)) separatedBy atOnceUsers(30), // 9
            ,heavisideUsers(1000) over(20 seconds) // 10
        )
      ).protocols(httpProtocol)

( sourced from
<http://gatling.io/docs/2.1.1/general/simulation_setup.html> )

The options are not necessarily clear-cut, and have a lot to do with
test design. Read the guidance in the Gatling documentation - it's well
written and useful.
