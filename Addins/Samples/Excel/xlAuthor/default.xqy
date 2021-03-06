xquery version "1.0-ml";
(:
Copyright 2008-2011 MarkLogic Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
:)
import module namespace config = "http://marklogic.com/toolkit/excel/author/config"  at "./config/config.xqy";
declare namespace search="http://marklogic.com/openxml/search";
xdmp:set-response-content-type('text/html'),
"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>",
<html xmlns="http://www.w3.org/1999/xhtml" id="main">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> <!--harset=iso-8859-1" />-->
<link rel="stylesheet" href="css/authoring.css" />
<script type="text/javascript" src="js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="js/authoring.js?rand={xdmp:random()}"></script>
<script type="text/javascript" src="js/MarkLogicExcelAddin.js?rand={xdmp:random()}">//</script>
<script type="text/javascript" src="js/MarkLogicExcelEventSupport.js?rand={xdmp:random()}">//</script>
<script type="text/javascript" src="js/MarkLogicExcelEventHandlers.js?rand={xdmp:random()}">//</script>

<!-- generate a lookuptable in js as well , so I can add appropriate metadata for control-->
<script type="text/javascript">{config:generate-js-for-controls()}</script> 

<!-- some dynamic script here for insert of controls -->
<title>Oslo Information Panel</title>
</head>
<body> 
  <div id="topnav">
	<ul>
    	<li><a href="#" class ="fronticon" id="icon-xl" title="enrich">&nbsp;</a></li>
        <li><a href="#" id="icon-metadata" title="metadata">&nbsp;</a></li>
        <li><a href="#" id="icon-search" title="search">&nbsp;</a></li>
        <li><a href="#" id="icon-macro" title="macros">&nbsp;</a></li>
     </ul>
    <br clear="all" />
  </div><!--end topnav-->

  <div id="current-doc">
    <div id="tabs">
     <ul>
       <li class="fronttab" id="tag-xlsx-tab" title="workbook tag palette">
            <a href="#" id="tags-xlsx-show">Tags</a>  <!--was controls-show, snippets-show -->
       </li>
     </ul>
    </div><!-- end tabs-->
    <div id="controls">
       <div id="buttonbar">
	  <ul>
            <li><a href="#"  class="selectedctrl" id="icon-xlctrl" title="workbook">&nbsp;</a></li>
            <li><a href="#" id="icon-sheetctrl" title="worksheet">&nbsp;</a></li>
            <li><a href="#" id="icon-namedrangectrl" title="named range">&nbsp;</a></li>
          </ul>
        </div><!-- end buttonbar-->

  <!-- begin following to be generated from config -->
        <div class="inspectorDetails">
          <div id="workbooktags">
            <h3><span>Add Tags to Workbook</span></h3>
            <ul class="buttongroup">
              {config:workbook-tags()}
            </ul>
            <br clear="all" />
          </div><!--end text controls-->
          <div id="worksheettags">
            <h3><span>Add Tags to Worksheet</span></h3>
            <ul class="buttongroup">
              {config:worksheet-tags()}
            </ul>
            <br clear="all" />
          </div> <!--end imgcontrols-->
          <div id="componenttags">
            <h3><span>Add Tags to Selected Component</span></h3>
            <ul class="buttongroup">
              {config:component-tags()}
            </ul>
            <br clear="all" />
          </div><!-- end calcontrols-->
   
          <div id="properties-panel"> 
            <h3><span>Properties</span></h3>
            <div id="noproperties">
               Nothing currently selected.
            </div>
            <div id="properties">
             <br clear="all" />
            </div><!--end properties-->
          </div><!--end properties-panel-->
        </div><!--end inspector details-->
<!-- end following to be generated from config -->
    </div><!--end controls-->
  </div><!-- end current-doc-->

  <div id="metadata">
       <div id="meta-buttonbar">
	  <ul>
            <li><a href="#"  class="selectedctrl" id="icon-meta-xlctrl" title="workbook">&nbsp;</a></li>
            <li><a href="#" id="icon-meta-sheetctrl" title="worksheet">&nbsp;</a></li>
            <li><a href="#" id="icon-meta-namedrangectrl" title="namedrange">&nbsp;</a></li>
          </ul>
       </div>
    <div id="treeWindow">
      <!--<h2><a href="#" id="treetitle" >Presentation</a></h2> -->
      <ul id="treelist">
      </ul>
    </div><!--end treeWindow-->

    <div id="metadataPanel">
      <h3>Metadata<span id="ML-Message">Saved</span></h3> 
      <div id="metadataForm">
      </div>
    </div><!--end metadataPanel-->
  </div><!--end metadata-->

  <div id="search">
  { 
    let $searchparam := if(fn:empty(xdmp:get-request-field("search:bsv"))) then "" else (xdmp:get-request-field("search:bsv"))
    let $searchtype :=  if(fn:empty(xdmp:get-request-field("search:bst"))) then "" else (xdmp:get-request-field("search:bst"))
    let $start := xdmp:get-request-field("search:start")
    let $div :=
      <div id="searchpanel">
	<div>
         <br/>
               {
                    xdmp:invoke("./search/searchform.xqy",  ((xs:QName("search:bsv"),$searchparam ),  (xs:QName("search:bst"),$searchtype )) )
               }
         
               <div id="searchresults">
               </div>

	</div>
      </div>
    return $div
  }
  </div><!-- end search-->
  <div id="macro">
    <div id="macroWindow">
      <!--<h2><a href="#" id="treetitle" >Presentation</a></h2> -->
      <ul id="macrolist">
      </ul>
    </div><!--end treeWindow-->

    <div id="macroMetadataPanel">
      <h3>Metadata<span id="ML-Message2">Saved</span></h3> 
      <div id="macroMetadataForm">
      </div>
    </div><!--end macroMetadataPanel-->
  </div><!--end macroMetadata-->
</body>
</html>
