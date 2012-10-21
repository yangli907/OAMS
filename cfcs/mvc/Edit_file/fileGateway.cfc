<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "fileDAO").read(arguments.id)>
	</cffunction>
	
	<cffunction name="getByAid" output="false" access="remote">
		<cfargument name="aid" required="true" />
 		<cfreturn createObject("component", "fileDAO").read(arguments.aid)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getid() eq 0 )
			{
				return createObject("component", "fileDAO").create(arguments.obj);
			} else {
				return createObject("component", "fileDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "fileDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="appmanage.cfcs.mvc.Edit_file.fileBean[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="AppManage">
			select id
			from file
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "fileDAO").read(qRead.id);
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
			from file
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>