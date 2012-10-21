<cfprocessingdirective  suppresswhitespace="true">
<cftry>
  <cffile action="upload" fileField="filedata" destination="c:\uploadfile" nameconflict="overwrite"> 
  <cfcatch>    
  </cfcatch>
</cftry>
</cfprocessingdirective>