<%
if tcWebApi_get("WebCustom_Entry", "isMultiLanguageSupport", "h") = "Yes" then
if Request_Form("Language_Flag")="1" then
tcWebApi_constSet("LanguageSwitch_Entry","Type","1")
tcWebApi_constSet("LanguageSwitch_Entry","Language","Vietnamese")
TCWebApi_commit("LanguageSwitch_Entry")
elseif Request_Form("Language_Flag")="2" then
tcWebApi_constSet("LanguageSwitch_Entry","Type","2")
tcWebApi_constSet("LanguageSwitch_Entry","Language","English")
TCWebApi_commit("LanguageSwitch_Entry")
end if
end if
%>
<%
if tcWebApi_get("WebCustom_Entry", "isMultiLanguageSupport", "h") = "Yes" then
if Request_Form("Language_Flag")="1" then
tcWebApi_constSet("LanguageSwitch_Entry","Type","1")
tcWebApi_constSet("LanguageSwitch_Entry","Language","Vietnamese")
TCWebApi_commit("LanguageSwitch_Entry")
elseif Request_Form("Language_Flag")="2" then
tcWebApi_constSet("LanguageSwitch_Entry","Type","2")
tcWebApi_constSet("LanguageSwitch_Entry","Language","English")
TCWebApi_commit("LanguageSwitch_Entry")
end if
end if
%>
<%
if Request_Form("PrtCtrl_Flag") = "1" then
	TCWebApi_set("WebCurSet_Entry","parentalctrl2_pvc","ParentalCtrlRuleCurIdx")
	TCWebApi_set("parentalctrl2_pvc","HostName","prtctrlrule_name")
	TCWebApi_set("parentalctrl2_pvc","Index","prtctrlrule_idx")
	tcWebApi_constSet("parentalctrl2_pvc","Enable","Yes")
	TCWebApi_set("parentalctrl2_pvc","MAC","prtctrlrule_mac")
	TCWebApi_set("parentalctrl2_pvc","Policy","prtctl_policy")
	TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry")
	TCWebApi_set("parentalctrl2_pvc","URL","prtctrlrule_url")
	TCWebApi_set("parentalctrl2_pvc","ScheduleNum","ParentalCtrlRuleCurScheduleNum")
	if Request_Form("hSchedule0") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","0")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","1")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule0_days_addval")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule0")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule0_Starttime")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule0_Endtime")	
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule0_Duration")	
	end if
	if Request_Form("hSchedule1") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","1")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","2")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule1")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule1_days_addval")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule1_Starttime")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule1_Endtime")		
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule1_Duration")	
	end if
	if Request_Form("hSchedule2") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","2")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","3")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule2")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule2_days_addval")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule2_Starttime")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule2_Endtime")		
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule2_Duration")	
	end if
	if Request_Form("hSchedule3") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","3")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","4")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule3")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule3_days_addval")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule3_Starttime")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule3_Endtime")		
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule3_Duration")	
	end if
	TCWebApi_commit("parentalctrl2_pvc")
else if Request_Form("PrtCtrl_Flag") = "2" then
	if Request_Form("ParentalCtrlEntry0") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","0")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry1") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","1")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry2") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","2")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry3") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","3")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry4") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","4")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry5") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","5")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry6") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","6")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry7") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","7")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry8") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","8")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry9") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","9")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	if Request_Form("ParentalCtrlEntry10") <> "99" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","10")
	TCWebApi_unset("parentalctrl2_pvc")		
	end if
	TCWebApi_commit("parentalctrl2_pvc")
elseif Request_Form("PrtCtrl_Flag") = "3" then
	TCWebApi_set("Parentalctrl2_Common","Enable","EnablePrtCtrl_Flag")	
	TCWebApi_commit("Parentalctrl2_Common")	
elseif Request_Form("PrtCtrl_Flag") = "4" then
	if Request_Form("ParentalCtrlEntry0") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","0")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry0")
	end if
	if Request_Form("ParentalCtrlEntry1") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","1")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry1")
	end if
	if Request_Form("ParentalCtrlEntry2") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","2")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry2")
	end if
	if Request_Form("ParentalCtrlEntry3") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","3")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry3")
	end if
	if Request_Form("ParentalCtrlEntry4") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","4")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry4")
	end if
	if Request_Form("ParentalCtrlEntry5") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","5")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry5")
	end if
	if Request_Form("ParentalCtrlEntry6") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","6")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry6")
	end if
	if Request_Form("ParentalCtrlEntry7") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","7")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry7")
	end if
	if Request_Form("ParentalCtrlEntry8") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","8")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry8")
	end if
	if Request_Form("ParentalCtrlEntry9") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","9")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry9")
	end if
	if Request_Form("ParentalCtrlEntry10") <> "99" then
		TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc","10")
		TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry10")
	end if
	TCWebApi_commit("parentalctrl2_pvc")
elseif Request_Form("PrtCtrl_Flag") = "6" then
	TCWebApi_set("WebCurSet_Entry","parentalctrl2_pvc","ParentalCtrlRuleCurIdx")
	TCWebApi_set("parentalctrl2_pvc","HostName","prtctrlrule_name_edit")
	tcWebApi_constSet("parentalctrl2_pvc","Enable","Yes")
	TCWebApi_set("parentalctrl2_pvc","MAC","prtctrlrule_mac_edit")
	TCWebApi_set("parentalctrl2_pvc","Enable","EnableEntry_edit")
	TCWebApi_set("parentalctrl2_pvc","Policy","prtctl_policy_edit")
	TCWebApi_set("parentalctrl2_pvc","URL","prtctrlrule_url_edit")
	TCWebApi_set("parentalctrl2_pvc","ScheduleNum","ParentalCtrlRuleCurScheduleNum")
	if Request_Form("hSchedule0") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","0")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","1")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule0")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule0_days_editval")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule0_Starttime_edit")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule0_Endtime_edit")	
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule0_Duration_edit")	
	else 
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","0")
	TCWebApi_unset("parentalctrl2_pvc_entry")
	end if
	if Request_Form("hSchedule1") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","1")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","2")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule1")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule1_days_editval")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule1_Starttime_edit")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule1_Endtime_edit")		
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule1_Duration_edit")	
	else 
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","1")
	TCWebApi_unset("parentalctrl2_pvc_entry")
	end if
	if Request_Form("hSchedule2") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","2")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","3")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule2")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule2_days_editval")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule2_Starttime_edit")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule2_Endtime_edit")		
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule2_Duration_edit")	
	else 
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","2")
	TCWebApi_unset("parentalctrl2_pvc_entry")
	end if
	if Request_Form("hSchedule3") <> "N/A" then
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","3")
	TCWebApi_constSet("parentalctrl2_pvc_entry","Index","4")	
	TCWebApi_set("parentalctrl2_pvc_entry","Enable","hEnableSchedule3")	
	TCWebApi_set("parentalctrl2_pvc_entry","Day","Schedule3_days_editval")	
	TCWebApi_set("parentalctrl2_pvc_entry","StartTime","Schedule3_Starttime_edit")
	TCWebApi_set("parentalctrl2_pvc_entry","EndTime","Schedule3_Endtime_edit")		
	TCWebApi_set("parentalctrl2_pvc_entry","Duration","Schedule3_Duration_edit")	
	else 
	TCWebApi_constSet("WebCurSet_Entry","parentalctrl2_pvc_entry","3")
	TCWebApi_unset("parentalctrl2_pvc_entry")
	end if
	TCWebApi_commit("parentalctrl2_pvc")
end if
	TCWebApi_save()
end if
%>
<!doctype html>
<html>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","ParentalControlText","s")%></title>		<meta charset="utf-8">
		<meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="x-ua-compatible" content="IE=edge">
		<script language='javascript' src='/JS/jquery.js'></script>
		<script language='javascript' src='/JS/util.js'></script>
		<script language='javascript' src='/JS/bootstrap.bundle.min.js'></script>
		<script language='javascript' src='/JS/pace.js'></script>
		<link rel="stylesheet" type="text/css" href="/style.css">
		<script language="JavaScript" type="text/JavaScript">
			var first_load = 1;
			var timer;
			var timeout = <% tcWebApi_get("Account_Entry0","StdioTimeout","s") %>;
			function logout_timer_run(t) {
				clearTimeout(timer);
				if (0 !=  Number(timeout))
				{
					timer = setTimeout(function(){ 
						$.ajax({
						   	url: '/cgi-bin/get_live_timeout.cgi',
						   	method: 'GET',
						   	complete: function(res){
								 {
									if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
										Pace.stop();
									}
									var obj = JSON.parse(res.responseText);
									timeout = obj["timeout_left"];
									if (timeout <= 1)
										onDeleteSession();
									else {
										logout_timer_run();
										return;
									}
								}
							}
						}
						)
					},  1000 * Number(timeout));
				}
			}
			function submitLanguageForm(value) {
				if (value != "<%tcWebApi_get("LanguageSwitch_Entry","Type","s")%>") {
					document.LanguageForm.Language_Flag.value = value;
					submitAsync('LanguageForm');
				}
			}
		</script>		<script language="JavaScript" type="text/JavaScript">
		/**Custom multiple select*/	
		function MultiselectDropdown(options, id_name, el_hidden_val){
			var config={
			  search:true,
			  height:'15rem',
			  placeholder:'',
			  txtSelected:'selected',
			  txtAll:'All',
			  txtRemove: 'Remove',
			  txtSearch:'search',
			  ...options
			};
			function newEl(tag,attrs){
			  var e=document.createElement(tag);
			  if(attrs!==undefined) Object.keys(attrs).forEach(k=>{
				if(k==='class') { Array.isArray(attrs[k]) ? attrs[k].forEach(o=>o!==''?e.classList.add(o):0) : (attrs[k]!==''?e.classList.add(attrs[k]):0)}
				else if(k==='style'){  
				  Object.keys(attrs[k]).forEach(ks=>{
					e.style[ks]=attrs[k][ks];
				  });
				 }
				else if(k==='text'){attrs[k]===''?e.innerHTML='&nbsp;':e.innerText=attrs[k]}
				else e[k]=attrs[k];
			  });
			  return e;
			}
			document.querySelectorAll(id_name).forEach((el,k)=>{
			  var is_readonly = 0;
			  if(el.attributes['readonly']) {
				is_readonly = 1;
			  }
			  else {
				is_readonly = 0;
			  }
			  var div=newEl('div',{class:['multiselect-dropdown'].concat('col-lg-12')});
			  //var div=newEl('div',{class:'multiselect-dropdown',style:{width:config.style?.width??el.clientWidth+'px',padding:config.style?.padding??''}});
			  el.style.display='none';
			  el.parentNode.insertBefore(div,el.nextSibling);
			  var listWrap=newEl('div',{class:'multiselect-dropdown-list-wrapper'});
			  var list=newEl('div',{class:'multiselect-dropdown-list',style:{height:config.height}});
			  var search=newEl('input',{class:['multiselect-dropdown-search'].concat([config.searchInput?.class??'form-control']),style:{width:'100%',display:el.attributes['multiselect-search']?.value==='true'?'block':'none'},placeholder:config.txtSearch});
			  listWrap.appendChild(search);
			  div.appendChild(listWrap);
			  listWrap.appendChild(list);
			  el.loadOptions=()=>{
				list.innerHTML='';
				if(el.attributes['multiselect-select-all']?.value=='true'){
				  var op=newEl('div',{class:['multiselect-dropdown-all-selector'].concat('form-group')})
				  var ic=newEl('input',{type:'checkbox'});
				  op.appendChild(ic);
				  op.appendChild(newEl('label',{text:config.txtAll}));
				  op.addEventListener('click',()=>{
					op.classList.toggle('checked');
					op.querySelector("input").checked=!op.querySelector("input").checked;
					var ch=op.querySelector("input").checked;
					list.querySelectorAll(":scope > div:not(.multiselect-dropdown-all-selector)")
					  .forEach(i=>{if(i.style.display!=='none'){i.querySelector("input").checked=ch; i.optEl.selected=ch}});
					el.dispatchEvent(new Event('change'));
				  });
				  ic.addEventListener('click',(ev)=>{
					ic.checked=!ic.checked;
				  });
				  list.appendChild(op);
				}
				Array.from(el.options).map(o=>{
					var op=newEl('div',{class:['form-group', 'days_selopt'].concat(o.selected?'checked':''),optEl:o})
				  var ic=newEl('input',{type:'checkbox',checked:o.selected});
				  if (el_hidden_val.includes(o.value)){
					o.selected = true;
					o.checked = true;
					ic.checked = true;
				}
				  op.appendChild(ic);
				  op.appendChild(newEl('label',{text:o.text}));
				  op.addEventListener('click',()=>{
					op.classList.toggle('checked');
					op.querySelector("input").checked=!op.querySelector("input").checked;
					op.optEl.selected=!!!op.optEl.selected;
					el.dispatchEvent(new Event('change'));
				  });
				  ic.addEventListener('click',(ev)=>{
					ic.checked=!ic.checked;
				  });
				  o.listitemEl=op;
				  list.appendChild(op);
				});
				div.listEl=listWrap;
				var tmp_selected_value;
				div.refresh=()=>{
				  div.querySelectorAll('span.optext, span.placeholder').forEach(t=>div.removeChild(t));
				  var sels=Array.from(el.selectedOptions);
				  var selectedValue = "";
				  if(sels.length>(el.attributes['multiselect-max-items']?.value??7)){
					div.appendChild(newEl('span',{class:['optext','maxselected'],text:sels.length+' '+config.txtSelected}));          
				  }
				  else{
					sels.map(x=>{
					  var c=newEl('span',{class:'optext',text:x.text, srcOption: x});
					  selectedValue = selectedValue + x.text;
					  if((el.attributes['multiselect-hide-x']?.value !== 'true'))
						c.appendChild(newEl('span',{class:'optdel',text:'🗙',title:config.txtRemove, onclick:(ev)=>{c.srcOption.listitemEl.dispatchEvent(new Event('click'));div.refresh();ev.stopPropagation();}}));
					  div.appendChild(c);
					});
				  }
				  if(0==el.selectedOptions.length) {
					selectedValue = "";
					div.appendChild(newEl('span',{class:'placeholder',text:el.attributes['placeholder']?.value??config.placeholder}));
					}
					el.val = selectedValue;
					tmp_selected_value = selectedValue;
				var optdiv_list = div.listEl.querySelector('div.multiselect-dropdown-list');
				optdiv_list.querySelectorAll('div.days_selopt').forEach(t=>optdiv_list.removeChild(t));
				Array.from(el.options).map(o=>{
				  var op=newEl('div',{class:['form-group', 'days_selopt'].concat(o.selected?'checked':''),optEl:o})
				var ic=newEl('input',{type:'checkbox',checked:o.selected});
				if (tmp_selected_value)
				{
					if (tmp_selected_value.includes(o.value)){
					o.selected = true;
					o.checked = true;
					ic.checked = true;
					}
				}
				else {
					ic.checked = false;
					o.checked = false;
				}
				op.appendChild(ic);
				op.appendChild(newEl('label',{text:o.text}));
				op.addEventListener('click',()=>{
				  op.classList.toggle('checked');
				  op.querySelector("input").checked=!op.querySelector("input").checked;
				  op.optEl.selected=!!!op.optEl.selected;
				  el.dispatchEvent(new Event('change'));
				});
				ic.addEventListener('click',(ev)=>{
				  ic.checked=!ic.checked;
				});
				o.listitemEl=op;
				list.appendChild(op);
			  });
				};
				div.refresh();
			  }
			  el.loadOptions();
			  search.addEventListener('input',()=>{
				list.querySelectorAll(":scope div:not(.multiselect-dropdown-all-selector)").forEach(d=>{
				  var txt=d.querySelector("label").innerText.toUpperCase();
				  d.style.display=txt.includes(search.value.toUpperCase())?'block':'none';
				});
			  });
			  if (!is_readonly){
				div.addEventListener('click',()=>{
					div.listEl.style.display='block';
					search.focus();
					search.select();
				});
				document.addEventListener('click', function(event) {
					if (!div.contains(event.target)) {
					listWrap.style.display='none';
					div.refresh();
					}
				});
			  }    
			});
		  }
		</script>
		<script language="javascript" type=text/javascript>
		/* define global variable */
		var ParentalCtrlRuleIdx = 0;
		var LockAdd = false; /* Init, we can add new Parental control rule */
		var LockEdit = false;
		var gLockAddEdit = false;
		var do_add = 0;
		var do_edit = 0;
		var idle_rule_idx = 0;
		var idle_rule_flag = 0;
		var addrule_schedulenum = 0;
		var editrule_schedulenum = 0;
		var indexPrtCtrlRule = 0;
		var MAX_RULE = 11;
		var MAX_SCHEDULE = 4;
		var ParentalControl_Rules = new Array();
		var hasRule = new Array(MAX_RULE);
		var hasSchedule = new Array(MAX_RULE*MAX_SCHEDULE);
		//var nEntryNum = <% tcWebApi_get("ParentalCtrl2_Common","CycleNum","s") %>;
		var vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vEntryEnable = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vEntryMac = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vEntryPolicy = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vEntryUrl = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vEntryScheduleNum = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vScheduleEnable = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vScheduleDay = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vScheduleStarttime = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vScheduleEndtime = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vScheduleDuration = vArrayStr.split(';');
		vArrayStr = "<% tcWebApi_get("ParentalCtrl2_Common","CycleValue","s") %>";
		var vEntryHostName = vArrayStr.split(';');
		function stPrtCtrlRule(index, rulename, mac, access_policy, url, schedule_num, RuleEnabled)
		{
			this.index = index;
			this.rulename = rulename;
			this.mac = mac;
			this.access_policy = access_policy;
			this.url = url;
			this.schedule_num = schedule_num;
			this.RuleEnabled = RuleEnabled;
		}
		for (j = 0; j < MAX_RULE; j++)
		{
			if(vEntryMac[j] != "N/A")
			{
				//var rule_name = "Rule " + (j + 1).toString();
				var rule_name = vEntryHostName[j];
				hasRule[i] = 1;
				ParentalControl_Rules[ParentalCtrlRuleIdx] = new stPrtCtrlRule(j, rule_name, vEntryMac[j], vEntryPolicy[j], vEntryUrl[j], vEntryScheduleNum[j], vEntryEnable[j] );
				ParentalCtrlRuleIdx++;
				/*Get which rule is enabled*/
			}
			else if (0 == idle_rule_flag){
				idle_rule_flag = 1;
				idle_rule_idx = j;
			}
			for (var i = 0; i < MAX_SCHEDULE; i++){
				if(vScheduleEnable[j*MAX_SCHEDULE + i] != "N/A"){
					hasSchedule[j*MAX_SCHEDULE + i ] = 1;
				}
				else {
					hasSchedule[j*MAX_SCHEDULE + i ] = 0;
				}
			}
		}
		function get_first_empty_schedule(index){
			var i;
			for (i=0; i < MAX_SCHEDULE; i++) {
				if (hasSchedule[index*MAX_SCHEDULE + i] != 1) {
					return i;
				}
			}
			return -1;
		}
		function doToggle(addrule){
			var postfix;
			if(addrule == 1){
				postfix = ""
			}
			else {
				postfix = "_edit"
			}
			var ctlName;
			var enable;		
			ctlName = "cb_enableRule" + postfix;
			var is_check = getCheckVal(ctlName);
			if (is_check == 0) enable = 'No';
			else enable = 'Yes';
			ctlName = "EnableEntry"+ postfix;
			setText(ctlName,enable);
			//ctlName = "ParentalCtrlEntry"+ index;
			//etText(ctlName,"1");
			//document.ParentalControlForm.PrtCtrl_Flag.value = "4";
			//submitAsync("ParentalControlForm");
		}
		function doToggleSchedule(index, addrule){
			var postfix;
			if(addrule == 1){
				postfix = ""
			}
			else {
				postfix = "_edit"
			}
			var ctlName;
			var enable;
			var is_check = getCheckVal("cb_enableSchedule" + index.toString() + postfix);
			if (is_check == 0) enable = 'No';
			else enable = 'Yes';
			ctlName = "hEnableSchedule"+ index;
			setText(ctlName,enable);
			//submitAsync("ParentalControlForm");
		}
		function addNewRule(index, addrule, is_apply){
			var i;
			var postfix;
			if(addrule == 1){
				postfix = ""
			}
			else {
				postfix = "_edit"
			}
			var schedule4_days_el = $('#Schedule4' + '_days' + postfix);
			var schedule4_Starttime_el = $('#Schedule4' + '_Starttime' + postfix);
			var schedule4_Endtime_el = $('#Schedule4' + '_Endtime' + postfix);
			var schedule4_Duration_el = $('#Schedule4' + '_Duration' + postfix);
			if (is_apply){
				if (schedule4_days_el.val() == "" && schedule4_Starttime_el.val() == "" && schedule4_Endtime_el.val() == "" && schedule4_Duration_el.val() == ""){
					return;
				}
			}
            i = get_first_empty_schedule(index);
			if (i == 3) {
				$('#Schedule4'+ postfix).hide();
				hasSchedule[index*MAX_SCHEDULE + i] = 1;
			}
			if (i < 0) {
				alert("<%tcWebApi_get("String_Entry","FilterFull","s")%>");
				$('#Schedule4' + postfix).hide();
				return;
			}
			if (addrule) addrule_schedulenum++;
			else editrule_schedulenum++ ;
			/*Check user if enter in 4th schedule or not. If do ==> copy to empty schedule*/
			if (schedule4_days_el.val() != "" || schedule4_Starttime_el.val() != "" || schedule4_Endtime_el.val() != "" || schedule4_Duration_el.val() != ""){
				$('#Schedule'+ i + '_days' + postfix).val(schedule4_days_el.val());
				$('#Schedule'+ i + '_Starttime' + postfix).val(schedule4_Starttime_el.val());
				$('#Schedule'+ i + '_Endtime' + postfix).val(schedule4_Endtime_el.val());
				$('#Schedule'+ i + '_Duration' + postfix).val(schedule4_Duration_el.val());
				var is_schedule4_check = getCheckVal('cb_enableSchedule4' + postfix);
				$('#cb_enableSchedule' + i + postfix).prop("checked", is_schedule4_check);
				if (is_schedule4_check) setText('hEnableSchedule' + i, "Yes");
				else setText('hEnableSchedule' + i, "No");
				$('#Schedule4_name' + postfix).val("");
				$('#Schedule4_days' + postfix).val("");
				$('#Schedule4_Starttime' + postfix).val("");
				$('#Schedule4_Endtime' + postfix).val("");
				$('#Schedule4_Duration' + postfix).val("");
				$('#cb_enableSchedule4' + postfix).prop("checked", false);
			}
			$('#Schedule'+ i + postfix).show();
			hasSchedule[index*MAX_SCHEDULE + i] = 1;
		}
		function rearrange_schedules(index, postfix, addrule) {
			var i,j;
			for (i = 0; i < MAX_SCHEDULE; i++) {
				if (hasSchedule[index * MAX_SCHEDULE + i] == 1) {
					$('#Schedule'+i).show();
				}
				else {
					for (j = i + 1; j < MAX_SCHEDULE; j++) {
						if (hasSchedule[index * MAX_SCHEDULE + i] == 1) {
							$('#Schedule' + i + '_name' + postfix).val($('#Schedule' + j + '_name' + postfix).val());
							$('#Schedule' + i  + '_days' + postfix).val($('#Schedule' + j + '_days' + postfix).val());
							if(addrule){
								$('#Schedule' + i + '_days_addval').val($('#Schedule' + j + '_days_addval').val());
							}
							else {
								$('#Schedule' + i + '_days_editval').val($('#Schedule' + j + '_days_editval').val());
							}
							$('#Schedule' + i  + '_Starttime' + postfix).val($('#Schedule' + j  + '_Starttime' + postfix).val());
							$('#Schedule' + i  + '_Endtime' + postfix).val($('#Schedule' + j  + '_Endtime' + postfix).val());
							$('#Schedule' + i  + '_Duration' + postfix).val($('#Schedule' + j  + '_Duration' + postfix).val());
							$('#cb_enableSchedule' + i + postfix).prop("checked", getCheckVal('cb_enableSchedule' + j + postfix));
							hasSchedule[index*MAX_SCHEDULE + i] = 1;
							hasSchedule[index*MAX_SCHEDULE + j] = 0;
							$('#Schedule'+ i  + postfix).show();
							$('#Schedule'+ j  + postfix).hide();
							$('#Schedule' + j  + '_name' + postfix).val("");
							$('#Schedule' + j  +  '_days' + postfix).val("");
							$('#Schedule' + j  +  '_Starttime' + postfix).val("");
							$('#Schedule' + j  +  '_Endtime' + postfix).val("");
							$('#Schedule' + j  +  '_Duration' + postfix).val("");
							$('#cb_enableSchedule' + i + postfix).prop("checked", false);
							if(addrule){
								$('#Schedule' + j + '_days_addval').val("N/A");
							}
							else {
								$('#Schedule' + j + '_days_editval').val("N/A");
							}
							break;
						}
					}
				}
			}
		}
		function doDeleteEntry(index, schedule_idx, addrule){
			var postfix;
			if(addrule == 1){
				postfix = ""
			}
			else {
				postfix = "_edit"
			}
			$('#Schedule4' + postfix).show();
			$('#Schedule'+ schedule_idx  + postfix).hide();
			//$('#Schedule' + schedule_idx + '_name' + postfix).val("");
			$('#Schedule' + schedule_idx + '_days' +  postfix).val("");
			$('#Schedule' + schedule_idx + '_Starttime' + postfix).val("");
			$('#Schedule' + schedule_idx + '_Endtime' + postfix).val("");
			$('#Schedule' + schedule_idx + '_Duration' + postfix).val("");	
			if(addrule){
				$('#Schedule' + schedule_idx + '_days_addval').val("N/A");
			}
			else {
				$('#Schedule' + schedule_idx + '_days_editval').val("N/A");
			}
			hasSchedule[index * MAX_SCHEDULE + schedule_idx] = 0; 
			if(addrule) addrule_schedulenum -- ;
			else editrule_schedulenum -- ;
			rearrange_schedules(index, postfix, addrule);
		}
		function toggle_checkbox(source) {
			checkboxes = document.getElementsByName('rml');
			for(var i = 0, n = checkboxes.length; i < n; i++) {
				checkboxes[i].checked = source.checked;
			}
		}
		function selectElement(id, valueToSelect) {    
			let element = document.getElementById(id);
			element.value = valueToSelect;
		}
		function togglePolicy(addrule, sPolicy){
			var postfix;
			if(addrule == 1){
				postfix = ""
			}
			else {
				postfix = "_edit"
			}
			if (!addrule)selectElement("prtctl_policy" + postfix, sPolicy)
			if ($('#prtctl_policy' + postfix).val() == "Allow") {
				$("#prtctrlrule_url_div" + postfix).show();
				$("#schedules_table" + postfix).show();
				$("#prtctrlrule_url_div" + postfix).children().prop('disabled',false);
				$("#schedules_table" + postfix).children().prop('disabled',false);				
			}
			else {
				$("#prtctrlrule_url_div" + postfix).hide();
				$("#schedules_table" + postfix).hide();
				$("#prtctrlrule_url_div" + postfix).children().prop('disabled',true);
				$("#schedules_table" + postfix).children().prop('disabled',true);
			}
			return;
		}
		function ShowPrtctrlMapping(){
			setDisable('ButtonAdd',0);
			var i;
			/* Create Table */
			var html = '<table class="table-bordered-radius simple-table table-responsive w-100">'
						+'<thead class="thead-light">'
							+'<tr align="middle">'
								+'<th scope="col">'
								+ '<div class="custom-control custom-checkbox col-lg-3 custom_cb_table">'
								+ '<input type="checkbox" class="custom-control-input" name="checkall" id="checkall" onclick="toggle_checkbox(this)">'
								+ '<label class="custom-control-label" for="checkall"></label>'
								+ '</div>'
								+ '</th>' /* Check */
								+'<th scope="col" ><%tcWebApi_get("String_Entry","ParentalRuleNameText","s")%></th>' 
								+'<th scope="col" style="width: 200px;"><%tcWebApi_get("String_Entry","ParentalMACAddressText","s")%></th>' 
								+'<th scope="col" style="word-wrap: break-word; width: 100px;" ><%tcWebApi_get("String_Entry","ParentalAccessPolicyText","s")%></th>' 
								+'<th scope="col" style="word-wrap: break-word; width: 200px;" ><%tcWebApi_get("String_Entry","ParentalURLText","s")%></th>' 
								+'<th scope="col" style="word-wrap: break-word; width: 110px;"><%tcWebApi_get("String_Entry","ParentalScheduleText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","ParentalControlStatusText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","ButtonEditText","s")%></th>' 
							+'</tr>'
						+'</thead>';
			ParentalCtrlRuleIdx = 0; /* Initialize Entry Index*/
			html += '<tbody>';
			if (0 == ParentalControl_Rules.length ) /*If no Rules is available: empty table*/
			{
				html += '<tr align="middle">';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
				html += '</tr>';
			}
			else
			{
				//function stPrtCtrlRule(index, rulename, mac, access_policy, url, schedule_num, enabled)
				for (i = 0; i < ParentalControl_Rules.length; i++)
				{
					html += '<tr align="middle">';
						html += '<td align="center">'; /*Checkbox for multiple select*/
							html  += '<div class="custom-control custom-checkbox col-lg-3 custom_cb_table">';
								html += '<input type="checkbox" class="custom-control-input" name="rml" id="cb_'+ ParentalControl_Rules[i].index + '" value="'+ ParentalControl_Rules[i].index + '">';
								html += '<label class="custom-control-label" for="cb_'+ ParentalControl_Rules[i].index + '"></label>';
							html += '</div>';
						html += '</td>';/* rml is checkbox */
						html += '<td align="center">' + getDisplayText(ParentalControl_Rules[i].rulename,20) + '&nbsp;</td>';
						html += '<td align="center">' + getDisplayText(ParentalControl_Rules[i].mac,18) + '&nbsp;</td>';
						if (ParentalControl_Rules[i].access_policy == "Allow")
						{
							html += '<td align="center">' + '<%tcWebApi_get("String_Entry","ParentalAccessPolicyAllow","s")%>' + '&nbsp;</td>';
						}
						else
						{
							/* do toggle Enable/Disable */
							html += '<td align="center">' + '<%tcWebApi_get("String_Entry","ParentalAccessPolicyDeny","s")%>' + '&nbsp;</td>';
						}
						// html += '<td align="center">' + getDisplayText(ParentalControl_Rules[i].access_policy,8) + '&nbsp;</td>';
						html += '<td align="center">' + getDisplayText(ParentalControl_Rules[i].url,50) + '&nbsp;</td>';
						html += '<td align="center">' + getDisplayText(ParentalControl_Rules[i].schedule_num,2) + '&nbsp;</td>';
						if (ParentalControl_Rules[i].RuleEnabled == "Yes")
						{
							html += '<td align="center">' + '<%tcWebApi_get("String_Entry","EnableText","s")%>' + '&nbsp;</td>';
						}
						else
						{
							/* do toggle Enable/Disable */
							html += '<td align="center">' + '<%tcWebApi_get("String_Entry","DisableText","s")%>' + '&nbsp;</td>';
						}
						html += '<td align="center">';
							html += '<em data-toggle="tooltip" data-placement="top" title="" class="fa fa-pencil-alt icon-btn" onclick="doEdit(' + ParentalControl_Rules[i].index +')" data-original-title="Edit"></em>';
						html += '</td>';
					html += '</tr>';
					html += '<tr  ><td id=tr_edit' + ParentalControl_Rules[i].index + ' style="DISPLAY:none" colspan=8 ></td></tr>';
					ParentalCtrlRuleIdx++; /*get number of index*/
				}
			}
			html += '</tbody>';
			html += '</table>';
			getElById('parentalControlInfo').innerHTML = html;
		}
		/*Cancel Add new Parental Control Rule ==> Set ConfigInfo to null */
		function doCancelAdd(){
			do_add = 0;
			LockAdd = false;
			gLockAddEdit = false;
			getElById('ButtonAdd').disabled = false;
			var html = '';
			getElById('ConfigInfo').innerHTML = html;
		}
		function doCancelEdit(index){
			LockEdit = false;
			gLockAddEdit = false;
			do_edit = 0;
			var html = '';
			getElById('tr_edit'+ index).style.display = "none";
			getElById('tr_edit'+ index).innerHTML = html;
			for (var i = 0; i < MAX_SCHEDULE; i++){
				var hEnableSchedule = "hEnableSchedule" + i;
				var hSchedule = "hSchedule" + i;
				setText(hEnableSchedule, "No");
				setText(hSchedule, "No");
			}
		}
		function ShowConfigInfo()
		{
			var i;
			var x;
			addrule_schedulenum = 0;
			/* Create Table */
			if(LockAdd == false) /* Flag >< LockAdd */
			{
				LockAdd = true;
				var html ='<div class="form-group">' 
						+ '<label class="col-lg-5" for="prtctrlrule_name"><%tcWebApi_get("String_Entry","ParentalRuleNameText","s")%></label>'
						+ '<input type="text" class="form-control col-lg-7" name="prtctrlrule_name" size="32" maxlength="30" id="prtctrlrule_name" value="">'
						+ '<input type="hidden" maxLength=6 size=6 name="prtctrlrule_idx" id="prtctrlrule_idx">'
					+ '</div>'
					+ '<div class="form-group">'
						+ '<label class="col-lg-5" for="prtctrlrule_enable"><%tcWebApi_get("String_Entry","MACFilterActiveYText","s")%></label>'
						+ '<label class="toggle-switch">'
							+ '<input id=cb_enableRule onclick="doToggle(1)" checked type=checkbox name="cb_enableRule">'
							+ '<span class="slider"></span>'
							+ '<input id=enableRule type=hidden name="enableRule">'
						+ '</label>'
					+ '</div>'
					+ '<div class="form-group custom_tooltip">' /*mac*/
						+ '<label class="col-lg-5" for="prtctrlrule_mac"><%tcWebApi_get("String_Entry","ParentalMACAddressText","s")%></label>'
						+ '<input type="text" class="form-control col-lg-7" name="prtctrlrule_mac" id="prtctrlrule_mac" value="">'
					+ '</div>'
					+ '<div class="form-group">' 
						+ '<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","ParentalAccessPolicyText","s")%></label>'
						+ '<div class="col-lg-7 custom-select" name="select_policy" id="select_policy">'
							+ '<select id="prtctl_policy" name="prtctl_policy" onchange="togglePolicy(1, this.value)">'
									+ '<option value="Allow" ><%tcWebApi_get("String_Entry","ParentalAccessPolicyAllow","s")%></option>'
									+ '<option value="Deny" ><%tcWebApi_get("String_Entry","ParentalAccessPolicyDeny","s")%></option>'
							+ '</select>'
						+ '</div>'
					+ '</div>'
					+ '<div class="form-group" id="prtctrlrule_url_div">' /*url*/
						+ '<label class="col-lg-5" for="prtctrlrule_url"><%tcWebApi_get("String_Entry","ParentalBlockURL","s")%></label>'
						+ '<input type="text" class="form-control col-lg-7" name="prtctrlrule_url" id="prtctrlrule_url" value="">'
					+ '</div>'
					/*Add scheduling div*/
					+ '<div class="form-group" id="schedules_table">'
						+ '<label class="col-lg-5" for="prtctrlrule_schedules" style="margin-bottom:10px;">Schedules</label>'
						+ '<div class="table-responsive col-xs-11 col-sm-11" style="float: none; margin: 0 auto; text-align: center;">'
							+ '<table style="margin: auto auto 180px auto; width:100%" class="table-bordered-radius simple-table">'
								+ '<thead>'
									+ '<tr class="table-head" style="text-align: center;">'
										+ '<th><%tcWebApi_get("String_Entry","IndexText","s")%></th>'
										+ '<th style="width: 320px;"><%tcWebApi_get("String_Entry","ParentalDayText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","ParentalStartTimeText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","ParentalEndTimeText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","EnableText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","ButtonActionTextLower","s")%></th>'
									+ '</tr>'
								+ '</thead>'
								+ '<tbody>'
									+ '<tr id="Schedule0" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule0_name" id="Schedule0_name" value="1" readonly>'
										+ '</td>'
										+ '<td>'
												+ '<input type="hidden" id="Schedule0_days_addval" name="Schedule0_days_addval" value="N/A">'
												+ '<select name="Schedule0_days" id="Schedule0_days" style="width: 30em" multiple>'
													+ '<option value="1">Mon</option>'
													+ '<option value="2">Tue</option>'
													+ '<option value="3">Wed</option>'
													+ '<option value="4">Thu</option>'
													+ '<option value="5">Fri</option>'
													+ '<option value="6">Sat</option>'
													+ '<option value="0">Sun</option>'
												+ '</select>'										
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule0_Starttime" id="Schedule0_Starttime">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name="Schedule0_Duration" id="Schedule0_Duration">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule0_Endtime" id="Schedule0_Endtime">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											+ '<label class="col-lg-5" for="cb_enableSchedule0"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule0 onclick="doToggleSchedule(0, 1)" type=checkbox name="cb_enableSchedule0">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule0 type=hidden name="enableSchedule0">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + idle_rule_idx + ',0, 1)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule1" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule1_name" id="Schedule1_name" value="2" readonly>'
										+ '</td>'
										+ '<td>'
											+ '<input type="hidden" id="Schedule1_days_addval" name="Schedule1_days_addval" value="N/A">'
											+ '<select name="Schedule1_days" id="Schedule1_days" style="width: 30em" multiple>'
												+ '<option value="1">Mon</option>'
												+ '<option value="2">Tue</option>'
												+ '<option value="3">Wed</option>'
												+ '<option value="4">Thu</option>'
												+ '<option value="5">Fri</option>'
												+ '<option value="6">Sat</option>'
												+ '<option value="0">Sun</option>'
											+ '</select>'										
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule1_Starttime" id="Schedule1_Starttime">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name = "Schedule1_Duration" id="Schedule1_Duration">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule1_Endtime" id="Schedule1_Endtime">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											+ '<label class="col-lg-5" for="cb_enableSchedule1"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule1 onclick="doToggleSchedule(1, 1)" type=checkbox name="cb_enableSchedule1">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule1 type=hidden name="enableSchedule1">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + idle_rule_idx + ',1, 1)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule2" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule2_name" id="Schedule2_name" value="3" readonly>'
										+ '</td>'
										+ '<td>'
											+ '<input type="hidden" id="Schedule2_days_addval" name="Schedule2_days_addval" value="N/A">'								
											+ '<select name="Schedule2_days" id="Schedule2_days" style="width: 30em" multiple>'
												+ '<option value="1">Mon</option>'
												+ '<option value="2">Tue</option>'
												+ '<option value="3">Wed</option>'
												+ '<option value="4">Thu</option>'
												+ '<option value="5">Fri</option>'
												+ '<option value="6">Sat</option>'
												+ '<option value="0">Sun</option>'
											+ '</select>'									
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule2_Starttime" id="Schedule2_Starttime">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name = "Schedule2_Duration" id="Schedule2_Duration">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule2_Endtime" id="Schedule2_Endtime">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											//+ '<label class="col-lg-5" for="cb_enablerule2"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule2 onclick="doToggleSchedule(2, 1)" type=checkbox name="cb_enableSchedule2">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule2 type=hidden name="enableSchedule2">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + idle_rule_idx + ',2, 1)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule3" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule3_name" id="Schedule3_name" value="4" readonly>'
										+ '</td>'
										+ '<td>'			
											+ '<input type="hidden" id="Schedule3_days_addval" name="Schedule3_days_addval" value="N/A">'					
											+ '<select name="Schedule3_days" id="Schedule3_days" style="width: 30em" multiple>'
												+ '<option value="1">Mon</option>'
												+ '<option value="2">Tue</option>'
												+ '<option value="3">Wed</option>'
												+ '<option value="4">Thu</option>'
												+ '<option value="5">Fri</option>'
												+ '<option value="6">Sat</option>'
												+ '<option value="0">Sun</option>'
											+ '</select>'										
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule3_Starttime" id="Schedule3_Starttime">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name = "Schedule3_Duration" id="Schedule3_Duration">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule3_Endtime" id="Schedule3_Endtime">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											+ '<label class="col-lg-5" for="cb_enableSchedule3"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule3 onclick="doToggleSchedule(3, 1)" type=checkbox name="cb_enableSchedule3">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule3 type=hidden name="enableSchedule3">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + idle_rule_idx + ',3, 1)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule4" style="text-align: center">'
										//Rule name
										+ '<td>'
											+ '<INPUT type="text" maxLength=1 size=1 name="Schedule4_name" id="Schedule4_name" value="" readonly>'
									+ '</td>'
									+ '<td>'
										+ '<input type="hidden" id="Schedule4_days_addval" name="Schedule4_days_addval" value="N/A">'								
										+ '<select name="Schedule4_days" id="Schedule4_days" style="width: 30em" multiple>'
											+ '<option value="1">Mon</option>'
											+ '<option value="2">Tue</option>'
											+ '<option value="3">Wed</option>'
											+ '<option value="4">Thu</option>'
											+ '<option value="5">Fri</option>'
											+ '<option value="6">Sat</option>'
											+ '<option value="0">Sun</option>'
										+ '</select>'								
									+ '</td>'
									//Rule Start time
									+ '<td>'
										+ '<INPUT type="text" maxLength=6 size=6 name="Schedule4_Starttime" id="Schedule4_Starttime">'
									+ '</td>'
									//Rule Duration
									+ '<td>'
										+ '<input type="hidden" maxLength=6 size=6  name = "Schedule4_Duration" id="Schedule4_Duration">'
										+ '<INPUT type="text" maxLength=6 size=6 name="Schedule4_Endtime" id="Schedule4_Endtime">'
									+ '</td>'
									//Rule enable
									+ '<td align="center">'
										+ '<label class="col-lg-5" for="cb_enableSchedule4"></label>'
										+ '<label class="toggle-switch">'
											+ '<input id=cb_enableSchedule4 type=checkbox name="cb_enableSchedule4">'
											+ '<span class="slider"></span>'
											+ '<input id=enableSchedule4' + ' type=hidden name="enableSchedule4">'
										+ '</label>'
									+ '</td>'
										+ '<td>'
											+ '<i class="fas icon-btn-renew fa-plus fa-lg" onmouseover=this.style.cursor="hand" onclick="addNewRule(' + idle_rule_idx + ', 1, 0)"></i>'
										+ '</td>'
									+ '</tr>'
								+ '</tbody>'
							+ '</table>'
						+ '</div>'
					+ '</div>'
					/*End scheduling div*/	
					+ '<div class="d-flex align-items-center justify-content-center">'
						+ '<button type="button" class="page-button small-button" onclick="doApply(1,1,99);"><%tcWebApi_get("String_Entry","PFButtonApplyText","s")%></button>'
						+ '<button type="button" class="action-button small-button" onclick="doCancelAdd();" name="ButtonCancelAdd" id= "ButtonCancelAdd"><%tcWebApi_get("String_Entry","PFButtonCancelEditText","s")%></button>'
					+ '</div>';
				getElById('ConfigInfo').innerHTML = html;
				var select_policy = document.getElementById('select_policy');
				generate_cs(select_policy);
				MultiselectDropdown(null, "#Schedule0_days", getValue('Schedule0_days_addval'));
				MultiselectDropdown(null, "#Schedule1_days", getValue('Schedule1_days_addval'));
				MultiselectDropdown(null, "#Schedule2_days", getValue('Schedule2_days_addval'));
				MultiselectDropdown(null, "#Schedule3_days", getValue('Schedule3_days_addval'));
				MultiselectDropdown(null, "#Schedule4_days", getValue('Schedule4_days_addval'));
			}
			else if(LockAdd == true)
			{
				var html = '';
				getElById('ConfigInfo').innerHTML = html;
			}
		}
		function fill_edit_value(index){
			var fill_rule_idx = 0;
			var index_tmp = index;
			for (var j = 0; j < ParentalCtrlRuleIdx; j++){
				if (ParentalControl_Rules[j].index == index){
					fill_rule_idx = j;
					break;
				}
			}
			index = fill_rule_idx;
			editrule_schedulenum = ParentalControl_Rules[index].schedule_num
			if(editrule_schedulenum == "4") $('#Schedule4_edit').hide();
			setText("prtctrlrule_name_edit", ParentalControl_Rules[index].rulename);
			setText("prtctrlrule_url_edit", ParentalControl_Rules[index].url);
			setText("prtctrlrule_mac_edit", ParentalControl_Rules[index].mac);
			setSelect('prtctl_policy_edit',ParentalControl_Rules[index].access_policy);
			togglePolicy(0, ParentalControl_Rules[index].access_policy)
			if(ParentalControl_Rules[index].RuleEnabled == "Yes")
				setCheck('cb_enableRule_edit', 1);	//sonnh
			else
				setCheck('cb_enableRule_edit', 0);	//sonnh
			doToggle(0);
			for(var i = 0; i < MAX_SCHEDULE ; i++){
				if (hasSchedule[index_tmp*MAX_SCHEDULE + i]){
					setText('Schedule' + i + '_name_edit', i + 1);
					//setText('Schedule' + i + '_days_edit', vScheduleDay[index*MAX_SCHEDULE + i]);
					setText('Schedule' + i + '_Starttime_edit', vScheduleStarttime[index_tmp*MAX_SCHEDULE + i]);
					//setText('Schedule' + i + '_Endtime_edit', vScheduleEndtime[index_tmp*MAX_SCHEDULE + i]);
					setText('Schedule' + i + '_Duration_edit', vScheduleDuration[index_tmp*MAX_SCHEDULE + i]);
					setText('Schedule' + i + '_Endtime_edit',secsToTime(timetoSecs(vScheduleStarttime[index_tmp*MAX_SCHEDULE + i]) + Number(vScheduleDuration[index_tmp*MAX_SCHEDULE + i])));
					if (vScheduleEnable[index_tmp* MAX_SCHEDULE + i] == "Yes")
						setCheck('cb_enableSchedule' + i +'_edit', 1);
					else setCheck('cb_enableSchedule' + i +'_edit', 0);
					$('#Schedule'+ i + '_edit').show();
					setText("Schedule" + i + "_days_editval", vScheduleDay[index_tmp*MAX_SCHEDULE + i]);
					/*
					setText("Schedule1_days_editval", '1,2');
					setText("Schedule2_days_editval", '1,2,3');
					setText("Schedule3_days_editval", '2,6');
					*/
				}
				else {
					$('#Schedule'+ i ).hide();
				}
				doToggleSchedule(i , 0);
			}
			/*
			var policy = document.getElementById("prtctl_policy_edit");
			policy.value = "Allow";
			*/
		}
		function RemoveParentalCtrlRule(Form, CheckTag){
			var rml = document.getElementsByName(CheckTag);
			var i;
			if (rml.length > 0)
			{
				for (i = 0; i < rml.length; i++)
				{
					if (rml[i].checked == true)
					{
						/*Form.addParameter(rml[i].value,'');*/
						var ctlName = "ParentalCtrlEntry" + (ParentalControl_Rules[i].index).toString();
						setText(ctlName,rml[i].value);
					}
				}
			}
			else if (rml.checked == true)
			{
				/*Form.addParameter(rml.value,'');*/
				var ctlName = "ParentalCtrlEntry0";
				setText(ctlName,rml.value);		
			}
		}
		function doEdit(index){
			if (do_add == 1){
				alert("<%tcWebApi_get("String_Entry","ParentalControlCannotEditText","s")%>");
				return;
			}
			do_edit = 1;
			var i;
			var x;
			if(false == gLockAddEdit)
			{
				gLockAddEdit = true;
				if(false == LockEdit)
				{	
					LockEdit = true;
						var html ='<div class="form-group">'
						+ '<label class="col-lg-5" for="prtctrlrule_name_edit"><%tcWebApi_get("String_Entry","ParentalRuleNameText","s")%></label>'
						+ '<input type="text" class="form-control col-lg-7" name="prtctrlrule_name_edit" size="32" maxlength="30" id="prtctrlrule_name_edit" value="">'
					+ '</div>'
					/*Rule enable*/
					+ '<div class="form-group">'
						+ '<label class="col-lg-5" for="prtctrlrule_enable_edit"><%tcWebApi_get("String_Entry","EnableText","s")%></label>'
						+ '<label class="toggle-switch">'
							+ '<input id=cb_enableRule_edit onclick="doToggle(0)" type=checkbox name="cb_enableRule_edit">'
							+ '<span class="slider"></span>'
							+ '<input id=enableRule_edit type=hidden name="enableRule_edit">'
						+ '</label>'
					+ '</div>'
					+ '<div class="form-group">' /*mac*/
						+ '<label class="col-lg-5" for="prtctrlrule_mac_edit"><%tcWebApi_get("String_Entry","ParentalMACAddressText","s")%></label>'
						+ '<input type="text" class="form-control col-lg-7" name="prtctrlrule_mac_edit" id="prtctrlrule_mac_edit" value="">'
					+ '</div>'
					+ '<div class="form-group" id="prtctrlrule_url_div_edit">' /*url*/
						+ '<label class="col-lg-5" for="prtctrlrule_url_edit"><%tcWebApi_get("String_Entry","ParentalURLText","s")%></label>'
						+ '<input type="text" class="form-control col-lg-7" name="prtctrlrule_url_edit" size="32" id="prtctrlrule_url_edit" value="">'
					+ '</div>'
					+ '<div class="form-group">' 
						+ '<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","ParentalAccessPolicyText","s")%></label>'
						+ '<div class="col-lg-7 custom-select" name="select_policy_edit" id="select_policy_edit">'
							+ '<select id="prtctl_policy_edit" name="prtctl_policy_edit" onchange="togglePolicy(0, this.value)">'
									+ '<option value="Allow" ><%tcWebApi_get("String_Entry","ParentalAccessPolicyAllow","s")%></option>'
									+ '<option value="Deny" ><%tcWebApi_get("String_Entry","ParentalAccessPolicyDeny","s")%></option>'
							+ '</select>'
						+ '</div>'
					+ '</div>'
					/*Add scheduling div*/
					+ '<div class="form-group" id="schedules_table_edit">'
						+ '<label class="col-lg-5" for="prtctrlrule_schedules" style="margin-bottom:10px;"><%tcWebApi_get("String_Entry","ParentalScheduleText","s")%></label>'
						+ '<div class="table-responsive col-xs-11 col-sm-11" style="float: none; margin: 0 auto; text-align: center;">'
							+ '<table style="margin: auto auto 180px auto; width:100%" class="table-bordered-radius simple-table">'
								+ '<thead>'
									+ '<tr class="table-head" style="text-align: center;">'
										+ '<th><%tcWebApi_get("String_Entry","IndexText","s")%></th>'
										+ '<th style="width: 320px;"><%tcWebApi_get("String_Entry","ParentalDayText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","ParentalStartTimeText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","ParentalEndTimeText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","EnableText","s")%></th>'
										+ '<th><%tcWebApi_get("String_Entry","ButtonActionTextLower","s")%></th>'
									+ '</tr>'
								+ '</thead>'
								+ '<tbody>'
									+ '<tr id="Schedule0_edit" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule0_name_edit" id="Schedule0_name_edit" value="1" readonly>'
										+ '</td>'
										+ '<td>'
											+ '<input type="hidden" id="Schedule0_days_editval" name="Schedule0_days_editval" value="N/A">'
											+ '<select name="Schedule0_days_edit" id="Schedule0_days_edit" style="width: 30em" multiple>'
												+ '<option value="1">Mon</option>'
												+ '<option value="2">Tue</option>'
												+ '<option value="3">Wed</option>'
												+ '<option value="4">Thu</option>'
												+ '<option value="5">Fri</option>'
												+ '<option value="6">Sat</option>'
												+ '<option value="0">Sun</option>'
												//+ '<option value="7">New</option>'
											+ '</select>'		
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule0_Starttime_edit" id="Schedule0_Starttime_edit">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name = "Schedule0_Duration_edit" id="Schedule0_Duration_edit">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule0_Endtime_edit" id="Schedule0_Endtime_edit">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											+ '<label class="col-lg-5" for="cb_enableSchedule0_edit"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule0_edit onclick="doToggleSchedule(0, 0)" type=checkbox name="cb_enableSchedule0_edit">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule0_edit type=hidden name="enableSchedule0_edit">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + index + ',0, 0)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule1_edit" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule1_name_edit" id="Schedule1_name_edit" value="2" readonly>'
										+ '</td>'
										+ '<td>'
											+ '<input type="hidden" id="Schedule1_days_editval" name="Schedule1_days_editval" value="N/A">'
											+ '<select name="Schedule1_days_edit" id="Schedule1_days_edit" style="width: 30em" multiple>'
												+ '<option value="1">Mon</option>'
												+ '<option value="2">Tue</option>'
												+ '<option value="3">Wed</option>'
												+ '<option value="4">Thu</option>'
												+ '<option value="5">Fri</option>'
												+ '<option value="6">Sat</option>'
												+ '<option value="0">Sun</option>'
											+ '</select>'		
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule1_Starttime_edit" id="Schedule1_Starttime_edit">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name = "Schedule1_Duration_edit" id="Schedule1_Duration_edit">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule1_Endtime_edit" id="Schedule1_Endtime_edit">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											+ '<label class="col-lg-5" for="cb_enableSchedule1_edit"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule1_edit onclick="doToggleSchedule(1, 0)" type=checkbox name="cb_enableSchedule1_edit">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule1_edit type=hidden name="enableSchedule1_edit">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + index + ',1, 0)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule2_edit" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule2_name_edit" id="Schedule2_name_edit" value="3" readonly>'
										+ '</td>'
										+ '<td>'
											+ '<input type="hidden" id="Schedule2_days_editval" name="Schedule2_days_editval" value="N/A">'
											+ '<select name="Schedule2_days_edit" id="Schedule2_days_edit" style="width: 30em" multiple>'
												+ '<option value="1">Mon</option>'
												+ '<option value="2">Tue</option>'
												+ '<option value="3">Wed</option>'
												+ '<option value="4">Thu</option>'
												+ '<option value="5">Fri</option>'
												+ '<option value="6">Sat</option>'
												+ '<option value="0">Sun</option>'
											+ '</select>'		
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule2_Starttime_edit" id="Schedule2_Starttime_edit">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name = "Schedule2_Duration_edit" id="Schedule2_Duration_edit">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule2_Endtime_edit" id="Schedule2_Endtime_edit">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											//+ '<label class="col-lg-5" for="cb_enablerule2"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule2_edit onclick="doToggleSchedule(2, 0)" type=checkbox name="cb_enableSchedule2_edit">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule2_edit type=hidden name="enableSchedule2_edit">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + index + ',2, 0)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule3_edit" style="text-align: center; display: none;">'
										//Rule name
										+ '<td>'
												+ '<INPUT type="text" maxLength=1 size=1 name="Schedule3_name_edit" id="Schedule3_name_edit" value="4" readonly>'
										+ '</td>'
										+ '<td>'
											+ '<input type="hidden" id="Schedule3_days_editval" name="Schedule3_days_editval" value="N/A">'
											+ '<select name="Schedule3_days_edit" id="Schedule3_days_edit" style="width: 30em" multiple>'
												+ '<option value="1">Mon</option>'
												+ '<option value="2">Tue</option>'
												+ '<option value="3">Wed</option>'
												+ '<option value="4">Thu</option>'
												+ '<option value="5">Fri</option>'
												+ '<option value="6">Sat</option>'
												+ '<option value="0">Sun</option>'
											+ '</select>'		
										+ '</td>'
										//Rule Start time
										+ '<td>'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule3_Starttime_edit" id="Schedule3_Starttime_edit">'
										+ '</td>'
										//Rule Duration
										+ '<td>'
											+ '<input type="hidden" maxLength=6 size=6  name = "Schedule3_Duration_edit" id="Schedule3_Duration_edit">'
											+ '<INPUT type="text" maxLength=6 size=6 name="Schedule3_Endtime_edit" id="Schedule3_Endtime_edit">'
										+ '</td>'
										//Rule enable
										+ '<td align="center">'
											+ '<label class="col-lg-5" for="cb_enableSchedule3_edit"></label>'
											+ '<label class="toggle-switch">'
												+ '<input id=cb_enableSchedule3_edit onclick="doToggleSchedule(3, 0)" type=checkbox name="cb_enableSchedule3_edit">'
												+ '<span class="slider"></span>'
												+ '<input id=enableSchedule3_edit type=hidden name="enableSchedule3_edit">'
											+ '</label>'
										+ '</td>'
										+ '<td>'
											+ '<i class="fas fa-times icon-btn-delete fa-lg" onmouseover=this.style.cursor="hand" onclick="doDeleteEntry(' + index + ',3, 0)"></i>'
										+ '</td>'
									+ '</tr>'
									+ '<tr id="Schedule4_edit" style="text-align: center">'
										//Rule name
										+ '<td>'
											+ '<INPUT type="text" maxLength=1 size=1 name="Schedule4_name_edit" id="Schedule4_name_edit" value="" readonly>'
									+ '</td>'
									+ '<td>'
										+ '<input type="hidden" id="Schedule4_days_editval" name="Schedule4_days_editval" value="N/A">'
										+ '<select name="Schedule4_days_edit" id="Schedule4_days_edit" style="width: 30em" multiple>'
											+ '<option value="1">Mon</option>'
											+ '<option value="2">Tue</option>'
											+ '<option value="3">Wed</option>'
											+ '<option value="4">Thu</option>'
											+ '<option value="5">Fri</option>'
											+ '<option value="6">Sat</option>'
											+ '<option value="0">Sun</option>'
										+ '</select>'		
									+ '</td>'
									//Rule Start time
									+ '<td>'
										+ '<INPUT type="text" maxLength=6 size=6 name="Schedule4_Starttime_edit" id="Schedule4_Starttime_edit">'
									+ '</td>'
									//Rule Duration
									+ '<td>'
										+ '<input type="hidden" maxLength=6 size=6  name = "Schedule4_Duration_edit" id="Schedule4_Duration_edit">'
										+ '<INPUT type="text" maxLength=6 size=6 name="Schedule4_Endtime_edit" id="Schedule4_Endtime_edit">'
									+ '</td>'
									//Rule enable
									+ '<td align="center">'
										+ '<label class="col-lg-5" for="cb_enableSchedule4_edit"></label>'
										+ '<label class="toggle-switch">'
											+ '<input id=cb_enableSchedule4_edit type=checkbox name="cb_enableSchedule4_edit">'
											+ '<span class="slider"></span>'
											+ '<input id=enableSchedule4_edit' + ' type=hidden name="enableSchedule4_edit">'
										+ '</label>'
									+ '</td>'
										+ '<td>'
											+ '<i class="fas icon-btn-renew fa-plus fa-lg" onmouseover=this.style.cursor="hand" onclick="addNewRule(' + index + ', 0, 0)"></i>'
										+ '</td>'
									+ '</tr>'
								+ '</tbody>'
							+ '</table>'
						+ '</div>'
					+ '</div>'
					/*End scheduling div*/	
							+ '<div class="d-flex align-items-center justify-content-center">'
								+ '<button type="button" class="page-button small-button" onclick="doApply(1,0,'+ index +');"><%tcWebApi_get("String_Entry","PFButtonApplyText","s")%></button>'
								+ '<button type="button" class="action-button small-button" onclick="doCancelEdit('+ index +');" name="ButtonCancelEdit" id= "ButtonCancelEdit"><%tcWebApi_get("String_Entry","PFButtonCancelEditText","s")%></button>'
							+ '</div>';
						getElById('tr_edit'+ index).innerHTML = html;
						var select_policy_edit = document.getElementById('select_policy_edit');
						generate_cs(select_policy_edit);
						getElById('tr_edit'+ index).style.display = "";
						fill_edit_value(index);
						MultiselectDropdown(null, "#Schedule0_days_edit", getValue('Schedule0_days_editval'));
						MultiselectDropdown(null, "#Schedule1_days_edit", getValue('Schedule1_days_editval'));
						MultiselectDropdown(null, "#Schedule2_days_edit", getValue('Schedule2_days_editval'));
						MultiselectDropdown(null, "#Schedule3_days_edit", getValue('Schedule3_days_editval'));
						MultiselectDropdown(null, "#Schedule4_days_edit", getValue('Schedule4_days_editval'));
				}
				else
				{
					alert('<%tcWebApi_get("String_Entry","PFJS13Text","s")%>'); // Rember: Replace
				}
			}
			else
			{
				alert('<%tcWebApi_get("String_Entry","PFJS12Text","s")%>'); // Rember: Replace
			}
		}
		function LoadFrame()
		{
			showParentalControl(1);
			ShowPrtctrlMapping();
		}
		/*Check form*/
		/*Validate day*/
		const day_mapping = {
			1: 'Mon',
			2: 'Tue',
			3: 'Wed',
			4: 'Thu',
			5: 'Fri',
			6: 'Sat',
			0: 'Sun'
		};
		/*Validate time*/
		function validate_time(time) {
			var arr_time;
			var hour, min;
			if (time.length == 0) {
				alert("<%tcWebApi_get("String_Entry","ParentalJS5Text","s")%>");
				return -1;
			}
			arr_time = time.split(":",3);
			if (isNaN(arr_time[0]) || isNaN(arr_time[1])) {
				alert("<%tcWebApi_get("String_Entry","ParentalJS6Text","s")%>");
				return -1;
			}
			if (arr_time.length > 2){
				alert("<%tcWebApi_get("String_Entry","ParentalJS6Text","s")%>");
				return -1;
			}
			hour = parseInt(arr_time[0]);
			min = parseInt(arr_time[1]);
			if (isNaN(hour) || isNaN(min)) {
				alert("<%tcWebApi_get("String_Entry","ParentalJS6Text","s")%>");
				return -1;
			}
			if ((hour < 0 ) || (hour > 23) || (min > 59) || (min < 0)) {
				alert("<%tcWebApi_get("String_Entry","ParentalJS6Text","s")%>");
				return -1;
			}
		}
		function timetoSecs(time){
			let [h, m] = time.split(':');
  			return h*3600 + (m|0)*60;
		}
		function secsToTime(seconds) {
			let z = n => (n<10? '0' : '') + n; 
			return (seconds / 3600 | 0) + ':' +
				z((seconds % 3600) / 60 | 0);
		}
		function get_time_duration(start, end, idx, postfix){
			var arr_time_start, arr_time_end;
			var start_hour, start_min;
			var stop_hour, stop_min;
			arr_time_start = start.split(":",2);
			start_hour = parseInt(arr_time_start[0]);
			start_min = parseInt(arr_time_start[1]);
			arr_time_end = end.split(":",2);
			stop_hour = parseInt(arr_time_end[0]);
			stop_min = parseInt(arr_time_end[1]);
			if (start_hour > stop_hour){
				alert("<%tcWebApi_get("String_Entry","ParentalJS18Text","s")%>");
				return false;
			}
			else if (start_hour == stop_hour){
				if (start_min >= stop_min){
					alert("<%tcWebApi_get("String_Entry","ParentalJS18Text","s")%>");
					return false;
				}
			}
			var time_duration = (stop_hour*60 + stop_min - 60*start_hour - start_min)*60;
			getElById("Schedule" + idx + "_Duration" + postfix).value = time_duration;
			return true;
		}
		function validate_timeRepeat(time, start, end){
			if (time >= start && time <= end){
				return false;
			}
			return true;
		}
		function haveCommonRepeat(repeat1, repeat2){
				if (repeat2 == repeat1){
					return true;
				}
			return false;
		}
		/*Validate MAC*/
		function doHexCheck(c) {
			if ( (c >= "0") && (c <= "9") )
				return 1;
			else if ( (c >= "A") && (c <= "F") )
				return 1;
			else if ( (c >= "a") && (c <= "f") )
				return 1;
			return -1;
		}
		function doMACcheck(szAddr) {
			var szAddr = szAddr.trim()
			var len = szAddr.length;
			if (len != 17) {
				alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
				return false;
			} else if ( len == 17 ) {
				var i = 2;
				var c0 = szAddr.charAt(0);
				var c1 = szAddr.charAt(1);
				if ((doHexCheck(c0) < 0)||(doHexCheck(c1) < 0)) {
					alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
					return false;
				}
				i = 2;
				while (i<len) {
					var c0 = szAddr.charAt(i);
					var c1 = szAddr.charAt(i+1);
					var c2 = szAddr.charAt(i+2);
					if (((c0 != ":")&&(c0 != "-"))||(doHexCheck(c1)<0)||(doHexCheck(c2)<0)) {
						alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
						obj.focus();
						return false;
					}
					i = i + 3;
				}               
				/* Check if a MAC has ":"*/
				if(szAddr.charAt(2) ==":"){
					if((szAddr.charAt(5) !=":")||(szAddr.charAt(8) !=":")||(szAddr.charAt(11) !=":")||(szAddr.charAt(14) !=":")){
						alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");                   
						return false;
					}
				}
				else {
					alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
					return false;
				}   
				return true;
			}
		}
		/*Validate URL*/
		function unValidURL(Address) {
			if (Address.length < 10) {
				return true;
			}
			var urlRx = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/;
			if (urlRx.test(Address)) {
				return false;
			}
			else {
				return true;
			}
		}         
		function ValidateURL(str) {
			const ipRegex = /((^\s*((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))\s*$)|(^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$))/;
			const domainRegex = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}(\/[^\\s]*)?$/;
			if (ipRegex.test(str.trim())) {
				return true;
			} else if (domainRegex.test(str.trim())) {
				return true;
			} else {
				return false;
			}
		}          
		function CheckForm(iMode, addrule, index){
			var postfix;
			var day_postfix;
			var need_url = 1;
			if(addrule == 1){
				postfix = ""
				index = idle_rule_idx;
				day_postfix = "_addval";
				if ($("#prtctl_policy").val() == "Deny") need_url = 0;
				if (addrule_schedulenum == 0 && need_url){
					alert("<%tcWebApi_get("String_Entry","FilterJS6Text","s")%>");
					return false;
				}
			}
			else {
				postfix = "_edit";
				day_postfix = "_editval";
				if ($("#prtctl_policy_edit").val() == "Deny") need_url = 0;
				if (editrule_schedulenum == 0 && need_url){
					alert("<%tcWebApi_get("String_Entry","FilterJS6Text","s")%>");
					return false;
				}
			}
			var real_mac;
			var mac_list = $('#prtctrlrule_mac'+ postfix).val().trim().split(',');
			for (var i = 0; i < mac_list.length; i++){
				if(!doMACcheck(mac_list[i])){
					$('#prtctrlrule_mac'+ postfix).focus();
					return false;
				}
				for (var j = 0; j < vEntryMac.length; j++){
					if (j == index)
						continue;
					if (vEntryMac[j].includes(mac_list[i])){
						$('#prtctrlrule_mac'+ postfix).focus();
						alert("<%tcWebApi_get("String_Entry","ParentalJS14Text","s")%>");
						return false;
					}
				}
			}
			real_mac = $('#prtctrlrule_mac'+ postfix).val().replace(/(\r\n|\n|\r|\s+)/gm, "");
			$('#prtctrlrule_mac'+ postfix).val(real_mac.toLowerCase());
			/*valid url*/
			if (need_url){
				var url_list = $('#prtctrlrule_url'+ postfix).val().trim().split(',');
				var all_url = 0;
				for (var i = 0; i < url_list.length; i++){
					var str;
					url_list[i] = url_list[i].trim();
					if ((url_list[i].length == 0 && url_list.length == 1) || (url_list[i] == "None")){
						all_url = 1;
						break;
					}
					if (url_list[i].length == 0){
						alert("<%tcWebApi_get("String_Entry","ParentalJS3Text","s")%>");
						return false;
					}
					str = url_list[i].toLowerCase();
					if (!ValidateURL(str)) {
						alert("<%tcWebApi_get("String_Entry","ParentalJS3Text","s")%>");
						$('#prtctrlrule_url'+ postfix).focus();
						return false;
					}
				}
				var real_url;
				if(all_url == 1) real_url = "None";
				else {
					real_url = $('#prtctrlrule_url'+ postfix).val().replace(/(\r\n|\n|\r|\s+)/gm, "");
				}
				$('#prtctrlrule_url'+ postfix).val(real_url);
			}
			var scheduletime_list = {};
			var scheduletime_idx;
			for ( var i = 0; i < MAX_SCHEDULE; i++)
			{
				if (hasSchedule[index * MAX_SCHEDULE + i] != 0)
				{
					if (validate_time($('#Schedule'+ i + '_Starttime' + postfix).val()) == -1) {
						$('#Schedule'+ i + 'Starttime_edit').focus();
						return false;
					}
					if (validate_time($('#Schedule'+ i + '_Endtime' + postfix).val()) == -1) {
						$('#Schedule'+ i + 'Endtime_edit').focus();
						return false;
					}
					$('#Schedule'+ i + '_Starttime' + postfix).val($('#Schedule'+ i + '_Starttime' + postfix).val().replace(/(\r\n|\n|\r)/gm, ""));
					$('#Schedule'+ i + '_Endtime' + postfix).val($('#Schedule'+ i + '_Endtime' + postfix).val().replace(/(\r\n|\n|\r)/gm, ""));
					if (get_time_duration($('#Schedule'+ i + '_Starttime' + postfix).val(), $('#Schedule'+ i + '_Endtime' + postfix).val(), i, postfix) == false) {
						$('#Schedule'+ i + 'Starttime_edit').focus();
						$('#Schedule'+ i + 'Endtime_edit').focus();
						return false;
					}
					scheduletime_idx = 'sd' + i;	
					scheduletime_list[scheduletime_idx] = {
						'start': $('#Schedule'+ i + '_Starttime' + postfix).val(),
						'end': $('#Schedule'+ i + '_Endtime' + postfix).val(),
						'repeat': $('#Schedule' + i + '_days'+ day_postfix).val()
					}
				}
			}
			for ( var i = 0; i < MAX_SCHEDULE; i++)
			{
				if (hasSchedule[index * MAX_SCHEDULE + i] != 0){
					for (var scheduletime_entry in scheduletime_list){
						var currentScheduleTime = 'sd' + i;
						if (currentScheduleTime == scheduletime_entry)
							continue;
						var repeat = $('#Schedule' + i + '_days'+ day_postfix).val();
						var StartTime = $('#Schedule'+ i + '_Starttime' + postfix).val();
						var EndTime =  $('#Schedule'+ i + '_Endtime' + postfix).val();
						if (!validate_timeRepeat(StartTime, scheduletime_list[scheduletime_entry]['start'], scheduletime_list[scheduletime_entry]['end']) && haveCommonRepeat(repeat, scheduletime_list[scheduletime_entry]['repeat'])){
							alert("<%tcWebApi_get("String_Entry", "ParentalJS15Text", "s")%>");
							return false;
						}
						if (!validate_timeRepeat(EndTime, scheduletime_list[scheduletime_entry]['start'], scheduletime_list[scheduletime_entry]['end']) && haveCommonRepeat(repeat, scheduletime_list[scheduletime_entry]['repeat'])){
							alert("<%tcWebApi_get("String_Entry", "ParentalJS15Text", "s")%>");
							return false;
						}
					}
				}
			}
			return true;
		}
		/*End checkform*/
		function setSchedule(index, is_add){
			for (var i = 0; i < MAX_SCHEDULE; i++){
				var schedulename = "hSchedule" + i;
				if (hasSchedule[index * MAX_SCHEDULE + i] != 0)
					setText(schedulename,"Yes");
				else 
				setText(schedulename,"N/A");
			}
		}
		function convert_days(index, addflag){
			var postfix;
			if(addflag == 1){
				postfix = ""
			}
			else {
				postfix = "_edit"
			}
			var day_convert = '';
			var days;
			for (var i = 0; i < MAX_SCHEDULE; i++)
			{
				day_convert = '';
				days = $("#Schedule" + i + "_days" + postfix).val();
				if (addflag == 1) $('#Schedule' + i + '_days_addval').val(days);
				else $('#Schedule' + i + '_days_editval').val(days);
				if((days == "") && (hasSchedule[index*MAX_SCHEDULE + i] == 1)){
					alert("Day cannot be empty!");
					return false;
				}
			}
			return true;
		}
		function doApply(iMode, addflag, index){ /*Edit addflag = 0*/
				if(1 == addflag)
				{
					/* Add mode */
					gLockAddEdit = false;
					document.ParentalControlForm.ParentalCtrlRuleCurIdx.value = idle_rule_idx;
					document.ParentalControlForm.PrtCtrl_Flag.value = "1";
					addNewRule(idle_rule_idx, 1, 1);
					document.ParentalControlForm.ParentalCtrlRuleCurScheduleNum.value = addrule_schedulenum;
					setSchedule(idle_rule_idx, 1);
					if(!convert_days(idle_rule_idx, 1)) return;
					//submitAsync("ParentalControlForm");
				}
				else
				{
					/* Edit Mode */
					LockEdit = false;
					gLockAddEdit = false;
					addNewRule(index, 0, 1);
					document.ParentalControlForm.ParentalCtrlRuleCurScheduleNum.value = editrule_schedulenum;
					document.ParentalControlForm.ParentalCtrlRuleCurIdx.value = index;
					setSchedule(index, 0);
					if(!convert_days(index, 0)) return;
					document.ParentalControlForm.PrtCtrl_Flag.value = "6";
					//submitAsync("ParentalControlForm");
				}
				if(CheckForm(iMode, addflag, index) == false)
						return;
				submitAsync("ParentalControlForm");
		}
		function doButton(iMode, addflag){
			if(iMode == 1)/*add*/
			{
				if (ParentalCtrlRuleIdx >= 10) {
					alert ("<%tcWebApi_get("String_Entry","ParentalControlRuleAlertText","s")%>");
					return;
				}
				if (do_edit == 1){
					alert("<%tcWebApi_get("String_Entry","ParentalControlCannotAddText","s")%>");
					return;
				}
				do_add ++ ;
				if (do_add > 1){
					alert("<%tcWebApi_get("String_Entry","ParentalControlCannotAddText","s")%>");
					do_add --;
					return;
				}
				ShowConfigInfo(LockAdd);
				selectElement("prtctl_policy", "Allow");
				//selectElement("prtctrlrule_name", "Rule " + (idle_rule_idx + 1).toString());
				selectElement("prtctrlrule_idx", (idle_rule_idx + 1).toString());
				doToggle(1);
				document.ParentalControlForm.PrtCtrl_Flag.value = "7"; /* add behavior - do nothing with backend*/
			}
			else if(iMode == 2)/*del*/
			{
				//if(CheckForm(iMode, 0) == false)
					//return;
				RemoveParentalCtrlRule(ParentalControlForm,'rml');
				document.ParentalControlForm.ParentalCtrlRuleCurIdx.value = ParentalCtrlRuleIdx;
				document.ParentalControlForm.PrtCtrl_Flag.value = "2"; 
				submitAsync("ParentalControlForm");        
			}
		}
		function showParentalControl(load){
			$('#enable_parentalctrl_div').show();
			if (load == 0){
				document.ParentalControlForm.PrtCtrl_Flag.value = "3";
				submitAsync("ParentalControlForm");   
			}
		}
		</script>
		<style>
			.custom_cb_table {
				padding-left:3rem;
			}
			.multiselect-dropdown{
				display: inline-block;
				padding: 2px 5px 0px 5px;
				border-width: 2px;
				border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
				border-style: inset;
				background-color: field;
				position: relative;
				text-align: center;
				background-repeat: no-repeat;
				background-position: right .75rem center;
				background-size: 16px 12px;
			  }
			  .multiselect-dropdown span.optext, .multiselect-dropdown span.placeholder{
				margin-right:0.5em; 
				margin-bottom:2px;
				padding:1px 0; 
				border-radius: 4px; 
				display:inline-block;
			  }
			  .multiselect-dropdown span.optext{
				background-color:lightgray;
				padding:1px 0.75em; 
			  }
			  .multiselect-dropdown span.optext .optdel {
				float: right;
				margin: 0 -6px 1px 5px;
				font-size: 0.7em;
				margin-top: 2px;
				cursor: pointer;
				color: #666;
			  }
			  .multiselect-dropdown span.optext .optdel:hover { color: #c66;}
			  .multiselect-dropdown span.placeholder{
				color:#ced4da;
			  }
			  .multiselect-dropdown-list-wrapper{
				box-shadow: gray 0 3px 8px;
				z-index: 100;
				padding:2px;
				border-radius: 4px;
				border: solid 1px #ced4da;
				display: none;
				margin: -1px;
				position: absolute;
				top:0;
				left: 0;
				right: 0;
				background: white;
			  }
			  .multiselect-dropdown-list-wrapper .multiselect-dropdown-search{
				margin-bottom:5px;
			  }
			  .multiselect-dropdown-list{
				padding:2px;
				height: 15rem;
				overflow-y:auto;
				overflow-x: hidden;
			  }
			  .multiselect-dropdown-list::-webkit-scrollbar {
				width: 6px;
			  }
			  .multiselect-dropdown-list::-webkit-scrollbar-thumb {
				background-color: #bec4ca;
				border-radius:3px;
			  }
			  .multiselect-dropdown-list div{
				padding: 5px;
			  }
			  .multiselect-dropdown-list input{
				height: 1.15em;
				width: 1.15em;
				margin-right: 0.35em;  
			  }
			  .multiselect-dropdown-list div.checked{
			  }
			  .multiselect-dropdown-list div:hover{
				background-color: #ced4da;
			  }
			  .multiselect-dropdown span.maxselected {width:100%;}
			  .multiselect-dropdown-all-selector {border-bottom:solid 1px #999;}
		</style>
	</head>
	<body onload="LoadFrame();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level show" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/fw-parentalcontrol.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>        <div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/fw-parentalcontrol.asp" name="ParentalControlForm" id="ParentalControlForm" >
		<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
		<input type="hidden" id="PrtCtrl_Flag" name="PrtCtrl_Flag" value="0">
		<input type="hidden" id="EnablePrtCtrl_Flag" name="EnablePrtCtrl_Flag" value="Yes">
		<input type="hidden" id="ParentalCtrlRuleCurIdx" name="ParentalCtrlRuleCurIdx" value="0">
		<input type="hidden" id="ParentalCtrlRuleCurScheduleNum" name="ParentalCtrlRuleCurScheduleNum" value="0">
		<input type="hidden" id="ParentalCtrlRuleScheduleIdx" name="ParentalCtrlRuleScheduleIdx" value="0">
		<input type="hidden" id="ParentalCtrlEntry0" name="ParentalCtrlEntry0" value="99">
		<input type="hidden" id="ParentalCtrlEntry1" name="ParentalCtrlEntry1" value="99">
		<input type="hidden" id="ParentalCtrlEntry2" name="ParentalCtrlEntry2" value="99">
		<input type="hidden" id="ParentalCtrlEntry3" name="ParentalCtrlEntry3" value="99">
		<input type="hidden" id="ParentalCtrlEntry4" name="ParentalCtrlEntry4" value="99">
		<input type="hidden" id="ParentalCtrlEntry5" name="ParentalCtrlEntry5" value="99">
		<input type="hidden" id="ParentalCtrlEntry6" name="ParentalCtrlEntry6" value="99">
		<input type="hidden" id="ParentalCtrlEntry7" name="ParentalCtrlEntry7" value="99">
		<input type="hidden" id="ParentalCtrlEntry8" name="ParentalCtrlEntry8" value="99">
		<input type="hidden" id="ParentalCtrlEntry9" name="ParentalCtrlEntry9" value="99">
		<input type="hidden" id="ParentalCtrlEntry10" name="ParentalCtrlEntry10" value="99">
		<input type="hidden" id="EnableEntry0" name="EnableEntry0" value="N/A">
		<input type="hidden" id="EnableEntry1" name="EnableEntry1" value="N/A">
		<input type="hidden" id="EnableEntry2" name="EnableEntry2" value="N/A">
		<input type="hidden" id="EnableEntry3" name="EnableEntry3" value="N/A">
		<input type="hidden" id="EnableEntry4" name="EnableEntry4" value="N/A">
		<input type="hidden" id="EnableEntry5" name="EnableEntry5" value="N/A">
		<input type="hidden" id="EnableEntry6" name="EnableEntry6" value="N/A">
		<input type="hidden" id="EnableEntry7" name="EnableEntry7" value="N/A">
		<input type="hidden" id="EnableEntry8" name="EnableEntry8" value="N/A">
		<input type="hidden" id="EnableEntry9" name="EnableEntry9" value="N/A">
		<input type="hidden" id="EnableEntry10" name="EnableEntry10" value="N/A">
		<input type="hidden" id="EnableEntry_edit" name="EnableEntry" value="N/A">
		<input type="hidden" id="EnableEntry_edit" name="EnableEntry_edit" value="N/A">
		<input type="hidden" id="hEnableSchedule0" name="hEnableSchedule0" value="No">
		<input type="hidden" id="hEnableSchedule1" name="hEnableSchedule1" value="No">
		<input type="hidden" id="hEnableSchedule2" name="hEnableSchedule2" value="No">
		<input type="hidden" id="hEnableSchedule3" name="hEnableSchedule3" value="No">
		<input type="hidden" id="hSchedule0" name="hSchedule0" value="N/A">
		<input type="hidden" id="hSchedule0" name="hSchedule1" value="N/A">
		<input type="hidden" id="hSchedule0" name="hSchedule2" value="N/A">
		<input type="hidden" id="hSchedule0" name="hSchedule3" value="N/A">
	<div class="row row-w-100">
		<div class="widget col-xs-12 col-lg-12">
			<header><%tcWebApi_get("String_Entry","ParentalControlText","s")%></header>
			<div id="note">
				<script>
				function toggle_help_text() {
					if ($(".info-popup").css("display") == "none") {
						$(".info-popup").show();
					}
					else {
					$(".info-popup").hide();
					}
				}
				</script>
				<div id="top-info" class="top-info" >
					<a href="#" onclick="toggle_help_text()"><i class="fa fa-question-circle"></i></a>
					<div class="info-popup" style="display:none">
						<div class="arraw">
							<iframe src ="<% if tcwebApi_get("LanguageSwitch_Entry", "Type", "h") = "1" then %>/help/help_prtcontrol_vn.html<% else %>/help/help_prtcontrol_en.html<%end if %>" class="help-frame"></iframe>
							<a id="see-mor-instruction" href="#" onclick="toggle_help_text();"><%tcWebApi_get("String_Entry","DDNSHide","s")%></a>
						</div>
					</div>
				</div>
			</div>
			<div class="widget-body"> 
				<!-- <div class="form-group">
					<label class="col-sm-5"><%tcWebApi_get("String_Entry","EnableText","s")%></label>
					<label class="toggle-switch">
						<input type="checkbox" name="enableptrlCtrl" id="enableptrlCtrl" onclick="showParentalControl(0)" <%if tcWebApi_get("ParentalCtrl2_Common","Enable","h") = "Yes" then asp_Write("checked") end if%>>
						<span class="slider"></span>
					</label>
				</div> -->
				<div id="enable_parentalctrl_div">
					<!-- Info show whenever add new parental rules-->
					<br>
					<div class="table-responsive-lg" id="parentalControlInfo"></div>
					<br>
					<div id="ConfigInfo"></div> 
					<div class="d-flex justify-content-end">
						<button type="button" class="page-button small-button" onclick="doButton(1, 0);" name="ButtonAdd" id= "ButtonAdd"><%tcWebApi_get("String_Entry","PFButtonAddText","s")%></button>
						<button type="button" class="page-button small-button" onclick="doButton(2, 0);" name="ButtonDel" id= "ButtonDel"><%tcWebApi_get("String_Entry","PFButtonDeleteText","s")%></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
		</div>
		<footer>
			<% if tcWebApi_get("String_Entry","BranchName","h") <> "Mytel" then %>	
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","SaleConsutantContact","h")%>"><%tcWebApi_get("String_Entry","SaleConsutantContact","s")%></a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a></p>
			<% else %>
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","SaleConsutantContact","h")%>"><%tcWebApi_get("String_Entry","SaleConsutantContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect5Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","SaleConsutantContact2","h")%>"><%tcWebApi_get("String_Entry","SaleConsutantContact2","s")%></a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect5Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact2","h")%>"><%tcWebApi_get("String_Entry","ReportProblemsContact2","s")%></a></p>
			<% end if %>
			<p>&copy; 2021 by VHT. All rights reserved.</p>
		</footer>
		<script language='javascript' src='/JS/user.js'></script>		</body>
</html>
