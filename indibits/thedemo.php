<?require_once("markdown.php");?>
<html>
	<body>
		<form method="POST" action="">
			<hr>
			the markup enter text here
			<hr>
			<br/>
			<textarea name="markuparea" rows="20" cols="75">
				<?php echo trim($_POST['markuparea']);?>
			</textarea>
			<br/>
			<input type="submit" name="submit" value="submit"/>
			<br/>
			<hr>
			the html markdown
			<hr>
			<br/>
			<textarea name="htmlarea" rows="20" cols="75" disabled="true">
				<?php
				if(($_POST['submit']=='submit')&&(isset($_POST['markuparea'])))
				{
					$html= Markdown(trim($_POST['markuparea']));
					echo $html;
				}
				?>
			</textarea>
			<hr>
			how it looks in the browser
			<br/>
			<fieldset>
				<?php
				echo $html;
				?>
			</fieldset>
		</form>
	</body>
</html>