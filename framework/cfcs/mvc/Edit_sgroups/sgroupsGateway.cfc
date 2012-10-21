<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "sgroupsDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getid() eq 0 )
			{
				return createObject("component", "sgroupsDAO").create(arguments.obj);
			} else {
				return createObject("component", "sgroupsDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "sgroupsDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="framework.cfcs.mvc.Edit_sgroups.sgroupsBean[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="framework">
			select id
			from sgroups
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "sgroupsDAO").read(qRead.id);
			ArrayAppend(ret, obj);
		</cfscript>
		</cfloop>
		<cfreturn ret>
	</cffunction>



	<cffunction name="getAllAsQuery" output="false" access="remote" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="framework">
			select #arguments.fieldList#
			from sgroups
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>