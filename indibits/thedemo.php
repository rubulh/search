<?require_once("markdown.php");?>
<html>
	<body>
		<form method="POST" action="">
			<hr>
			<pre>the markup enter text here</pre>
			<hr>
			<br/>
			<textarea name="markuparea" rows="20" cols="75">
				<?php echo trim($_POST['markuparea']);?>
			</textarea>
			<br/>
			<input type="submit" name="submit" value="submit"/>
			<br/>
			<hr>
			<pre>the html markdown</pre>
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
			<pre>how it looks in the browser</pre>
			<br/>
			<fieldset>
				<?php
				echo $html;
				?>
			</fieldset>
		</form>
	</body>
</html>