+++
date = '2026-03-29T19:52:48+02:00'
draft = false
title = 'Happy Toxiproxy Day'
+++

Sometimes things don't go as they're supposed to. Sometimes you're stuck. You feel the forces of nature fight you. You question whether you should carry on or give up. Give in to the silent scream that it isn't going to work. But you carry on nonetheless. Partly because there are small discoveries that feel like progress. Not so much steps forward, but steps sideways, alluding to the possibility of a step forward. And partly because you have to. _You_ are assigned to the task. _You_ have committed to finishing the task within the two week sprint. _You_ will write the tests, proving you have hardened the cashing service against high latency and outages.

It was several months ago that you implemented a circuit breaker into the caching service. Interrupted by a major data migration, you're now back where you left off. And no moment too soon. Production is plagued by micro downtimes and the metrics indicate the problem could very well be caused by the cashing service. The idea was simple: have the caching service periodically monitor the cache instance. If the cache instance is slow or unresponsive, activate the circuit breaker. I.e. have the cache service pretend to execute the invoked commands, while in fact do nothing, thus giving the cache instance some much needed respite. Let her sit out her tantrum. Only once she has calmed down do we invite her back to play. No, wait. You're thinking about your daughter. Either way, the same holds true.

"But," they ask, "with the cache instance in timeout, won't we overwhelm the database she, no it, was set up to protect?" To which you reply, "Who are you? My Mom? _Sit up straight, don't forget to wash behind your ears, always make sure to protect your database with a caching layer._ Geeze. I know what I'm doing."

But that of course is the problem. You only _think_ you know what you're doing.

You wrote the circuit breaker months ago. Now, you need to write the integration tests that prove it works—that you _do_ know what you're doing. Which brings us to Toxiproxy. Toxiproxy is the proxy you put between the application and the cache instance. Toxiproxy forwards the commands from the application to the cache instance, but if instructed, it can poison the connection with a toxin, simulating a problem with the cache instance.

You run the Toxiproxy container, import the Toxiproxy client-side library, set up the integration test suite... "maybe the toxic will apply if I also update the proxy... what if I add a timeout of 100 milliseconds... should I switch from downstream to upstream... I'll try a different toxin type... it works locally, why doesn't it work in the pipeline?!..."

Several days later you have a test suite with only two tests, one of which passes locally, but fails in the pipeline. You've learned a lot, but it feels like defeat. _Why won't Toxiproxy just work?_

It's Sunday now. Tomorrow you'll get back to it. Tomorrow you'll have to face your fears. Tomorrow you'll have to continue your struggle. But let's try to give it a positive spin. Let's imagine it's a good thing. Let's not focus on whether or not you'll actually get the thing to work, but take pride in the fact you're willing to try. Gaze into the abyss, madness be damned. You're the chosen champion. And whether you come out victorious or perish down the rabbit hole, your name will be sung in memoriam.

Hopefully, when this is all done, you’ll no longer have to wake up at night when the cache instance is having a coughing fit. No, wait. You're thinking about your son. Either way, let's hope this all ends soon.

Happy Toxiproxy day!
