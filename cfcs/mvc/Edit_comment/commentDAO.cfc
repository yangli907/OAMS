<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="appmanage.cfcs.mvc.Edit_comment.commentBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AppManage">
			select 	id, pid, content, addtime, user,broadcast
			from comment
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "appmanage.cfcs.mvc.Edit_comment.commentBean").init();
			obj.setid(qRead.id);
			obj.setpid(qRead.pid);
			obj.setcontent(qRead.content);
			obj.setaddtime(qRead.addtime);
			obj.setuser(qRead.user);
			obj.setbroadcast(qRead.broadcast);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_comment.commentBean">
		<cfargument name="user" required="false" />
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getpid()>
		<cfset var local2=arguments.bean.getcontent()>
		<cfset var local3=arguments.bean.getaddtime()>
		<cfset var local4=arguments.bean.getuser()>
		<cfset var local5=arguments.bean.getbroadcast()>
		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="AppManage">
				insert into comment(pid, content, addtime, user,broadcast)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					now(),
            (select first from users where users.id= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user#" />),
			<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="AppManage">
				select id
				from comment
				where pid = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and content = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and addtime = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and user = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and user = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_comment.commentBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AppManage" result="status">
			update comment
			set 
				content = <cfqueryparam value="#arguments.bean.getcontent()#" cfsqltype="CF_SQL_VARCHAR" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_comment.commentBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from comment
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>