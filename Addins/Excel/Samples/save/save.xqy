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

xdmp:set-response-content-type('text/html;charset=utf-8'),
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">',
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Save .xlsx File To MarkLogic</title>
	<link rel="stylesheet" type="text/css" href="../css/office-blue.css"/>
	<script type="text/javascript" src="../js/MarkLogicExcelAddin.js">//</script>
	<script type="text/javascript" src="save.js">//</script>
</head>
 <body>
	<div id="ML-Add-in">
<br/>
<br/>
                          <div>Save As: &nbsp;&nbsp;
                             <input id="ML-Save" name="q" type="text" value=""/>&nbsp;&nbsp;
                             <!--<img src="save-48x48.png" style="vertical-align:bottom;" onclick="saveXlsxToMarkLogic()" />-->
                             <!-- <img src="save-48x48.png" style="vertical-align:middle;" onclick="saveXlsxToML()" /> -->
	                          <button id="ML-Save" class="ML-action" onclick="saveXlsxToML()">Save</button>
                          </div>
<br/>
<br/>
<div id="ML-Intro">
			<h1>Save To MarkLogic Server</h1>
			<p>Enter a title for the Excel Workbook currently being authored.  Click the Save Icon to save the document to MarkLogic Server.  The document will be saved to the database that is configured with the Add-in.</p>
			<p>You don't have to append the .xlsx extension, it will be provided automatically. If you don't enter a title, the document will be saved as Default.xlsx.</p>
		</div>
                          
<!--<br/>
                          <br/>
                          <div id="mybutton">
                           <img style="position: relative;left:25%;" src="save_icon.png" onclick="saveXlsxToMarkLogic()" /> 
                          </div> -->
	</div>
	<div id="ML-Navigation">
	   <a href="../default.xqy">« Samples</a>
        </div>
 </body>
</html>
