<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="framework.cfcs.mvc.Edit_sgroups.sgroupsBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="framework">
			select 	id, name, label, image
			from sgroups
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "framework.cfcs.mvc.Edit_sgroups.sgroupsBean").init();
			obj.setid(qRead.id);
			obj.setname(qRead.name);
			obj.setlabel(qRead.label);
			obj.setimage(qRead.image);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_sgroups.sgroupsBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getname()>
		<cfset var local2=arguments.bean.getlabel()>
		<cfset var local3=arguments.bean.getimage()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="framework">
				insert into sgroups(name, label, image)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="framework">
				select id
				from sgroups
				where name = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and label = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and image = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_sgroups.sgroupsBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="framework" result="status">
			update sgroups
			set name = <cfqueryparam value="#arguments.bean.getname()#" cfsqltype="CF_SQL_VARCHAR" />,
				label = <cfqueryparam value="#arguments.bean.getlabel()#" cfsqltype="CF_SQL_VARCHAR" />,
				image = <cfqueryparam value="#arguments.bean.getimage()#" cfsqltype="CF_SQL_VARCHAR" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_sgroups.sgroupsBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="framework" result="status">
			delete
			from sgroups
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>