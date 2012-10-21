<cfcomponent name="usersResources">

	<cffunction name="grpLookup" access="remote" output="false" returntype="query">
        <cfargument name="sgrp" required="true">
		<cfset var qLookup="">
		<cfquery name="qLookup" datasource="framework">
SELECT    id, name
FROM      groups
WHERE sgrp = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.sgrp#" /> 
		</cfquery>
		<cfreturn qLookup>
	</cffunction>

</cfcomponent>