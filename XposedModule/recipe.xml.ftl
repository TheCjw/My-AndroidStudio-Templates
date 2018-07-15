<?xml version="1.0"?>
<recipe>
    <!--Step1: Add xposed meta info to AndroidManifest.xml-->
    <merge from="root/AndroidManifest.xml.ftl" to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    <!--Step2: Merge strings.xml -->
    <merge from="root/res/values/strings.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
    <!--Step3: Add Xposed Api ti build.gradle -->
    <merge from="root/build.gradle.ftl" to="${escapeXmlAttribute(projectOut)}/build.gradle"/>
    <!--Step4: Configure xposed_init file-->
    <mkdir at="${escapeXmlAttribute(manifestOut)}/assets/"/>
    <instantiate from="root/assets/xposed_init.ftl" to="${escapeXmlAttribute(manifestOut)}/assets/xposed_init"/>
    <!--Step5: Create xposed entry class. -->
    <instantiate from="root/src/app_package/XposedEntry.java.ftl" to="${escapeXmlAttribute(srcOut)}/${className}.java" />
    <!--Step6: Remove test only build flag, but merging gradle.properties is not supported by Android Studio yet.
    <merge from="root/gradle.properties.ftl" to="${escapeXmlAttribute(projectOut)}/../gradle.properties"/>
    -->
    <!--Step7: open new file-->
    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />
</recipe>
