<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="appmanage.cfcs.mvc.Edit_application.applicationBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AppManage">
			select 	id, sid, decid, citizid, progcode, sessionid, batrans, matrans,grev,greq,grea,toefl,letter1,letter2,letter3
					
			from application
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "appmanage.cfcs.mvc.Edit_application.applicationBean").init();
			obj.setid(qRead.id);
			obj.setsid(qRead.sid);
			obj.setdecid(qRead.decid);
			obj.setcitizid(qRead.citizid);
			obj.setprogcode(qRead.progcode);
			obj.setsessionid(qRead.sessionid);
			obj.setbatrans(qRead.batrans);
			obj.setmatrans(qRead.matrans);
			obj.setgrev(qRead.grev);
			obj.setgreq(qRead.greq);
			obj.setgrea(qRead.grea);
			obj.settoefl(qRead.toefl);
			obj.setletter1(qRead.letter1);
			obj.setletter2(qRead.letter2);
			obj.setletter3(qRead.letter3);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_application.applicationBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getsid()>
		<cfset var local2=arguments.bean.getdecid()>
		<cfset var local3=arguments.bean.getcitizid()>
		<cfset var local4=arguments.bean.getprogcode()>
		<cfset var local5=arguments.bean.getsessionid()>
		<cfset var local6=arguments.bean.getbatrans()>
		<cfset var local7=arguments.bean.getmatrans()>
		<cfset var local8=arguments.bean.getgrev()>
		<cfset var local9=arguments.bean.getgreq()>
		<cfset var local10=arguments.bean.getgrea()>
		<cfset var local11=arguments.bean.gettoefl()>
		<cfset var local12=arguments.bean.getletter1()>
		<cfset var local13=arguments.bean.getletter2()>
		<cfset var local14=arguments.bean.getletter3()>
		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="AppManage">
				insert into application(sid, decid, citizid, progcode, sessionid, batrans, matrans, grev, greq, grea, toefl,letter1,letter2,letter3)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="AppManage">
				select id
				from application
				where sid = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and decid = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and citizid = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and progcode = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and sessionid = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and batrans = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and matrans = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and grev = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and greq = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and grea = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and toefl = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and letter1 = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />
				  and letter2 = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and letter3 = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_application.applicationBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AppManage" result="status">
			update application
			set sid = <cfqueryparam value="#arguments.bean.getsid()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsid() eq ""), de("yes"), de("no"))#" />,
				decid = <cfqueryparam value="#arguments.bean.getdecid()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdecid() eq ""), de("yes"), de("no"))#" />,
				citizid = <cfqueryparam value="#arguments.bean.getcitizid()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getcitizid() eq ""), de("yes"), de("no"))#" />,
				progcode = <cfqueryparam value="#arguments.bean.getprogcode()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getprogcode() eq ""), de("yes"), de("no"))#" />,
				sessionid = <cfqueryparam value="#arguments.bean.getsessionid()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsessionid() eq ""), de("yes"), de("no"))#" />,
				batrans = <cfqueryparam value="#arguments.bean.getbatrans()#" cfsqltype="CF_SQL_VARCHAR" />,
				matrans = <cfqueryparam value="#arguments.bean.getmatrans()#" cfsqltype="CF_SQL_VARCHAR" />,
				grev = <cfqueryparam value="#arguments.bean.getgrev()#" cfsqltype="CF_SQL_VARCHAR" />,
				greq = <cfqueryparam value="#arguments.bean.getgreq()#" cfsqltype="CF_SQL_VARCHAR" />,
				grea = <cfqueryparam value="#arguments.bean.getgrea()#" cfsqltype="CF_SQL_VARCHAR" />,
				toefl = <cfqueryparam value="#arguments.bean.gettoefl()#" cfsqltype="CF_SQL_VARCHAR" />,
				letter1 = <cfqueryparam value="#arguments.bean.getletter1()#" cfsqltype="CF_SQL_VARCHAR" />,
				letter2 = <cfqueryparam value="#arguments.bean.getletter2()#" cfsqltype="CF_SQL_VARCHAR" />,
				letter3 = <cfqueryparam value="#arguments.bean.getletter3()#" cfsqltype="CF_SQL_VARCHAR" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_application.applicationBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from application
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>