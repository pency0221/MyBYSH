﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resource/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="resource/js/login.js"></script>
<link href="resource/css/login2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	/* 注册成功的提示 */
	var msg = "${requestScope.tipMessage}";
	if (msg != "") {
		alert(msg);
	}

	/* 用户名是否存在验证 */
	$(function() {
		$("#user").change(function() {
			/*  alert("发送ajax请求"); */
			var val = $(this).val().trim();
			var $this = $(this);
			if (val != "") {
				$this.nextAll("font").remove();
				var url = "user-verifyUserName?userName=" + val;
				var args = {
					"time" : new Date()
				};
				$.post(url, args, function(data) {
					if (data == "no") {
						$this.after("<font  color='red'><b id='bky'>用户名已存在</b></font>");

						/* 	ts.val("用户名"); */
					} else {
						/* $this.after("<font color='green'><b>用户名可用</b></font>"); */

					}
				})

			}

		})

	})
</script>
</head>
<body>
	<h1>
		天忢众包欢迎您<sup>2018</sup>
	</h1>

	<div class="login" style="margin-top: 50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn_focus" id="switch_qlogin"
					href="javascript:void(0);" tabindex="7">登录</a> <a
					class="switch_btn" id="switch_login" href="javascript:void(0);"
					tabindex="8">快速注册</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>


		<div class="web_qr_login" id="web_qr_login"
			style="display: block; height: 235px;">

			<!--登录-->
			<div class="web_login" id="web_login">


				<div class="login-box">


					<div class="login_form">
						<form action="user-doLogin" name="loginform"
							accept-charset="utf-8" id="login_form" class="loginForm"
							method="post">
							<input type="hidden" name="did" value="0" /> <input
								type="hidden" name="to" value="log" />
							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">账号：</label>
								<div class="inputOuter"   id="uArea">

									<input type="text" id="u" placeholder="请输入用户名或手机号" name="userName" class="inputstyle" />
								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">密码：</label>
								<div class="inputOuter" id="pArea">

									<input type="password" id="p" placeholder="请输入密码" name="password"
										class="inputstyle" />
								</div>
							</div>

							<div style="padding-left: 50px; margin-top: 20px;">
								<input type="submit" value="登 录" style="width: 150px;"
									class="button_blue" />
							</div>
						</form>
					</div>

				</div>

			</div>
			<!--登录end-->
		</div>


		<!--注册-->
		<div class="qlogin" id="qlogin" style="display: none;">

			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8"
					action="user-doReg" method="post">
					<input type="hidden" name="to" value="reg" /> <input type="hidden"
						name="did" value="0" />
					<ul class="reg_form" id="reg-ul">
						<div id="userCue" class="cue">快速注册请注意格式</div>
						<li><label for="user" class="input-tips2">用户名：</label>
							<div class="inputOuter2">
								<input type="text" id="user" name="userName" maxlength="16"
									class="inputstyle2" />
							</div></li>

						<li><label for="passwd" class="input-tips2">密码：</label>
							<div class="inputOuter2">
								<input type="password" id="passwd" name="password"
									maxlength="16" class="inputstyle2" />
							</div></li>
						<li><label for="passwd2" class="input-tips2">确认密码：</label>
							<div class="inputOuter2">
								<input type="password" id="passwd2" name="" maxlength="16"
									class="inputstyle2" />
							</div></li>

						<li>
							<!--  <label for="qq" class="input-tips2">QQ：</label> --> <label
							for="qq" class="input-tips2">手机号：</label>
							<div class="inputOuter2">

								<input type="text" id="qq" name="phone" maxlength="11"
									class="inputstyle2" />
							</div>

						</li>

						<li>
							<div class="inputArea">
								<input type="button" id="reg"
									style="margin-top: 10px; margin-left: 120px;"
									class="button_blue" value="      注 册      " />
							</div>

						</li>
						<div class="cl"></div>
					</ul>
				</form>
			</div>
		</div>
		<!--注册end-->
	</div>
	<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>
</html>