(: Copyright (C) 2022 Reece H. Dunn. SPDX-License-Identifier: Apache-2.0 :)
xquery version "1.0-ml";

declare variable $module-path as xs:string? :=
  try { fn:error(xs:QName("__FILE__"), "") }
  catch($ex) { $ex/error:stack/error:frame[2]/error:uri };

xdmp:set-response-content-type("text/html"),
"<!DOCTYPE html>",
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>MarkLogic Rewriter Endpoints</title>
    <link rel="stylesheet" href="{fn:replace($module-path, "/default.xqy", "/rewriter.css")}"/>
  </head>
  <body>
    <h1>MarkLogic Rewriter Endpoints</h1>
  </body>
</html>
