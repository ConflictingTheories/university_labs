<?php include("header.php"); ?>
<div id="title">Electrical Engineering</div>
<div id="subtitle">
	<?php
	switch($_GET['page'])
	{
		default:
			echo 'Table of Contents';
			break;
	}
	?>
</div>
<?php include("footer.php"); ?>