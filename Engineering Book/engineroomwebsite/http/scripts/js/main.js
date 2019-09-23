$(document).ready(function() {
	$("#navigation a").stop().animate({"paddingTop":"0px"},800);
	$("#navigation > li").hover(
		function () {
			$("a",$(this)).stop().animate({"paddingTop":"20px"},300);
		},
		function () {
			$("a",$(this)).stop().animate({"paddingTop":"0px"},300);
		}
	);
});

function setTheme(_theme)
{
	if(_theme == 'blue')
	{
		localStorage.setItem('theme','blue');
	}
	else if(_theme == 'normal')
	{
		localStorage.setItem('theme', 'normal');
	}
	window.location.reload();
}

if(localStorage.getItem('theme') == 'blue')
	document.write('<link id="ss" rel="stylesheet" type="text/css" href="/scripts/css/main-blue.css" />');
else
	document.write('<link id="ss" rel="stylesheet" type="text/css" href="/scripts/css/main.css" />');