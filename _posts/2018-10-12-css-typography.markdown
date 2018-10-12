---
layout:
date:
title:
categories: css
---

# Notes and thoughts on CSS typography

## Rendering options

Setting rendering options can help make text look better than the defaults. It also gives a chance to chose what to optimise for, which can have an impact on mobile devices if there is large quantities of text. Thankfully the majority of the pages on this site are relatively short so it's safe enough to chose the more aggressive 'optimizeLegibility' setting.

    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-rendering: optimizeLegibility;

## Kerning

For typography kerning is important. Controlling the spacing between letters makes it more readable and the overall look more polished.

    -webkit-text-size-adjust: 100%;
    -webkit-font-feature-settings: "kern" 1;
    -moz-font-feature-settings: "kern" 1;
    -o-font-feature-settings: "kern" 1;
    font-feature-settings: "kern" 1;
    font-kerning: normal;

## Text contrast

For general text there should be enough contrast to read it, obviously. This has nothing to do with accessibility per se but is basic common sense. Why would you write something then make it hard to read. 

There are contrast guidelines published by the WCAG which should be adhered to. Mostly though, dark text on light/white background is the right option. 

## Font face and size

Don't make the text too small. This is relative to the device size and use but as a general rule a line of text shouldn't be longer than 60-80 characters for best flow and ease of reading. 

Conversely don't make it too big either as it inhibits speed reading and forces scrolling. 

Some font faces work best on displays, others are intended for printing, and some only look right at large sizes. As a preference, this site avoids webfonts to not require an additional download.

Third party font services track your visitors. If it's possible and you must have a particular typeface because of brand or stylistic reasons host the font yourself. Make it part of the site and don't rely on external hosting.

The general rule is to use sans-serif for headers and titles, serif for body copy, and fixed width for code. More commonly the headings are fancy sans-serif with the main text as a simplified typeface that looks better at smaller sizes. 

## Line spacing / line height

The gaps between the lines of text are more important than are often given credit. Too much and it looks loose, but too close and it's hard to read. Pick a spacing that balances this, which may vary depending on the styles chosen. Don't be tempted to compromise the spacing because of space issues. A good starting point is 1.25 or 1.5.

Alternatively set line height, ensuring it's large enough for your text plus the required gap.





