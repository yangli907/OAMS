<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="cfcs.mvc.Edit_mail.countriesBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AppManage">
			select 	iso, name
			from countries
			where iso = <cfqueryparam cfsqltype="CF_SQL_CHAR" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "cfcs.mvc.Edit_mail.countriesBean").init();
			obj.setiso(qRead.iso);
			obj.setname(qRead.name);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="cfcs.mvc.Edit_mail.countriesBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getname()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="AppManage">
				insert into countries(name)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="AppManage">
				select iso
				from countries
				where name = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				order by iso desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setiso(qGetID.iso);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="cfcs.mvc.Edit_mail.countriesBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AppManage" result="status">
			update countries
			set name = <cfqueryparam value="#arguments.bean.getname()#" cfsqltype="CF_SQL_VARCHAR" />
			where iso = <cfqueryparam value="#arguments.bean.getiso()#" cfsqltype="CF_SQL_CHAR">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="cfcs.mvc.Edit_mail.countriesBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from countries
			where iso = <cfqueryparam cfsqltype="CF_SQL_CHAR" value="#arguments.bean.getiso()#" />
		</cfquery>

	</cffunction>


</cfcomponent>