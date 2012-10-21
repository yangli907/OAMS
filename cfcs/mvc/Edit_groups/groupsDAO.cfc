<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="framework.cfcs.mvc.Edit_groups.groupsBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="framework">
			select 	id, name, sgrp
			from groups
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "framework.cfcs.mvc.Edit_groups.groupsBean").init();
			obj.setid(qRead.id);
			obj.setname(qRead.name);
			obj.setsgrp(qRead.sgrp);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_groups.groupsBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getname()>
		<cfset var local2=arguments.bean.getsgrp()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="framework">
				insert into groups(name, sgrp)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="framework">
				select id
				from groups
				where name = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and sgrp = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_groups.groupsBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="framework" result="status">
			update groups
			set name = <cfqueryparam value="#arguments.bean.getname()#" cfsqltype="CF_SQL_VARCHAR" />,
				sgrp = <cfqueryparam value="#arguments.bean.getsgrp()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsgrp() eq ""), de("yes"), de("no"))#" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_groups.groupsBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="framework" result="status">
			delete
			from groups
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>