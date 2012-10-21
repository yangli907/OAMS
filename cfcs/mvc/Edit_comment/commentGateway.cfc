<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "commentDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
		<cfargument name="user" required="false" />
 		<cfscript>
			if( obj.getid() eq 0 )
			{
				return createObject("component", "commentDAO").create(arguments.obj,arguments.user);
			} else {
				return createObject("component", "commentDAO").update(arguments.obj,arguments.user);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "commentDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="appmanage.cfcs.mvc.Edit_comment.commentBean[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="AppManage">
			select id
			from comment
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "commentDAO").read(qRead.id);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>



	<cffunction name="getAllAsQuery" output="false" access="remote" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="AppManage">
			select #arguments.fieldList#
			from comment
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>