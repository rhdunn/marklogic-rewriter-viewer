(: Copyright (C) 2022 Reece H. Dunn. SPDX-License-Identifier: Apache-2.0 :)
xquery version "1.0-ml";

declare function local:load-modules-file($file-path) {
  let $database := xdmp:modules-database()
  return if ($database eq 0) then
    let $root := xdmp:modules-root()
    let $path := "file:///" || fn:replace($root, "\\", "/") || $file-path
    return
      try { xdmp:document-get($path) }
      catch ($e) { () }
  else
    let $options := <options xmlns="xdmp:eval"><database>{$database}</database></options>
    return xdmp:invoke-function(function () { fn:doc($file-path) }, $options)
};

declare variable $module-path as xs:string? :=
  try { fn:error(xs:QName("__FILE__"), "") }
  catch($ex) { $ex/error:stack/error:frame[2]/error:uri };

declare variable $rewriter :=
  let $rewriter-path := xdmp:get-url-rewriter-path()
  return if (fn:ends-with($rewriter-path, ".xml")) then
    local:load-modules-file($rewriter-path)
  else
    ();

xdmp:set-response-content-type("text/html"),
"<!DOCTYPE html>",
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>MarkLogic Rewriter Endpoints</title>
    <link rel="stylesheet" href="{fn:replace($module-path, "/default.xqy", "/rewriter.css")}"/>
  </head>
  <body>{
    <h1>MarkLogic Rewriter Endpoints</h1>,
    if (fn:empty($rewriter)) then
      <p>XQuery rewriters are not supported.</p>
    else
      ()
  }</body>
</html>
