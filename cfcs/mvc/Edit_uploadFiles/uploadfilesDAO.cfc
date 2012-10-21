<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AppManage">
			select 	id, aid, filename, originalname, path, user
					
			from uploadfiles
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesBean").init();
			obj.setid(qRead.id);
			obj.setaid(qRead.aid);
			obj.setfilename(qRead.filename);
			obj.setoriginalname(qRead.originalname);
			obj.setpath(qRead.path);
			obj.setuser(qRead.user);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getaid()>
		<cfset var local2=arguments.bean.getfilename()>
		<cfset var local3=arguments.bean.getoriginalname()>
		<cfset var local4=arguments.bean.getpath()>
		<cfset var local5=arguments.bean.getuser()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="AppManage">
				insert into uploadfiles(aid, filename, originalname, path, user)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="AppManage">
				select id
				from uploadfiles
				where aid = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and filename = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and originalname = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and path = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and user = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AppManage" result="status">
			update uploadfiles
			set aid = <cfqueryparam value="#arguments.bean.getaid()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getaid() eq ""), de("yes"), de("no"))#" />,
				filename = <cfqueryparam value="#arguments.bean.getfilename()#" cfsqltype="CF_SQL_VARCHAR" />,
				originalname = <cfqueryparam value="#arguments.bean.getoriginalname()#" cfsqltype="CF_SQL_VARCHAR" />,
				path = <cfqueryparam value="#arguments.bean.getpath()#" cfsqltype="CF_SQL_VARCHAR" />,
				user = <cfqueryparam value="#arguments.bean.getuser()#" cfsqltype="CF_SQL_VARCHAR" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from uploadfiles
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>