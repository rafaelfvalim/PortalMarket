!function(a){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate"],a):a(jQuery)}(function(a){a.extend(a.validator.messages,{required:"\u062a\u06a9\u0645\u06cc\u0644 \u0627\u06cc\u0646 \u0641\u06cc\u0644\u062f \u0627\u062c\u0628\u0627\u0631\u06cc \u0627\u0633\u062a.",remote:"\u0644\u0637\u0641\u0627 \u0627\u06cc\u0646 \u0641\u06cc\u0644\u062f \u0631\u0627 \u062a\u0635\u062d\u06cc\u062d \u06a9\u0646\u06cc\u062f.",email:".\u0644\u0637\u0641\u0627 \u06cc\u06a9 \u0627\u06cc\u0645\u06cc\u0644 \u0635\u062d\u06cc\u062d \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f",url:"\u0644\u0637\u0641\u0627 \u0622\u062f\u0631\u0633 \u0635\u062d\u06cc\u062d \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f.",date:"\u0644\u0637\u0641\u0627 \u06cc\u06a9 \u062a\u0627\u0631\u06cc\u062e \u0635\u062d\u06cc\u062d \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f",dateFA:"\u0644\u0637\u0641\u0627 \u06cc\u06a9 \u062a\u0627\u0631\u06cc\u062e \u0635\u062d\u06cc\u062d \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f",dateISO:"\u0644\u0637\u0641\u0627 \u062a\u0627\u0631\u06cc\u062e \u0635\u062d\u06cc\u062d \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f (ISO).",number:"\u0644\u0637\u0641\u0627 \u0639\u062f\u062f \u0635\u062d\u06cc\u062d \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f.",digits:"\u0644\u0637\u0641\u0627 \u062a\u0646\u0647\u0627 \u0631\u0642\u0645 \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f",creditcard:"\u0644\u0637\u0641\u0627 \u06a9\u0631\u06cc\u062f\u06cc\u062a \u06a9\u0627\u0631\u062a \u0635\u062d\u06cc\u062d \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f.",equalTo:"\u0644\u0637\u0641\u0627 \u0645\u0642\u062f\u0627\u0631 \u0628\u0631\u0627\u0628\u0631\u06cc \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f",extension:"\u0644\u0637\u0641\u0627 \u0645\u0642\u062f\u0627\u0631\u06cc \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f \u06a9\u0647 ",maxlength:a.validator.format("\u0644\u0637\u0641\u0627 \u0628\u06cc\u0634\u062a\u0631 \u0627\u0632 {0} \u062d\u0631\u0641 \u0648\u0627\u0631\u062f \u0646\u06a9\u0646\u06cc\u062f."),minlength:a.validator.format("\u0644\u0637\u0641\u0627 \u06a9\u0645\u062a\u0631 \u0627\u0632 {0} \u062d\u0631\u0641 \u0648\u0627\u0631\u062f \u0646\u06a9\u0646\u06cc\u062f."),rangelength:a.validator.format("\u0644\u0637\u0641\u0627 \u0645\u0642\u062f\u0627\u0631\u06cc \u0628\u06cc\u0646 {0} \u062a\u0627 {1} \u062d\u0631\u0641 \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f."),range:a.validator.format("\u0644\u0637\u0641\u0627 \u0645\u0642\u062f\u0627\u0631\u06cc \u0628\u06cc\u0646 {0} \u062a\u0627 {1} \u062d\u0631\u0641 \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f."),max:a.validator.format("\u0644\u0637\u0641\u0627 \u0645\u0642\u062f\u0627\u0631\u06cc \u06a9\u0645\u062a\u0631 \u0627\u0632 {0} \u062d\u0631\u0641 \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f."),min:a.validator.format("\u0644\u0637\u0641\u0627 \u0645\u0642\u062f\u0627\u0631\u06cc \u0628\u06cc\u0634\u062a\u0631 \u0627\u0632 {0} \u062d\u0631\u0641 \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f."),minWords:a.validator.format("\u0644\u0637\u0641\u0627 \u062d\u062f\u0627\u0642\u0644 {0} \u06a9\u0644\u0645\u0647 \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f."),maxWords:a.validator.format("\u0644\u0637\u0641\u0627 \u062d\u062f\u0627\u06a9\u062b\u0631 {0} \u06a9\u0644\u0645\u0647 \u0648\u0627\u0631\u062f \u06a9\u0646\u06cc\u062f.")})});