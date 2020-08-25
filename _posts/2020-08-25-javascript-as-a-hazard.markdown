---
layout: post
date: 2020-08-25 08:59:59 +000
title: JavaScript as a Hazard
categories: development, javascript
comments: true
sharing: true
---

In my mind, JavaScript is a hazard that all developers in the modern era need to be aware of and savvy to in order to survive their career. I call it JavaScript-as-a-Hazard: JSaaH.

It is as ubiquitous as it is legendary. Unfortunately so are its many faults, failings, and follies. If you need to run something anywhere you don't control, it's a default choice but for all the wrong reasons.

JavaScript offers a good 'run anywhere' premise that's hard to ignore. It's also one of the few languages that can be reliably delivered and executed on remote machines - a feature other languages would consider an abuse or risk is ultimately the raison d'etre for JS...

The years have seen it standardised in the form of ECMA, so differences between runtimes have been resolved. It's still a language with a lot of strange behaviour, and one might almost think that it has been designed from the outset to harm the mental health of the unwary programmer or elevate the knowledgeable elite to a higher status. 

I'm not going to repeat the humour found in the 'wat' video (search online if you must), but it's well-known fact JavaScript does some very wacky things when combining or subtracting differing types or objects or arrays. There's a lot of painful edges here that can steal not only productivity but also motivation. 

Another case in hand, experienced recently, is the sheer variety of 'for' loops. Does a language really need for-loop, for-each,for-in, and for-of flavours? Yes, JavaScript does. Some are numerical, some are object, some are object-key it would seem, some coerce values. Or it seems so. It's too easy to select the wrong one and have a nightmare time figuring out why the object in the loop is no longer an object but a string with a value of "4".

I'm now firmly of the mind that JavaScript has evolved to the level of bytecode. It's only required reading for machines and debuggers, and desperate programmers trying to figure out why their creations are going sideways.

Sensible developers should now be using CoffeeScript or TypeScript. The only question that remains: should they output JavaScript at all? The future may be Web Assembly (WASM), so we can do away with this quirky and nonsensical language in favour of something that doesn't pretend to be anything other than an intermediary. The world minifies JS and obfuscates the source anyway, so it's barely readable without the map file. 

The type-checking these languages offer gives the best of both worlds. There's little reason to write raw JS in 2020. We can go even further and turn to Rust or Golang to get WASM if we so desire. 

The same applies on the server-side: why the earth would we wish to use such an unpredictable language for running in an environment that we control when there are better choices that eliminate entire categories of defect at compile time? Unfortunately that's a harder question to answer, but most seems to revolve around isomorphism. The temptation to run the same code on server-side as client-side (be that web browser or hybrid mobile application) is far too tempting for developers and management alike. It's a commercially-driven decision, and one can only hope that new languages like Goland and Rust can break the stranglehold JavaScript has on client-side applications, if only for the more advanced applications.
