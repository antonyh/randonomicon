---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: freemarker
---
Freemarker
==========

Freemarker is an almost-logicless that template language used to create
markup that results in HTML output. In essence it is plain text HTML
with some tokens that insert content from a model map object or call
some template functions. The most commonly used model map is the content
for the current page or component in Magnolia, so it's really
straightforward to create HTML that outputs the values the content
authors have entered into the pages.

Freemarker files have a file extension of .ftl and are UTF-8 encoded
text. There is no specific start or end markers in the file, and they
can be edited with anything that can modify UTF-8 text.

This text only deals with using Freemarker with Spring Blossom in
Magnolia. There are other ways and other usages. Other template
languages are available but Freemarker is generally considered the
preferred way to create Magnolia templates and components.

Freemarker is almost-logicless in the sense that although it does have
if-tests, iterators, and variable assignments it's not really possible
to do a great deal without backing it with some Java code to populate
models and provide functions that can be called in the template.
Ultimately, if it's hard to do in Freemarker it should probably be in
Java code anyway.

Define an area
--------------

An area in Magnolia consists of an area marker in the Freemarker
template, and an area definition in Spring Blossom.

To define an area named 'main' add it to the .ftl file:

    [@cms.area name="main" /]

This will do exactly zero - it's not an error to define an unused area,
and you won't get a warning. To make the area do something, you need to
add some code.

        @Area(value = "main", title = "Main")
        @Controller
        public static class MainArea {

            @RequestMapping("/page/main")
            public String render() {
                return "pages/main.ftl";
            }
        }

This will add an area 'main' with a title of 'Main' as a Controller
defined as a static class MainArea which has a unique internal request
mapping of '/page/main'. This with render the Freemarker in
'pages/main.ftl'.

List areas
----------

In some areas it's desirable to be able to add a number other components
and display them in order. This is possible by changing the area type to
'list' in the declaration of the area:

    @Area(value = "sidebar", title = "Sidebar", type = AreaType.LIST)
    @AvailableComponentClasses({SidebarComponent.class})
    @Controller

This enables the option to add components to the area, and permits only
'SidebarComponent' as an option. After components are added, the
Freemarker script is then able to iterate over the components the page
author has added with very little effort:

    [#list components as component ]
        [@cms.component content=component /]
    [/#list]

This will work regardless of the type of components in the list.

Current Page in Freemarker
--------------------------

Sometimes it's necessary to get the current page or path to the page
within Freemarker, in order to check it, use it as a parameter to a
function call, or other reasons. For retrieving relative path for the
current page use the following.

    ${state.originalBrowserURI}

For retrieving Absolute path for the current page use the following.
Note that this is URL here, not URI as it is in the previous example.

    ${state.originalBrowserURL}

Including other Freemarker files
--------------------------------

It's really easy to include other files, such as common markup,
boilerplate, or macro definitions.

    [#include "other.ftl" ]

This will include the file at the current location in the script.

You can conditionally include by wrapping this in an if-test. If you
needed to include a file only in the edit mode and not in preview or on
the public site then you could write code similar to this:

    [#if cmsfn.isEditMode() ] 
    [#include "editmode.ftl" ]
    [/#if]

If you wanted to include it only in preview/public mode and not in edit
mode, you can just invert the if-test thus:

    [#if !cmsfn.isEditMode() ] 
    [#include "noteditmode.ftl" ]
    [/#if]

CMS Init markup
---------------

Magnolia needs to perform CMS init functions to add JS, CSS, and so on
to the head of the page. This is done with a Freemarker function.

    [@cms.init /]

Output a value in Freemarker
----------------------------

The markup needed to display some plain text in Freemarker is very
simple:

    <title>${content.title!}</title>

The \$\... defines the output, and the ! tells Freemarker that the
alternative to content.title is an empty string because there is nothing
between the ! and the closing brace. The value 'content.title' is the
title property and is automatically added to the model by Magnolia.

Display rich text in Freemarker
-------------------------------

Rich text is text that contains HTML markup, and requires special
treatment in Freemarker. In order to display it it needs to be decoded,
and the decode function fails if the property is not set. First the
if-test checks if the property has content, then if it does ithe cmsfn
function decodes and displays the text.

    [#if content.text?has_content]
        ${cmsfn.decode(content).text}
    [/#if]

This will work whether the text property contains rich text or if it is
missing.

Java webapp context path
------------------------

If you are using a .war file many application servers will set the
'context path' to the name of the .war file. This will change your URLs
particularly during development and can be problematic. The easiest way
to correct this is to add the context path to all link href and src
attributes in Freemarker.

    ${contextPath!}

For example, to link to the home page, this would produce a suitable
link.

    <a href="${contextPath!}">Home</a>

Defining a macro
----------------

Macros are an easy and convenient way to define something that is used
over and over again in a clean and clear manner.

    [#macro mymacro number=1 truthy=true string="a string" ]
        [#if truthy]
            ${string!}
        [#else]
            ${number!}
        [/#if]
    [/#macro]

This macro is named 'mymacro'. It takes three parameters, all of which
are optional as they have defaults. If the second parameter 'truthy' is
passed to the macro it will display the number (which defaults to 1),
otherwise it will display the string value. Ok, this is a highly
convoluted example and largely unrealistic but I think it conveys what a
macro might look like particularly after a series of iterations. Macros
tend to evolve and as they are used elsewhere it can be difficult to
cleanly refactor them so don't be surprised if you do eventually come
across an example like this one 'in the wild'.

Calling a macro
---------------

All of these are valid invokations of the macro we just defined. Macros
can be called with named or positional parameters. If the parameters are
named then the order doesn't matter. Parameters with defaults don't need
to be set unless when using positional parameters when it would change
the position.

    [@mymacro]
    [@mymacro truthy=false]
    [@mymacro number=2]
    [@mymacro string="a different string"]
    [@mymacro 2 false "a different string"]
    [@mymacro truthy=false number=2]
    [@mymacro number=2 truthy=false]

All these statements will use the macro, with the output changing
depending on the parameters.

Assigning a variable
--------------------

You can assign values to named variables if it helps make your templates
more readable. This is especially useful if you use the variable more
than one.

    [#assign mytitle = content.title!]
    ${mytitle!}

This example will output the value of content.title.

Further reading
---------------

There is plenty of information online and rather than reproduce the
entire Freemarker or Magnolia reference material, here are some handy
links to help you find out more.

You can find the canonical reference to Freemarker here:

<http://freemarker.org/>

The Magnolia Freemarker documentation is also very useful:

<https://documentation.magnolia-cms.com/display/DOCS/FreeMarker+reference>
