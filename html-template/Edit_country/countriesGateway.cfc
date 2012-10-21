<cfcomponent output="false">

	<cffunction name="getById" output="false" access="remote">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "countriesDAO").read(arguments.id)>
	</cffunction>


	<cffunction name="save" output="false" access="remote">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getiso() eq "" )
			{
				return createObject("component", "countriesDAO").create(arguments.obj);
			} else {
				return createObject("component", "countriesDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>


	<cffunction name="deleteById" output="false" access="remote">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "countriesDAO").delete(obj)>
	</cffunction>



	<cffunction name="getAll" output="false" access="remote" returntype="cfcs.mvc.Edit_mail.countriesBean[]">
		<cfset var qRead="">
		<cfset var obj="">
		<cfset var ret=arrayNew(1)>

		<cfquery name="qRead" datasource="AppManage">
			select iso
			from countries
		</cfquery>

		<cfloop query="qRead">
		<cfscript>
			obj = createObject("component", "countriesDAO").read(qRead.iso);
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
			from countries
		</cfquery>

		<cfreturn qRead>
	</cffunction>




</cfcomponent>