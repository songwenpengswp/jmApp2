//liuliang  - 2010.4
(function($) {
    $.fn.pwdchk = function(target, options) {
        var defaults = {
            limit: 1
        };
        var checker = $(this);
        var control = $(target);
        var props = $.extend(defaults, options);
        control.keyup(function () {
            var len = checkStrengthTmp(control.val());
            checker.attr('isValid', len > 0?"true":"false");
            render(len);
        });
        //密码校验：根据Cloud.Passport.PasswordPolicy
        function checkStrengthTmp(txt) {
			//限制在6-20个字符之间
            if (!/^.{6,20}$/.test(txt))
                return 0;

			//不允许6个纯数字， 不允许123456， 不允许654321
            var basicRules = [/^(\w)\1+$/, /^654321$/, /^123456$/]
            for (var i = 0; basicRules[i]; i++) {
                if (basicRules[i].test(txt)) {
                    return 0;
                }
            }

            if (!/^[a-zA-Z0-9_]{6,20}$/.test(txt))
            {
                return 0;
            }

            //var Rules = [/^[A-Za-z_]{6,20}$|^[0-9]{6,20}$|^[\W]{6,20}$/,
            //             /(^(((\d+[a-zA-Z_]+)|([a-zA-Z_]+\d+))[0-9a-zA-Z_]*)$)|(^(((\d+[\W]+)|([\W]+\d+))[0-9\W]*)$)|(^((([\W_]+[a-zA-Z]+)|([a-zA-Z]+[\W_]+))[\W_a-zA-Z]*)$)/,
            //             /^(?!(?:[^a-zA-Z]+$|\D|(^[A-Za-z0-9]+$))$).{6,20}$/]
            var Rules = [/^(?!(?:[^a-zA-Z]+$|(^[^0-9]+$))$).{6,8}$/,
                /^(?!(?:[^a-zA-Z]+$|(^[^0-9]+$))$).{9,12}$/,
                /^(?!(?:[^a-zA-Z]+$|(^[^0-9]+$))$).{13,20}$/
                ]
            for (var i = 0; Rules[i]; i++) {
                if (Rules[i].test(txt)) {
                    return i + 1;
                }
            }

            //if (/^(?!(?:[^a-zA-Z]+$|\D|(^[A-Za-z0-9]+$))).{6,7}$/.test(txt))
            //    return 2;

            return 0;
        }

        var render = function(strength) {
            checker.html('');

            checker.html($("<table style='float:left; clear: left; color: black; height: 14px; width: 90px; margin-top:3px;' id='_pwdcktbl'><tr><td id='_pwdcktd1'></td><td id='_pwdcktd2'></td><td id='_pwdcktd3'></td></tr></table>"));
            var tip = '';
            switch (strength) {
                case 0:
                    {
                        $("#_pwdcktbl").hide();
                        checker.find('td').css('background-color', '#cccccc');
                        tip = '';
                    }
                    break;
                case 1: //弱
                    {
                        $("#_pwdcktbl").show();
                        checker.find('td').css('background-color', '#cccccc');
                        checker.find('#_pwdcktd1').css('background-color', '#dc9511');
                        tip = '弱';
                    } break;
                case 2: //普通
                    {
                        $("#_pwdcktbl").show();
                        checker.find('td').css('background-color', '#cccccc');
                        checker.find('#_pwdcktd1').css('background-color', '#c9b900')
                        checker.find('#_pwdcktd2').css('background-color', '#c9b900');
                        tip = '中';
                    } break;
                case 3: //强
                    {
                        $("#_pwdcktbl").show();
                        checker.find('td').css('background-color', '#5c9507');
                        tip = '强';
                        //alert(2);
                    } break;

                default: break;

            }
            checker.append(tip);
        };
		render(0);

    };

})(jQuery);