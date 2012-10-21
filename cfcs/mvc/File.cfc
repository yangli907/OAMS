<cfcomponent>
	<cffunction name="getMasterQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT   id,aid,filename,originalname,path,user,uploadtime
FROM      uploadfiles
WHERE aid = <cfqueryparam  value="#arguments.id#" />
		</cfquery>
		<cfreturn qRead>
	</cffunction>

	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">
		<cfscript>
			var uploadfilesGateway = createObject("component", "appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesGateway");
			uploadfilesGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>
