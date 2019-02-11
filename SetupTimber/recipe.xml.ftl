<?xml version="1.0"?>
<recipe>
    <merge from="root/build.gradle.ftl" to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <instantiate from="root/src/app_package/TimberDebugTreeWithTag.java.ftl" to="${escapeXmlAttribute(srcOut)}/${className}.java" />
</recipe>
