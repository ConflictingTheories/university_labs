<?php include("header.php"); ?>
<!--Title-->
<div id="title">Mathematics</div>
<?php
	switch($_GET['page'])
	{
		case 'Arithmetic':
			echo '<div id="subtitle">Arithmetic</div>';
			include("math/arithmetic.php");
			break;
		case 'Geo':
			echo '<div id="subtitle">Geometry</div>';
			break;
		case 'Trig':
			echo '<div id="subtitle">Trigonometry</div>';
			break;	
		case 'Algebra':
			echo '<div id="subtitle">Algebra</div>';
			break;
		case 'LinAlgebra':
			echo '<div id="subtitle">Linear Algebra</div>';
			break;
		case 'CalcI':
			echo '<div id="subtitle">Calculus I</div>';
			break;
		case 'CalcII':
			echo '<div id="subtitle">Calculus II</div>';
			break;
		case 'DE':
			echo '<div id="subtitle">Differential Equations</div>';
			break;
		default:
			echo '<div id="subtitle">Table of Contents</div>';
			break;
	}
?>
<?php include("footer.php"); ?>