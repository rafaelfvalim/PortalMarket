!function(e){e.jgrid=e.jgrid||{},e.extend(e.jgrid,{defaults:{recordtext:"\u041f\u0440\u0435\u0433\u043b\u0435\u0434 {0} - {1} \u043e\u0434 {2}",emptyrecords:"\u041d\u0435 \u043f\u043e\u0441\u0442\u043e\u0458\u0438 \u043d\u0438\u0458\u0435\u0434\u0430\u043d \u0437\u0430\u043f\u0438\u0441",loadtext:"\u0423\u0447\u0438\u0442\u0430\u0432\u0430\u045a\u0435...",pgtext:"\u0421\u0442\u0440\u0430\u043d\u0430 {0} \u043e\u0434 {1}"},search:{caption:"\u0422\u0440\u0430\u0436\u0435\u045a\u0435...",Find:"\u0422\u0440\u0430\u0436\u0438",Reset:"\u0420\u0435\u0441\u0435\u0442\u0443\u0458",odata:[{oper:"eq",text:"\u0458\u0435\u0434\u043d\u0430\u043a\u043e"},{oper:"ne",text:"\u043d\u0438\u0458\u0435 \u0458\u0435\u0434\u043d\u0430\u043a\u043e"},{oper:"lt",text:"\u043c\u0430\u045a\u0435"},{oper:"le",text:"\u043c\u0430\u045a\u0435 \u0438\u043b\u0438 \u0458\u0435\u0434\u043d\u0430\u043a\u043e"},{oper:"gt",text:"\u0432\u0435\u045b\u0435"},{oper:"ge",text:"\u0432\u0435\u045b\u0435 \u0438\u043b\u0438 \u0458\u0435\u0434\u043d\u0430\u043a\u043e"},{oper:"bw",text:"\u043f\u043e\u0447\u0438\u045a\u0435 \u0441\u0430"},{oper:"bn",text:"\u043d\u0435 \u043f\u043e\u0447\u0438\u045a\u0435 \u0441\u0430"},{oper:"in",text:"\u0458\u0435 \u0443"},{oper:"ni",text:"\u043d\u0438\u0458\u0435 \u0443"},{oper:"ew",text:"\u0437\u0430\u0432\u0440\u0448\u0430\u0432\u0430 \u0441\u0430"},{oper:"en",text:"\u043d\u0435 \u0437\u0430\u0432\u0440\u0448\u0430\u0432\u0430 \u0441\u0430"},{oper:"cn",text:"\u0441\u0430\u0434\u0440\u0436\u0438"},{oper:"nc",text:"\u043d\u0435 \u0441\u0430\u0434\u0440\u0436\u0438"},{oper:"nu",text:"is null"},{oper:"nn",text:"is not null"}],groupOps:[{op:"\u0418",text:"\u0441\u0432\u0438"},{op:"\u0418\u041b\u0418",text:"\u0441\u0432\u0430\u043a\u0438"}],operandTitle:"Click to select search operation.",resetTitle:"Reset Search Value"},edit:{addCaption:"\u0414\u043e\u0434\u0430\u0458 \u0437\u0430\u043f\u0438\u0441",editCaption:"\u0418\u0437\u043c\u0435\u043d\u0438 \u0437\u0430\u043f\u0438\u0441",bSubmit:"\u041f\u043e\u0448\u0430\u0459\u0438",bCancel:"\u041e\u0434\u0443\u0441\u0442\u0430\u043d\u0438",bClose:"\u0417\u0430\u0442\u0432\u043e\u0440\u0438",saveData:"\u041f\u043e\u0434\u0430\u0442\u0430\u043a \u0458\u0435 \u0438\u0437\u043c\u0435\u045a\u0435\u043d! \u0421\u0430\u0447\u0443\u0432\u0430\u0458 \u0438\u0437\u043c\u0435\u043d\u0435?",bYes:"\u0414\u0430",bNo:"\u041d\u0435",bExit:"\u041e\u0434\u0443\u0441\u0442\u0430\u043d\u0438",msg:{required:"\u041f\u043e\u0459\u0435 \u0458\u0435 \u043e\u0431\u0430\u0432\u0435\u0437\u043d\u043e",number:"\u041c\u043e\u043b\u0438\u043c, \u0443\u043d\u0435\u0441\u0438\u0442\u0435 \u0438\u0441\u043f\u0440\u0430\u0432\u0430\u043d \u0431\u0440\u043e\u0458",minValue:"\u0432\u0440\u0435\u0434\u043d\u043e\u0441\u0442 \u043c\u043e\u0440\u0430 \u0431\u0438\u0442\u0438 \u0432\u0435\u045b\u0430 \u043e\u0434 \u0438\u043b\u0438 \u0458\u0435\u0434\u043d\u0430\u043a\u0430 \u0441\u0430 ",maxValue:"\u0432\u0440\u0435\u0434\u043d\u043e\u0441\u0442 \u043c\u043e\u0440\u0430 \u0431\u0438\u0442\u0438 \u043c\u0430\u045a\u0430 \u043e\u0434 \u0438\u043b\u0438 \u0458\u0435\u0434\u043d\u0430\u043a\u0430 \u0441\u0430",email:"\u043d\u0438\u0458\u0435 \u0438\u0441\u043f\u0440\u0430\u0432\u043d\u0430 \u0438\u043c\u0435\u0458\u043b \u0430\u0434\u0440\u0435\u0441\u0430",integer:"\u041c\u043e\u043b\u0438\u043c, \u0443\u043d\u0435\u0441\u0438\u0442\u0435 \u0438\u0441\u043f\u0440\u0430\u0432\u043d\u0443 \u0446\u0435\u043b\u043e\u0431\u0440\u043e\u0458\u043d\u0443 \u0432\u0440\u0435\u0434\u043d\u043e\u0441\u0442 ",date:"\u041c\u043e\u043b\u0438\u043c, \u0443\u043d\u0435\u0441\u0438\u0442\u0435 \u0438\u0441\u043f\u0440\u0430\u0432\u0430\u043d \u0434\u0430\u0442\u0443\u043c",url:"\u043d\u0438\u0458\u0435 \u0438\u0441\u043f\u0440\u0430\u0432\u0430\u043d \u0423\u0420\u041b. \u041f\u043e\u0442\u0440\u0435\u0431\u0430\u043d \u0458\u0435 \u043f\u0440\u0435\u0444\u0438\u043a\u0441 ('http://' or 'https://')",nodefined:" \u043d\u0438\u0458\u0435 \u0434\u0435\u0444\u0438\u043d\u0438\u0441\u0430\u043d!",novalue:" \u0437\u0430\u0445\u0442\u0435\u0432\u0430\u043d\u0430 \u0458\u0435 \u043f\u043e\u0432\u0440\u0430\u0442\u043d\u0430 \u0432\u0440\u0435\u0434\u043d\u043e\u0441\u0442!",customarray:"Custom function should return array!",customfcheck:"Custom function should be present in case of custom checking!"}},view:{caption:"\u041f\u043e\u0433\u043b\u0435\u0434\u0430\u0458 \u0437\u0430\u043f\u0438\u0441",bClose:"\u0417\u0430\u0442\u0432\u043e\u0440\u0438"},del:{caption:"\u0418\u0437\u0431\u0440\u0438\u0448\u0438",msg:"\u0418\u0437\u0431\u0440\u0438\u0448\u0438 \u0438\u0437\u0430\u0431\u0440\u0430\u043d(\u0435) \u0437\u0430\u043f\u0438\u0441(\u0435)?",bSubmit:"\u0418\u0431\u0440\u0438\u0448\u0438",bCancel:"\u041e\u0434\u0431\u0430\u0446\u0438"},nav:{edittext:"",edittitle:"\u0418\u0437\u043c\u0435\u043d\u0438 \u0438\u0437\u0430\u0431\u0440\u0430\u043d\u0438 \u0440\u0435\u0434",addtext:"",addtitle:"\u0414\u043e\u0434\u0430\u0458 \u043d\u043e\u0432\u0438 \u0440\u0435\u0434",deltext:"",deltitle:"\u0418\u0437\u0431\u0440\u0438\u0448\u0438 \u0438\u0437\u0430\u0431\u0440\u0430\u043d \u0440\u0435\u0434",searchtext:"",searchtitle:"\u041d\u0430\u0452\u0438 \u0437\u0430\u043f\u0438\u0441\u0435",refreshtext:"",refreshtitle:"\u041f\u043e\u043d\u043e\u0432\u043e \u0443\u0447\u0438\u0442\u0430\u0458 \u043f\u043e\u0434\u0430\u0442\u043a\u0435",alertcap:"\u0423\u043f\u043e\u0437\u043e\u0440\u0435\u045a\u0435",alerttext:"\u041c\u043e\u043b\u0438\u043c, \u0438\u0437\u0430\u0431\u0435\u0440\u0438\u0442\u0435 \u0440\u0435\u0434",viewtext:"",viewtitle:"\u041f\u043e\u0433\u043b\u0435\u0434\u0430\u0458 \u0438\u0437\u0430\u0431\u0440\u0430\u043d\u0438 \u0440\u0435\u0434"},col:{caption:"\u0418\u0437\u0430\u0431\u0435\u0440\u0438 \u043a\u043e\u043b\u043e\u043d\u0435",bSubmit:"\u041e\u041a",bCancel:"\u041e\u0434\u0431\u0430\u0446\u0438"},errors:{errcap:"\u0413\u0440\u0435\u0448\u043a\u0430",nourl:"\u041d\u0438\u0458\u0435 \u043f\u043e\u0441\u0442\u0430\u0432\u0459\u0435\u043d URL",norecords:"\u041d\u0435\u043c\u0430 \u0437\u0430\u043f\u0438\u0441\u0430 \u0437\u0430 \u043e\u0431\u0440\u0430\u0434\u0443",model:"\u0414\u0443\u0436\u0438\u043d\u0430 \u043c\u043e\u0434\u0435\u043b\u0430 colNames <> colModel!"},formatter:{integer:{thousandsSeparator:" ",defaultValue:"0"},number:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,defaultValue:"0.00"},currency:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,prefix:"",suffix:"",defaultValue:"0.00"},date:{dayNames:["\u041d\u0435\u0434","\u041f\u043e\u043d","\u0423\u0442\u043e","\u0421\u0440\u0435","\u0427\u0435\u0442","\u041f\u0435\u0442","\u0421\u0443\u0431","\u041d\u0435\u0434\u0435\u0459\u0430","\u041f\u043e\u043d\u0435\u0434\u0435\u0459\u0430\u043a","\u0423\u0442\u043e\u0440\u0430\u043a","\u0421\u0440\u0435\u0434\u0430","\u0427\u0435\u0442\u0432\u0440\u0442\u0430\u043a","\u041f\u0435\u0442\u0430\u043a","\u0421\u0443\u0431\u043e\u0442\u0430"],monthNames:["\u0408\u0430\u043d","\u0424\u0435\u0431","\u041c\u0430\u0440","\u0410\u043f\u0440","\u041c\u0430\u0458","\u0408\u0443\u043d","\u0408\u0443\u043b","\u0410\u0432\u0433","\u0421\u0435\u043f","\u041e\u043a\u0442","\u041d\u043e\u0432","\u0414\u0435\u0446","\u0408\u0430\u043d\u0443\u0430\u0440","\u0424\u0435\u0431\u0440\u0443\u0430\u0440","\u041c\u0430\u0440\u0442","\u0410\u043f\u0440\u0438\u043b","\u041c\u0430\u0458","\u0408\u0443\u043d","\u0408\u0443\u043b","\u0410\u0432\u0433\u0443\u0441\u0442","\u0421\u0435\u043f\u0442\u0435\u043c\u0431\u0430\u0440","\u041e\u043a\u0442\u043e\u0431\u0430\u0440","\u041d\u043e\u0432\u0435\u043c\u0431\u0430\u0440","\u0414\u0435\u0446\u0435\u043c\u0431\u0430\u0440"],AmPm:["am","pm","AM","PM"],S:function(e){return 11>e||e>13?["st","nd","rd","th"][Math.min((e-1)%10,3)]:"th"},srcformat:"Y-m-d",newformat:"d/m/Y",parseRe:/[#%\\\/:_;.,\t\s-]/,masks:{ISO8601Long:"Y-m-d H:i:s",ISO8601Short:"Y-m-d",ShortDate:"n/j/Y",LongDate:"l, F d, Y",FullDateTime:"l, F d, Y g:i:s A",MonthDay:"F d",ShortTime:"g:i A",LongTime:"g:i:s A",SortableDateTime:"Y-m-d\\TH:i:s",UniversalSortableDateTime:"Y-m-d H:i:sO",YearMonth:"F, Y"},reformatAfterEdit:!1},baseLinkUrl:"",showAction:"",target:"",checkbox:{disabled:!0},idName:"id"}})}(jQuery);