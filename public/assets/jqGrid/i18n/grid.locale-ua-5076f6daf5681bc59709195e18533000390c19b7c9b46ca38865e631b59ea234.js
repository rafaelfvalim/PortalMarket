!function(e){e.jgrid=e.jgrid||{},e.extend(e.jgrid,{defaults:{recordtext:"\u041f\u0435\u0440\u0435\u0433\u043b\u044f\u0434 {0} - {1} \u0437 {2}",emptyrecords:"\u041d\u0435\u043c\u0430\u0454 \u0437\u0430\u043f\u0438\u0441\u0456\u0432 \u0434\u043b\u044f \u043f\u0435\u0440\u0435\u0433\u043b\u044f\u0434\u0443",loadtext:"\u0417\u0430\u0432\u0430\u043d\u0442\u0430\u0436\u0435\u043d\u043d\u044f...",pgtext:"\u0421\u0442\u043e\u0440. {0} \u0437 {1}"},search:{caption:"\u041f\u043e\u0448\u0443\u043a...",Find:"\u0417\u043d\u0430\u0439\u0442\u0438",Reset:"\u0421\u043a\u0438\u0434\u0430\u043d\u043d\u044f",odata:[{oper:"eq",text:"\u0440\u0456\u0432\u043d\u043e"},{oper:"ne",text:"\u043d\u0435 \u0440\u0456\u0432\u043d\u043e"},{oper:"lt",text:"\u043c\u0435\u043d\u0448\u0435"},{oper:"le",text:"\u043c\u0435\u043d\u0448\u0435 \u0430\u0431\u043e \u0440\u0456\u0432\u043d\u0435"},{oper:"gt",text:"\u0431\u0456\u043b\u044c\u0448\u0435"},{oper:"ge",text:"\u0431\u0456\u043b\u044c\u0448\u0435 \u0430\u0431\u043e \u0440\u0456\u0432\u043d\u0435"},{oper:"bw",text:"\u043f\u043e\u0447\u0438\u043d\u0430\u0454\u0442\u044c\u0441\u044f \u0437"},{oper:"bn",text:"\u043d\u0435 \u043f\u043e\u0447\u0438\u043d\u0430\u0454\u0442\u044c\u0441\u044f \u0437"},{oper:"in",text:"\u0437\u043d\u0430\u0445\u043e\u0434\u0438\u0442\u044c\u0441\u044f \u0432"},{oper:"ni",text:"\u043d\u0435 \u0437\u043d\u0430\u0445\u043e\u0434\u0438\u0442\u044c\u0441\u044f \u0432"},{oper:"ew",text:"\u0437\u0430\u043a\u0456\u043d\u0447\u0443\u0454\u0442\u044c\u0441\u044f \u043d\u0430"},{oper:"en",text:"\u043d\u0435 \u0437\u0430\u043a\u0456\u043d\u0447\u0443\u0454\u0442\u044c\u0441\u044f \u043d\u0430"},{oper:"cn",text:"\u043c\u0456\u0441\u0442\u0438\u0442\u044c"},{oper:"nc",text:"\u043d\u0435 \u043c\u0456\u0441\u0442\u0438\u0442\u044c"},{oper:"nu",text:"is null"},{oper:"nn",text:"is not null"}],groupOps:[{op:"AND",text:"\u0432\u0441\u0435"},{op:"OR",text:"\u0431\u0443\u0434\u044c-\u044f\u043a\u0438\u0439"}],operandTitle:"Click to select search operation.",resetTitle:"Reset Search Value"},edit:{addCaption:"\u0414\u043e\u0434\u0430\u0442\u0438 \u0437\u0430\u043f\u0438\u0441",editCaption:"\u0417\u043c\u0456\u043d\u0438\u0442\u0438 \u0437\u0430\u043f\u0438\u0441",bSubmit:"\u0417\u0431\u0435\u0440\u0435\u0433\u0442\u0438",bCancel:"\u0412\u0456\u0434\u043c\u0456\u043d\u0430",bClose:"\u0417\u0430\u043a\u0440\u0438\u0442\u0438",saveData:"\u0414\u043e \u0434\u0430\u043d\u043d\u0438\u0445 \u0431\u0443\u043b\u0438 \u0432\u043d\u0435\u0441\u0435\u043d\u0456 \u0437\u043c\u0456\u043d\u0438! \u0417\u0431\u0435\u0440\u0435\u0433\u0442\u0438 \u0437\u043c\u0456\u043d\u0438?",bYes:"\u0422\u0430\u043a",bNo:"\u041d\u0456",bExit:"\u0412\u0456\u0434\u043c\u0456\u043d\u0430",msg:{required:"\u041f\u043e\u043b\u0435 \u0454 \u043e\u0431\u043e\u0432'\u044f\u0437\u043a\u043e\u0432\u0438\u043c",number:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043f\u0440\u0430\u0432\u0438\u043b\u044c\u043d\u0435 \u0447\u0438\u0441\u043b\u043e",minValue:"\u0437\u043d\u0430\u0447\u0435\u043d\u043d\u044f \u043f\u043e\u0432\u0438\u043d\u043d\u0435 \u0431\u0443\u0442\u0438 \u0431\u0456\u043b\u044c\u0448\u0435 \u0430\u0431\u043e \u0434\u043e\u0440\u0456\u0432\u043d\u044e\u0454",maxValue:"\u0437\u043d\u0430\u0447\u0435\u043d\u043d\u044f \u043f\u043e\u0432\u0438\u043d\u043d\u043e \u0431\u0443\u0442\u0438 \u043c\u0435\u043d\u0448\u0435 \u0430\u0431\u043e \u0434\u043e\u0440\u0456\u0432\u043d\u044e\u0454",email:"\u043d\u0435\u043a\u043e\u0440\u0435\u043a\u0442\u043d\u0430 \u0430\u0434\u0440\u0435\u0441\u0430 \u0435\u043b\u0435\u043a\u0442\u0440\u043e\u043d\u043d\u043e\u0457 \u043f\u043e\u0448\u0442\u0438",integer:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0435\u043d\u043d\u044f \u0434\u0456\u0439\u0441\u043d\u0435 \u0446\u0456\u043b\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u043d\u044f",date:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0435\u043d\u043d\u044f \u0434\u0456\u0439\u0441\u043d\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u043d\u044f \u0434\u0430\u0442\u0438",url:"\u043d\u0435 \u0434\u0456\u0439\u0441\u043d\u0438\u0439 URL. \u041d\u0435\u043e\u0431\u0445\u0456\u0434\u043d\u0430 \u043f\u0440\u0438\u0441\u0442\u0430\u0432\u043a\u0430 ('http://' or 'https://')",nodefined:" is not defined!",novalue:" return value is required!",customarray:"Custom function should return array!",customfcheck:"Custom function should be present in case of custom checking!"}},view:{caption:"\u041f\u0435\u0440\u0435\u0433\u043b\u044f\u043d\u0443\u0442\u0438 \u0437\u0430\u043f\u0438\u0441",bClose:"\u0417\u0430\u043a\u0440\u0438\u0442\u0438"},del:{caption:"\u0412\u0438\u0434\u0430\u043b\u0438\u0442\u0438",msg:"\u0412\u0438\u0434\u0430\u043b\u0438\u0442\u0438 \u043e\u0431\u0440\u0430\u043d\u0438\u0439 \u0437\u0430\u043f\u0438\u0441(\u0438)?",bSubmit:"\u0412\u0438\u0434\u0430\u043b\u0438\u0442\u0438",bCancel:"\u0412\u0456\u0434\u043c\u0456\u043d\u0430"},nav:{edittext:" ",edittitle:"\u0417\u043c\u0456\u043d\u0438\u0442\u0438 \u0432\u0438\u0431\u0440\u0430\u043d\u0438\u0439 \u0437\u0430\u043f\u0438\u0441",addtext:" ",addtitle:"\u0414\u043e\u0434\u0430\u0442\u0438 \u043d\u043e\u0432\u0438\u0439 \u0437\u0430\u043f\u0438\u0441",deltext:" ",deltitle:"\u0412\u0438\u0434\u0430\u043b\u0438\u0442\u0438 \u0432\u0438\u0431\u0440\u0430\u043d\u0438\u0439 \u0437\u0430\u043f\u0438\u0441",searchtext:" ",searchtitle:"\u0417\u043d\u0430\u0439\u0442\u0438 \u0437\u0430\u043f\u0438\u0441\u0438",refreshtext:"",refreshtitle:"\u041e\u043d\u043e\u0432\u0438\u0442\u0438 \u0442\u0430\u0431\u043b\u0438\u0446\u044e",alertcap:"\u041f\u043e\u043f\u0435\u0440\u0435\u0434\u0436\u0435\u043d\u043d\u044f",alerttext:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0438\u0431\u0435\u0440\u0456\u0442\u044c \u0437\u0430\u043f\u0438\u0441",viewtext:"",viewtitle:"\u041f\u0435\u0440\u0435\u0433\u043b\u044f\u043d\u0443\u0442\u0438 \u043e\u0431\u0440\u0430\u043d\u0438\u0439 \u0437\u0430\u043f\u0438\u0441"},col:{caption:"\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u0438/\u041f\u0440\u0438\u0445\u043e\u0432\u0430\u0442\u0438 \u0441\u0442\u043e\u0432\u043f\u0446\u0456",bSubmit:"\u0417\u0431\u0435\u0440\u0435\u0433\u0442\u0438",bCancel:"\u0412\u0456\u0434\u043c\u0456\u043d\u0430"},errors:{errcap:"\u041f\u043e\u043c\u0438\u043b\u043a\u0430",nourl:"URL \u043d\u0435 \u0437\u0430\u0434\u0430\u043d",norecords:"\u041d\u0435\u043c\u0430\u0454 \u0437\u0430\u043f\u0438\u0441\u0456\u0432 \u0434\u043b\u044f \u043e\u0431\u0440\u043e\u0431\u043a\u0438",model:"\u0427\u0438\u0441\u043b\u043e \u043f\u043e\u043b\u0456\u0432 \u043d\u0435 \u0432\u0456\u0434\u043f\u043e\u0432\u0456\u0434\u0430\u0454 \u0447\u0438\u0441\u043b\u0443 \u0441\u0442\u043e\u0432\u043f\u0446\u0456\u0432 \u0442\u0430\u0431\u043b\u0438\u0446\u0456!"},formatter:{integer:{thousandsSeparator:" ",defaultValue:"0"},number:{decimalSeparator:",",thousandsSeparator:" ",decimalPlaces:2,defaultValue:"0,00"},currency:{decimalSeparator:",",thousandsSeparator:" ",decimalPlaces:2,prefix:"",suffix:"",defaultValue:"0,00"},date:{dayNames:["\u041d\u0434","\u041f\u043d","\u0412\u0442","\u0421\u0440","\u0427\u0442","\u041f\u0442","\u0421\u0431","\u041d\u0435\u0434\u0456\u043b\u044f","\u041f\u043e\u043d\u0435\u0434\u0456\u043b\u043e\u043a","\u0412\u0456\u0432\u0442\u043e\u0440\u043e\u043a","\u0421\u0435\u0440\u0435\u0434\u0430","\u0427\u0435\u0442\u0432\u0435\u0440","\u041f'\u044f\u0442\u043d\u0438\u0446\u044f","\u0421\u0443\u0431\u043e\u0442\u0430"],monthNames:["\u0421\u0456\u0447","\u041b\u044e\u0442","\u0411\u0435\u0440","\u041a\u0432\u0456","\u0422\u0440\u0430","\u0427\u0435\u0440","\u041b\u0438\u043f","\u0421\u0435\u0440","\u0412\u0435\u0440","\u0416\u043e\u0432","\u041b\u0438\u0441","\u0413\u0440\u0443","\u0421\u0456\u0447\u0435\u043d\u044c","\u041b\u044e\u0442\u0438\u0439","\u0411\u0435\u0440\u0435\u0437\u0435\u043d\u044c","\u041a\u0432\u0456\u0442\u0435\u043d\u044c","\u0422\u0440\u0430\u0432\u0435\u043d\u044c","\u0427\u0435\u0440\u0432\u0435\u043d\u044c","\u041b\u0438\u043f\u0435\u043d\u044c","\u0421\u0435\u0440\u043f\u0435\u043d\u044c","\u0412\u0435\u0440\u0435\u0441\u0435\u043d\u044c","\u0416\u043e\u0432\u0442\u0435\u043d\u044c","\u041b\u0438\u0441\u0442\u043e\u043f\u0430\u0434","\u0413\u0440\u0443\u0434\u0435\u043d\u044c"],AmPm:["am","pm","AM","PM"],S:function(e){return 11>e||e>13?["st","nd","rd","th"][Math.min((e-1)%10,3)]:"th"},srcformat:"Y-m-d",newformat:"d.m.Y",parseRe:/[#%\\\/:_;.,\t\s-]/,masks:{ISO8601Long:"Y-m-d H:i:s",ISO8601Short:"Y-m-d",ShortDate:"n.j.Y",LongDate:"l, F d, Y",FullDateTime:"l, F d, Y G:i:s",MonthDay:"F d",ShortTime:"G:i",LongTime:"G:i:s",SortableDateTime:"Y-m-d\\TH:i:s",UniversalSortableDateTime:"Y-m-d H:i:sO",YearMonth:"F, Y"},reformatAfterEdit:!1},baseLinkUrl:"",showAction:"",target:"",checkbox:{disabled:!0},idName:"id"}})}(jQuery);