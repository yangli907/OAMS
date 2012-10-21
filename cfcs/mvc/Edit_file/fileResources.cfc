<cfcomponent name="fileResources">
	<cffunction name="fileLookup" access="remote" output="false" returntype="query">
		<cfset var qLookup="">
		<cfquery name="qLookup" datasource="appmanage">
SELECT    id, filetype
FROM      filetype
		</cfquery>
		<cfreturn qLookup>
	</cffunction>
</cfcomponent>