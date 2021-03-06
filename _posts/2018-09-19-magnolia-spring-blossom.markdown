---
layout: post
title: Magnolia - Spring Blossom
date:   2018-09-19 22:25:52 +0100
categories: java, spring, magnolia
---
Spring Blossom
==============

#### What is String Blossom?

Previous incarnations of Magnolia CMS used JCR nodes to define almost
everything, which made unit testing difficult. Spring Blossom addresses
this by using plain Java. It is an annotation-based framework that works
using code rather than configuration, effectively configuring the code
by adding annotations to Java controller classes to make templates
available to the users.

#### Why use it in Magnolia CMS?

Compared to the alternative legacy method of defining components in
Magnolia then exporting them into XML so you can add the definitions to
your module bootstrap, or coding the changes into the bootstrap version
handler in Java, working with Blossom is far easier, quicker, and more
productive. It enables full unit testing, with all the advantages that
compiled Java brings.

#### An approach to learning Spring Blossom

We will look at the fundamentals of Spring Blossom and how the moving
parts fit together so we can get productive quickly. If you want
reference material then there's plenty available online and it would be
foolish to rewrite it here. Conversely, an in-depth tutorial that covers
every possible angle isn't likely to be particularly useful either, as
most of the options can be ignored safely. The main thing is to firstly
get a simple project working, understand the terminology and what each
part is supposed to do, and then know where the good documentation is
located.

Freemarker will be used for the examples as it's the preferred scripting
language for Magnolia at present. JSP is considered somewhat out of
favour.

Maven dependencies
------------------

Assuming you are using Maven, The first step to take is to add Blossom
to your Maven pom.xml as a project dependency.

``` {language="xml"}
<dependency>
    <groupId>info.magnolia.blossom</groupId>
    <artifactId>magnolia-module-blossom</artifactId>
    <version>${blossom.version}</version>
</dependency>
```

You should use the right Blossom version for your needs and for your
project - at the moment this is version 3.0.4.

If you're not using Maven, you'll need to find out how to add this to
Gradle/Ivy/Ant yourself. It should be fairly straightforward, and if you
use and IDE it may have features to do it for you.

Magnolia templates
------------------

In Magnolia, templates are things that define page types. In Blossom, a
template is a class that is marked with \@Template. Annotate the class
as follows:

``` {language="java"}
import info.magnolia.module.blossom.annotation.Template;
import org.springframework.stereotype.Controller;

//...

@Template(
    name = "my-template",
    value = "My Template", description = "Page template",
    visible = true)
@Controller
public class MyTemplate {
    //...
}
```

As you can see, a template in Magnolia is a Java class with an
annotation to set some metadata. It's also declared as a controller
using an annotation, and does not need to extend any other Java class.

Magnolia areas
--------------

In Magnolia, areas are places where content goes. Content might be
something always included on a page like a header or a footer, or it
might be an area that allows authors to insert text, images, or any
custom components that have been made available. In Blossom, an area is
a point where another script is included, more or less. It defines a
render method that returns a partial path to a script (JSP or Freemarker
usually).

#### Static area

In this first example, we include an area which includes a Freemarker
template. You might use something like this to include a header or
footer, or perhaps page navigation.

``` {language="java"}
    @Controller
    @Area("my-area")
    public static class MyArea {
        @RequestMapping("/main/my-area")
        public String render(){
            return "areas/my-area.ftl";
        }
    }
```

The my-area.ftl could contain anything, or even be empty so long as it
exists and is syntactically correct. It would be perfectly valid to have
plain HTML in this file with no special Freemarker tags.

#### List area

In the second example, we create an area that allows the content author
to add, edit, reorder, and remove components dynamically. This would
typically include areas where pages can be composed of text or image
components.

``` {language="java"}
    @Controller
    @Area("my-list")
    @AvailableComponentClasses({
        MyListItem.class
    })
    public static class MyList {
        @RequestMapping("/main/my-list")
        public String render(){
            return "areas/my-list.ftl";
        }
    }
```

To make this work, you need to tell Freemarker where to put the area in
the markup using this

    [@cms.area name="my-list"/]

In addition, the Freemarker 'my-list.ftl' needs to know how to display
the list. The basic functionality is covered with this fragment and is
sufficient for the vast majority of cases:

``` {language="html"}
[#list components as component]
   [@cms.component content=component /]
[/#list]
```

Magnolia components
-------------------

In Magnolia, the author is able to add components to pages to create
their content in a flexible way. This includes rich text, images,
videos, or any other type of component. The components are added by the
authors to the areas we defined, which declared which components they
allow.

A component that uses Blossom consists of a Java class, a Dialog, and a
FreeMarker template.

Counter-intuitively, the Java class is annotated with 'template' - I
would have expected a 'component' annotation. This sample shows a very
basic text component with a description for the content authors.

    @Template(id = "yourProject:components/text", title="Text")
    @TemplateDescription("Adds a text section")
    @Controller
    public class TextController {
     
        @RequestMapping("/text")
        public ModelAndView render() {
            ...
        }
    }

The template ID needs to be in the form components/\[name\] and prefixed
with your module or project name.

The official documentation covers creating Magnolia Blossom components
fairly well, and you can find it here:
<https://documentation.magnolia-cms.com/display/DOCS/Blossom+module>

The freemarker template should already be familiar to you, and the
dialog definition we'll cover next.

Magnolia dialogs
----------------

In Magnolia you need to define the fields in the edit dialogue so that
content authors can add and update the text, images, links, and metadata
that are used to compose the pages of the site. Classically this was
done as an definition in the JCR tree, and more recently (since Magnolia
5.4) it has become possible to declare the edit dialog as a YAML file.

Creating the dialog in Blossom as Java code was a massive improvement in
productivity and quality over creating JCR nodes and exporting/importing
them. However now that YAML can be used most of the advantages of using
Java are negated, unless you have to use version 5.3 or really feel the
need to unit test the dialogue definitions or absolutely must have a
hierarchy of dialogues with inheritance to match a hierarchy of
templates/components. Most of the time, you'll just want to declare the
fields and get on with it.

If you are using Java, you need to extend DialogDefinition. You can find
a detailed guide here in the official documentation:
<https://documentation.magnolia-cms.com/display/DOCS/Blossom+module>

For the YAML style of configuring dialogues in Magnolia, see
<https://documentation.magnolia-cms.com/display/DOCS/YAML>

Further reading
---------------

At the time of writing, the documentation was in transition to a new
version of Magnolia, which has proved problematic for the links. You
might find some of these no longer work, and some may be fixed with some
URL-hacking.

You can read more about the Blossom module here. The link references the
latest version.
<https://documentation.magnolia-cms.com/display/DOCS/Blossom+module>

This interesting presentation covers a lot of information on Blossom in
the first half, and more practical tips in the second. It's recommended
viewing as it does give good details.
<http://www.slideshare.net/Magnolia_CMS/getting-healthy-with-magnolia-blossom-and-spring>

The Freemarker reference for Magnolia CMS is a very useful resource as
it covers a lot of Magnolia specific use-cases and has a good deal of
generally good information:
<https://documentation.magnolia-cms.com/display/DOCS53/FreeMarker+reference#FreeMarkerreference-cms:area>

Sample code. As with all things GitHub, this might be maintained, or
could be abandoned by the time you read this.
<http://git.magnolia-cms.com/git/modules/blossom/samples.git>

Blossom module documentation for Magnolia CMS 5.3. Change the URL if you
need a different version, the documentation for version 5.3 is here:
<https://documentation.magnolia-cms.com/display/DOCS53/Blossom+module>
