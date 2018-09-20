---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: gatling, testing
---
Running a Gatling simulation
============================

invoke ./bin/gatling.sh

pick the simulation add a description wait open the html output

    $ ./bin/gatling.sh
    GATLING_HOME is set to /Users/h7788808/git/gatling/gatling
    Choose a simulation number:
         [0] antonyh.BookRecordedSimulation
    0
    Select simulation id (default is 'bookrecordedsimulation'). Accepted characters are a-z, A-Z, 0-9, - and _

    Select run description (optional)

    Simulation antonyh.BookRecordedSimulation started...

    ================================================================================
    2016-03-21 11:23:19                                           0s elapsed
    ---- BookRecordedSimulation ----------------------------------------------------
    [                                                                          ]  0%
              waiting: 1      / active: 0      / done:0     
    ---- Requests ------------------------------------------------------------------
    > Global                                                   (OK=0      KO=0     )

    ================================================================================

    11:23:21.483 [WARN ] i.g.h.a.AsyncHandlerActor - Request 'request_4' failed: status.find.is(304), but actually found 200
    11:23:21.505 [WARN ] i.g.h.a.AsyncHandlerActor - Request 'request_2' failed: status.find.is(304), but actually found 200
    11:23:21.582 [WARN ] i.g.h.a.AsyncHandlerActor - Request 'request_3' failed: status.find.is(304), but actually found 200
    11:23:21.697 [WARN ] i.g.h.a.AsyncHandlerActor - Request 'request_7' failed: status.find.is(304), but actually found 200
    11:23:22.407 [WARN ] i.g.h.a.AsyncHandlerActor - Request 'request_1' failed: status.find.is(304), but actually found 200

    ================================================================================
    2016-03-21 11:23:22                                           2s elapsed
    ---- BookRecordedSimulation ----------------------------------------------------
    [##########################################################################]100%
              waiting: 0      / active: 0      / done:1     
    ---- Requests ------------------------------------------------------------------
    > Global                                                   (OK=18     KO=5     )
    > request_0                                                (OK=1      KO=0     )
    > request_4                                                (OK=0      KO=1     )
    > request_9                                                (OK=1      KO=0     )
    > request_5                                                (OK=1      KO=0     )
    > request_2                                                (OK=0      KO=1     )
    > request_8                                                (OK=1      KO=0     )
    > css?family=Source+Sans+Pro%3A400%2C600%2C700%2C400ita... (OK=1      KO=0     )
    > request_3                                                (OK=0      KO=1     )
    > 88x31.png                                                (OK=1      KO=0     )
    > 88x31.png Redirect 1                                     (OK=1      KO=0     )
    > request_7                                                (OK=0      KO=1     )
    > request_6                                                (OK=1      KO=0     )
    > jquery-migrate.min.js?ver=1.2.1                          (OK=1      KO=0     )
    > addtoany.min.css?ver=1.12                                (OK=1      KO=0     )
    > jquery.fitvids.js?ver=20140820                           (OK=1      KO=0     )
    > font-awesome.css?ver=4.1.0                               (OK=1      KO=0     )
    > style.css?ver=4.4.2                                      (OK=1      KO=0     )
    > editor.js?ver=20120206                                   (OK=1      KO=0     )
    > comment-reply.min.js?ver=4.4.2                           (OK=1      KO=0     )
    > wp-embed.min.js?ver=4.4.2                                (OK=1      KO=0     )
    > request_10                                               (OK=1      KO=0     )
    > request_1                                                (OK=0      KO=1     )
    > jquery.js?ver=1.11.3                                     (OK=1      KO=0     )
    ---- Errors --------------------------------------------------------------------
    > status.find.is(304), but actually found 200                         5 (100.0%)
    ================================================================================

    Simulation finished
    Parsing log file(s)...
    Parsing log file(s) done
    Generating reports...

    ================================================================================
    ---- Global Information --------------------------------------------------------
    > request count                                         23 (OK=18     KO=5     )
    > min response time                                     45 (OK=45     KO=49    )
    > max response time                                   1401 (OK=1401   KO=382   )
    > mean response time                                   313 (OK=356    KO=160   )
    > std deviation                                        338 (OK=365    KO=126   )
    > response time 50th percentile                        200 (OK=200    KO=82    )
    > response time 75th percentile                        388 (OK=390    KO=219   )
    > mean requests/sec                                  8.367 (OK=6.548  KO=1.819 )
    ---- Response Time Distribution ------------------------------------------------
    > t < 800 ms                                            16 ( 70%)
    > 800 ms < t < 1200 ms                                   1 (  4%)
    > t > 1200 ms                                            1 (  4%)
    > failed                                                 5 ( 22%)
    ---- Errors --------------------------------------------------------------------
    > status.find.is(304), but actually found 200                         5 (100.0%)
    ================================================================================

    Reports generated in 0s.
    Please open the following file: results/bookrecordedsimulation-1458559399837/index.html
