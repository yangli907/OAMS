<cfcomponent name="addressResources">
	<cffunction name="ctryLookup" access="remote" output="false" returntype="query">
		<cfset var qLookup="">
		<cfquery name="qLookup" datasource="appmanage">
SELECT    iso, name
FROM      countries
		</cfquery>
		<cfreturn qLookup>
	</cffunction>
</cfcomponent>