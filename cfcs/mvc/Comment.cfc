<cfcomponent>
	<cffunction name="getCommentQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    id,pid,addtime,content,user,broadcast
FROM      comment
where pid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#" />
ORDER BY	id
		</cfquery>

		<cfreturn qRead>
	</cffunction>

	<cffunction name="getCommentgQuery" output="false" access="remote" returntype="query">
		<cfargument name="ID" required="false">
<cfargument name="user" required="false">	
		<cfset var qRead="">

		<cfquery name="qRead" datasource="appmanage">
SELECT    id,pid,addtime,content,user,broadcast
FROM      comment
where pid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#" />
and (user=<cfqueryparam cfsqltype="cf_sql_string" value="#arguments.user#" />
or broadcast=1)
ORDER BY id
		</cfquery>

		<cfreturn qRead>
	</cffunction>
	
	<cffunction name="deleteItem" output="false" access="remote" returntype="void">
		<cfargument name="ID" required="true">

		<cfscript>
			var commentGateway = createObject("component", "appmanage.cfcs.mvc.Edit_comment.commentGateway");
			commentGateway.deleteByID(arguments.ID);
		</cfscript>
	</cffunction>
</cfcomponent>